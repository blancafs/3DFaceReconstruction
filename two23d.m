function full_pcd = two23d(twodcoors, filename)
%TWO23D Given 2d coordinates fetch 3d from original img
% make sure passing correct filename and coors


% Get location and color of pcd file
cloud = pcread(filename);
cloud = removeInvalidPoints(cloud);
locations = cloud.Location;

[row,col] = size(twodcoors);

full_pcd = zeros(row,3);

for i = 1:row
    % Coordinates from 2d image
    x = twodcoors(i,1);
    y = twodcoors(i,2);

    % Convert 2d coordinates to equivalent pdc 3d coordinates
    rlindx = sub2ind([480 640], y, x);
    linear_idx = round(rlindx);
    full_pcd(i,:) = locations(linear_idx,:);
end

% twodimg = imread('2dface_1_1.jpg');
% imshow(twodimg);
% Draw chosen coordinates on 2d image
% viscircles(twodcoors, 5 ,'LineStyle','--');

% disp('2d INDEX...');
% disp(rlindx);
% disp('PCD INDEX...');
% disp(pcdidx);

% outputcoors = pcdidx;

end

