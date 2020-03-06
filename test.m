% [outputcoors, li] = two23d([314.3558  387.4994],  '1/1_1.pcd');

% A = 315.2932  379.3199
% B = 314.3558  387.4994

% a pcd : -0.4539   -0.0001    2.4720
% b pcd :  0.1360   -0.0016    1.0020


I1 =  rgb2gray(imread('2d_face1/face_1_1.jpg'));
I2 =  rgb2gray(imread('2d_face1/face_1_2.jpg'));

[locations1, locations2] = SURF_final(I1,I2);

loc1 = two23d(locations1, '1/1_1.pcd');
loc2 = two23d(locations2, '1/1_2.pcd');

[rotation, translation] = get_transformation(loc1, loc2);

cloud = pcread('1/1_1.pcd');
loc_pc = cloud.Location;
color_pc = im2double(cloud.Color);

new_loc_pc = loc_pc*rotation + translation;

new = pointCloud(new_loc_pc, 'Color', color_pc);
% pcshow(cloud)
pcshow(new)