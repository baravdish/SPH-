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

m = 0;
l = 1;

% Debug note: Y(theta,phi) confirmed correct - see groundTruth.m 
% theta = pi/4;
% phi = pi/3;
% y = sphericalharmonic(l,m,theta,phi)

Phi = linspace(0,2*pi);
Theta = linspace(0,pi);
[Phi,Theta] = meshgrid(Phi,Theta);
% Confirm that the grid is correct:
% [X,Y,Z] = sph2cart(Theta,Phi,1);
% surf(X,Y,Z);
% r = sqrt(X(1,1).^2 + Y(1,1).^2 + Z(1,1).^2);
y = zeros(size(Theta,2), size(Phi,1));

for t = 1:size(Theta,2)
    for p = 1:size(Phi,1)
        y(t,p) = sphericalharmonic(l,m,Theta(t,1),Phi(1,p));
        % Ground truth for l = 1, m = 0:
%         y(t,p) = sqrt(3)*Theta(t,1)/(2*sqrt(pi)); 
    end
end

% check the viewport?
[X,Y,Z] = sph2cart(Theta,Phi,y);
surf(X,Y,Z);





















