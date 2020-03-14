function translated_pcd = translate(Image1, Image2,cloud,pcd1,pcd2)

I1 = rgb2gray(imread(Image1));
I2 = rgb2gray(imread(Image2));

[locations1, locations2] = SURF_final(I1,I2);

loc1 = two23d(locations1, pcread(pcd1));
loc2 = two23d(locations2, pcread(pcd2));

% [rotation, translation] = get_transformation(loc1, loc2);

loc1_matrix = readXYZ(loc1);
loc2_matrix = readXYZ(loc2);

[~, first_transform ,~] = absor(loc1_matrix,loc2_matrix);

% loc_pc = cloud.Location;
% color_pc = im2double(cloud.Color);
% new_loc_pc = loc_pc*rotation + translation;
first_translated_pcd = pctransform(cloud,first_transform);

% first_translated_pcd = pointCloud(new_loc_pc, 'Color', color_pc);

% Uncomment to translate additionally using pcregistericp

% transform = pcregistericp(pcdownsample(first_translated_pcd,'gridAverage',0.01),pcdownsample(segment(pcread(pcd2)),'gridAverage',0.01));
transform = pcregistericp(first_translated_pcd,segment(pcread(pcd2)));
translated_pcd = pctransform(first_translated_pcd,transform);
end

