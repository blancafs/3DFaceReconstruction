function full_pcd = two23d(twodcoors, cloud)
%TWO23D Given 2d coordinates fetch 3d from original img
% make sure passing correct filename and coors


% Get location and color of pcd file
cloud = removeInvalidPoints(cloud);
locations = cloud.Location;

[row,~] = size(twodcoors);

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

end

