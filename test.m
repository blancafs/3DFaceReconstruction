images{1} = '2d_face1/face_1_1.jpg';
images{2} = '2d_face1/face_1_2.jpg';
images{3} = '2d_face1/face_1_3.jpg';
images{4} = '2d_face1/face_1_4.jpg';
images{5} = '2d_face1/face_1_5.jpg';
images{6} = '2d_face1/face_1_6.jpg';
images{7} = '2d_face1/face_1_7.jpg';
images{8} = '2d_face1/face_1_8.jpg';
images{9} = '2d_face1/face_1_9.jpg';
images{10} = '2d_face1/face_1_10.jpg';
images{11} = '2d_face1/face_1_11.jpg';
images{12} = '2d_face1/face_1_12.jpg';
images{13} = '2d_face1/face_1_13.jpg';
images{14} = '2d_face1/face_1_14.jpg';
images{15} = '2d_face1/face_1_15.jpg';

pcd{1} = '1/1_1.pcd';
pcd{2} = '1/1_2.pcd';
pcd{3} = '1/1_3.pcd';
pcd{4} = '1/1_4.pcd';
pcd{5} = '1/1_5.pcd';
pcd{6} = '1/1_6.pcd';
pcd{7} = '1/1_7.pcd';
pcd{8} = '1/1_8.pcd';
pcd{9} = '1/1_9.pcd';
pcd{10} = '1/1_10.pcd';
pcd{11} = '1/1_11.pcd';
pcd{12} = '1/1_12.pcd';
pcd{13} = '1/1_13.pcd';
pcd{14} = '1/1_14.pcd';
pcd{15} = '1/1_15.pcd';

for n = 1:4
    cloud = segment(pcread(pcd{n}));
    for i = n:4
        disp('translating frame')
        disp(i)
        cloud = translate(images{i},images{i+1},cloud,pcd{i},pcd{i+1});
    end
    disp('done translating frame')
    disp(n)
    fname = sprintf('merged%d.pcd', n);
    pcwrite(cloud, fname);
end


