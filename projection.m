% azimuth/col theta
% elevation/row phi
% ================= TEST =================
% 0.01, [10,10] - 0.6
% 0.05, [10,10] - 16
% 0.1, [10,10] - 65
% ================= WITH LUT ================
% 0.01, [10,10] - 0.1
% 0.05, [10,10] - 2
% 0.1, [10,10] - 8

clear
clc
load vars
vars.FACT = FACT;
vars.FACT2 = FACT2;
clear i n N df ans
I = im2double(imread('village.jpg'));
I = rgb2gray(I);
I = imresize(I, 0.04);
PHI = linspace(0,2*pi,size(I,2));
THETA = linspace(0,pi,size(I,1));
[PHI,THETA] = meshgrid(PHI,THETA);
[X,Y,Z] = sph2cart(THETA,PHI,1);
% surf(X,Y,Z,I);
% shading interp
% colormap gray
thetaSize = size(THETA,1);
phiSize = size(PHI,2);

L = 40;
M = 40;
SPH = zeros(thetaSize,phiSize,L,2*M+1);

tic
for l = 0:L
    for m = -l:l
        for t = 1:thetaSize
            for p = 1:phiSize
                SPH(t,p,l+1,m+l+1) =  ...
                sphericalharmonic(l,m,THETA(t,1),PHI(1,p),vars);
            end
        end
    end
end
toc
%% Calculate C

iVec = I(:);
weight = 4*pi;
C = zeros(l+1,2*l+1);
for l = 0:L
    for m = -l:l
        y = SPH(:,:,l+1,m+l+1);
        yVec = y(:)';
        C(l+1,m+l+1) =  weight*yVec*iVec/length(yVec);
    end
end
% C = 4*pi*C;

FINAL = zeros(size(I));
for l = 0:L
    for m = -l:l
        FINAL = FINAL + C(l+1,m+l+1)*SPH(:,:,l+1,m+l+1);
    end
end
imshow(FINAL);
%     pause



%% Test - projection of a function f

% For a single sum expression: i=l(l+1)+m

% Intensity map
% intensity = max(0, 0.1*cos(THETA)-4) + ...
%             max(0,-0.05*sin(THETA)*cos(PHI-3)-3);
% lamb = max(0,cos(THETA));

% surf(X,Y,Z,intensity);
% colormap gray
% axis equal;
% shading interp
% view(140,15);
% N = SIZE*SIZE;
