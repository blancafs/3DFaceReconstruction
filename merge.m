pcd{1} = 'merged1.pcd';
pcd{2} = 'merged2.pcd';
pcd{3} = 'merged3.pcd';
pcd{4} = 'merged4.pcd';
pcd{5} = 'merged5.pcd';
pcd{6} = 'merged6.pcd';
pcd{7} = 'merged7.pcd';
pcd{8} = 'merged8.pcd';
pcd{9} = 'merged9.pcd';
pcd{10} = 'merged10.pcd';
pcd{11} = 'merged11.pcd';
pcd{12} = 'merged12.pcd';
pcd{13} = 'merged13.pcd';
pcd{14} = 'merged14.pcd';
pcd{15} = '1/1_15.pcd';

cloud = pcread(pcd{1});

for i = 2:5
    if i == 5
        cloud = pcmerge(cloud,segment(pcread('1/1_5.pcd')),0.0002);
    end
    cloud = pcmerge(cloud,pcread(pcd{i}),0.0002);
end

pcshow(cloud)