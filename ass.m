<<<<<<< HEAD
cloud = pcread('3/3_12.pcd');
=======
cloud = pcread('2/2_2.pcd');
>>>>>>> 5e44f1e60a9f6db9ecc757aa0e0e48fb25deb8a9
% pcshow(cloud)

% Filter for NaN and inf values
% cloud = removeInvalidPoints(cloud);
loc_pc = cloud.Location;
color_pc = im2double(cloud.Color);

color_pc(:,1) = im2double(color_pc(:,1));
color_pc(:,2) = im2double(color_pc(:,2));
color_pc(:,3) = im2double(color_pc(:,3));

filtered_image = reshape(rgb2hsv(color_pc),[640,480,3]);

mask = find(filtered_image(:,:,2)<0.27);

loc_pc(mask,:) = 0;
color_pc(mask,:) = 0;

color_pc = reshape(color_pc, [640,480,3]);
gray = rgb2gray(color_pc);

mask_c = bwareaopen(gray, 1500);
color_cont = bsxfun(@times, color_pc, cast(mask_c, 'like', color_pc));
%subplot(1,2,1), imshow(color_pc);
%subplot(1,2,2), imshow(color_cont);

imwrite(color_cont, 'face_2_2.jpg');

% contours = imcontour(gray,20);
% 
% for c = contours
%     disp(c);
% end
%imshow(contours);

%new = pointCloud(loc_pc, 'Color', color_pc);

% pcshow(new)

%imshow(reshape(color_pc, [640,480,3]))