I1 =  rgb2gray(imread('2d_face1/face_1_1.jpg'));
I2 =  rgb2gray(imread('2d_face1/face_1_2.jpg'));

points1 = detectSURFFeatures(I1);
points2 = detectSURFFeatures(I2);

[f1,vpts1] = extractFeatures(I1,points1);
[f2,vpts2] = extractFeatures(I2,points2);

indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

disp(matchedPoints1(1).Location);
locations1 = matchedPoints1.Location;
locations2 = matchedPoints2.Location;

disp(locations1)
figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
