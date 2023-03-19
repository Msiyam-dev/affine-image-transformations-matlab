% Read the image
img = imread('abid.PNG');
imshow(img);

% Define the transformation parameters
theta = 30; % rotation angle in degrees
tx = 50; % translation in x direction
ty = -30; % translation in y direction
Sx = 1.5; % scaling factor in x direction
Sy = 0.8; % scaling factor in y direction
shx = 0.2; % horizontal shear factor
shy = -0.1; % vertical shear factor

% Define the affine transformation matrices
Rot = [cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1];
Rot(:, end) = [0; 0; 1];
Trans = [1 0 0; 0 1 0; tx ty 1];
Trans(:, end) = [0; 0; 1];
Scale = [Sx 0 0; 0 Sy 0; 0 0 1];
Scale(:, end) = [0; 0; 1];
Shear = [1 shx 0; shy 1 0; 0 0 1];
Shear(:, end) = [0; 0; 1];

% Apply the transformations
tform = affine2d(Rot);
imgRot = imwarp(img, tform);
figure, imshow(imgRot);

tform = affine2d(Trans);
imgTrans = imwarp(img, tform);
figure, imshow(imgTrans);

tform = affine2d(Scale);
imgScale = imwarp(img, tform);
figure, imshow(imgScale);

tform = affine2d(Shear);
imgShear = imwarp(img, tform);
figure, imshow(imgShear);
