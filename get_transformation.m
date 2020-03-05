function [rotation, translation] = get_transformation(A,B)
% Given two point clouds get rotation and translation matrices

centroid_A = mean(A,1);
centroid_B = mean(B,1);

to_origin_A = A-centroid_A;
to_origin_B = B-centroid_B;

H = transpose(to_origin_A)*to_origin_B;
[U,~,V] = svd(H);

rotation = V*transpose(U);

if det(rotation) < 0
    V(:,3) = V(:,3) .* -1;
    rotation = V*transpose(U);
end
translation = centroid_B - centroid_A*rotation;
end