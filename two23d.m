function outputcoors = two23d(twodcoors, filename)
%TWO23D Give 2d coordinates and fetch 3d from original img
% make sure passing correct filename and coors


% Get location and color of pcd file
cloud = pcread(filename);
colors = cloud.Color;
locations = cloud.Location;

% Coordinates from 2d image
x = twodcoors(1);
y = twodcoors(2);

% Convertind 2d coordinates to equivalent pdc index and rounding
rlindx = double(double(x)*480)-double(480-y);
intidx = round(rlindx);
pcdidx = locations(intidx,:);

twodimg = imread('2dface_1_1.jpg');
imshow(twodimg);
% Draw chosen coordinates on 2d image
viscircles(twodcoors, 5 ,'LineStyle','--');

disp('2d INDEX...');
disp(rlindx);
disp('PCD INDEX...');
disp(pcdidx);

outputcoors = pcdidx;
% newpc = pointCloud(locations, 'Color',colors);
% 
% pcshow(newpc);

end

