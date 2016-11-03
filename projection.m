% % %% Load
% load SPH_5050_01.mat
% load vars
% vars.FACT = FACT; % Pre-computed factorial, used for LUT
% vars.FACT2 = FACT2; % Pre-computed double factorial, used for LUT

%% Initialization
clearvars -except vars SPH 
clc

I = initimage('village.jpg', 0.1, true);
% ======== Blur image ========
% sigma = 1;
% I = imgaussfilt(I, sigma);
% ======== --- ========

% Initialize variables
L = 30; % Bands
M = 0; % 'Degree'
PHI = linspace(0,2*pi,size(I,2));
THETA = linspace(0,pi,size(I,1));
[PHI,THETA] = meshgrid(PHI,THETA);
% Intensity map
intensity = max(0, 5*cos(THETA)-4).*sin(THETA) + ...
            max(0,(-4*sin(THETA-pi)).*cos(PHI-2.5)-3);
% intensity = intensity';
I = intensity;
%% Reconstruction

reconstructedImage = sphreconstruction(I,SPH,L);

strOriginal = sprintf('Original image');
strReconstructed = sprintf('Reconstructed image, bands l = %i (%i coefficients)', L, L*L*2 + L);
figure
imshow(reconstructedImage);
title(strReconstructed);
%% Test images with bands
% load FIGURES.mat
% 
% j = 0;
% while 1
%     j = mod(j,length(F));
%     j = j + 1;
%     imshow(F(j).cdata);
%     drawnow
%     F(j) = getframe;
%     pause
% end


%% Testing on a circle
% 
% PHI = linspace(0,2*pi,100);
% THETA = linspace(0,pi,200);
% [PHI,THETA] = meshgrid(PHI,THETA);

% Intensity map
% intensity = max(0, 5*cos(THETA)-4).*sin(THETA) + ...
%             max(0,(-4*sin(THETA-pi)).*cos(PHI-2.5)-3);
[X,Y,Z] = sph2cart(THETA,PHI,1);
h = surf(X,Y,Z,reconstructedImage);
shading interp
colormap gray
% h.FaceLighting = 'gouraud';


%% Sinus pattern



























