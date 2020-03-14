function new = segment(cloud)

loc_pc = cloud.Location;
color_pc = im2double(cloud.Color);

filtered_image = reshape(rgb2hsv(color_pc),[640,480,3]);
mask = find(filtered_image(:,:,2)<0.27);
mask2 = find(loc_pc(:,3)>1.5);
color_pc(mask,:) = NaN;
color_pc(mask2,:) = NaN;
loc_pc(mask2,3) = NaN;

color_pc = reshape(color_pc, [640,480,3]);
gray = rgb2gray(color_pc);

mask_c = bwareaopen(gray, 1500);
color_cont = bsxfun(@times, color_pc, cast(mask_c, 'like', color_pc));
color_reshaped = reshape(color_cont,[307200,3]);

new = removeInvalidPoints(pointCloud(loc_pc, 'Color', color_reshaped));
end