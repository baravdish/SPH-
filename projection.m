clear
clc
load vars
vars.FACT = FACT;
vars.FACT2 = FACT2;
clear i n N df ans
J = imread('village.jpg');
J = imresize(J, 0.1);

%% Test blur
I = initimage('village.jpg', 0.1);
load SPH_5050.mat
I = imgaussfilt(I, 3);

% 1. Cleanup the mess
% 2. Write a blur test properly
% 3. ???
% 4. Profit

%%
for i = 1:1
    tic
%     I = im2double(J(:,:,i));
    PHI = linspace(0,2*pi,size(I,2));
    THETA = linspace(0,pi,size(I,1));
    [PHI,THETA] = meshgrid(PHI,THETA);

    L = 50;
    M = 50;

    
    SPH = buildsph(L,M,THETA,PHI,vars);
    
    % Calculate coefficients and reconstruct
    C = sphcoefficients(I, SPH, L);

    reconstructedImage(:,:,i) = sphreconstruction(I, C, SPH, L);
    toc
end
% imshow(reconstructedImage);