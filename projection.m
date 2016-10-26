% function [I] = projection(I)
% PROJECTION - Project and image I on a sphere
% azimuth/col theta
% elevation/row phi
clear
clc

I = imread('village.jpg');
I = imresize(I, 0.1);
% I = permute(I,[1 2 3]);
% I = rgb2gray(I);
[row, col, c] = size(I);

PHI = linspace(0,2*pi,row);
THETA = linspace(0,pi,col);
[PHI,THETA] = meshgrid(THETA,PHI);

[X,Y,Z] = sph2cart(THETA,PHI,1);
warp(X,Y,Z,I);
shading interp
% end

















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

% for t = 1:SIZE
%     for p = 1:SIZE
%       c(i)
%     end
% end

