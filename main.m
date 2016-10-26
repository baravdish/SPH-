%% Main
% Main for spherical harmonic. Use sphericalharmonic(l,m,theta,phi)
% Author: Gabriel Baravdish
% Outline method:
% 1) Create a grid of theta and phi angles
% 2) Calculate the radius of spherical harmonic points over the grid
% 3) Convert theta, phi and radius to Cartesian
% 4) Plot
% =================================================================
clear
clc

% l - band index
% m - "degree" index
m = 0;
l = 0;

% Define Grid (check for [0,2pi] etc.)
PHI = linspace(0,2*pi);
THETA = linspace(0,pi);
[PHI,THETA] = meshgrid(PHI,THETA);
SIZE = length(THETA);
% Confirm that the grid looks good:
% [X,Y,Z] = sph2cart(Theta,Phi,1);
% surf(X,Y,Z);

y = zeros(SIZE, SIZE);
for t = 1:SIZE
    for p = 1:SIZE
        % Debug note: Y(theta,phi) confirmed correct - see groundTruth.m
        y(t,p) = sphericalharmonic(l,m,THETA(t,1),PHI(1,p));
        % Ground truth for l = 1, m = 0:
%         y(t,p) = sqrt(3)*Theta(t,1)/(2*sqrt(pi)); 
    end
end
% Radius already normalized?
% check the viewport?
[X,Y,Z] = sph2cart(THETA,PHI,y);
% surf(X,Y,Z);
% axis equal
% view(30,70);

%% Image projection



























