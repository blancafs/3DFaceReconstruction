function face = get2dface(cloud)
%GET2DFACE Summary of this function goes here
%   Detailed explanation goes here
loc_pc = cloud.Location;
color_pc = im2double(cloud.Color);

filtered_image = reshape(rgb2hsv(color_pc),[640,480,3]);
mask = find(filtered_image(:,:,2)<0.27);
mask2 = find(loc_pc(:,3)>1.5);
color_pc(mask,:) = 0;
color_pc(mask2,:) = 0;
% disp(mask2)
loc_pc(mask2,3) = 0;

color_pc = reshape(color_pc, [640,480,3]);
gray = rgb2gray(color_pc);

mask_c = bwareaopen(gray, 1500);
face = bsxfun(@times, color_pc, cast(mask_c, 'like', color_pc));

end

