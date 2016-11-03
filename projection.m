% %% Load
% load SPH_5050_01.mat
% load vars
% vars.FACT = FACT; % Pre-computed factorial, used for LUT
% vars.FACT2 = FACT2; % Pre-computed double factorial, used for LUT

%% Initialization
clearvars -except vars SPH
clc

I = initimage('village.jpg', 0.1, true);
% ======== Blur image ========
% sigma = 3;
% I = imgaussfilt(I, sigma);
% ======== --- ========

% Initialize variables
L = 50; % Bands
M = 50; % 'Degree'
PHI = linspace(0,2*pi,size(I,2));
THETA = linspace(0,pi,size(I,1));
[PHI,THETA] = meshgrid(PHI,THETA);

%% Reconstruction
% Number of color channels in image
if gt(size(I,3), 1)
    nChannels = size(I,3);
else
    nChannels = 1;
end

% Start reconstruction process
reconstructedImage = zeros(size(I));
tic
for i = 1:nChannels
    % Calculate coefficients and reconstruct
    C = sphcoefficients(I(:,:,i), SPH, L);
    reconstructedImage(:,:,i) = sphreconstruction(I(:,:,i), C, SPH, L);
end
toc

% Show result
if exists(sigma)
    strOriginal = sprintf('Original image, sigma = %i', sigma);
else
    strOriginal = sprintf('Original image');
end

strReconstructed = sprintf('Reconstructed image, bands l = %i (%i coefficients)', L, length(C(:)));

figure(1)
imshow(I);
title(strOriginal);
figure(2)
imshow(reconstructedImage);
title(strReconstructed);

















