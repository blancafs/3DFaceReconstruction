% extracting pcd coordinates from 2d.
pc_coors1 = two23d([236.9416 234.0864],  '1/1_1.pcd');
pc_coors2 = two23d([234.0864  382.5602],  '1/1_2.pcd');

% reading pc clouds for two images and getting colour and location arrays.
pc1 = pcread('1/1_1.pcd');
pc2 = pcread('1/1_2.pcd');
pc1_color = pc1.Color;
pc2_color = pc2.Color;
pc1_loc = pc1.Location;
pc2_loc = pc2.Location;

% change colour of pixels around the pcd coordinates to red by index
indx = pc1_loc==pc_coors1;

new = pointCloud(pc1_loc, 'Color', pc1_color);

pcshow(new);
