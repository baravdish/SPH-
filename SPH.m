%% Main
% ================================
% Ground truth table: (StupidSHTricks36.pdf Appendix A2) by Peter Sloan
% ================================
clear
clc

m = 0;
l = 1;

% Debug note: Y(theta,phi) confirmed correct - see groundTruth.m (for a
% single direction (theta,phi) up to l,m = 2,2 - might check for all directions
% theta = pi/4;
% phi = pi/3;
% y = SH(l,m,theta,phi)

Phi = linspace(0,2*pi);
Theta = linspace(-pi/2,pi/2);
[Phi,Theta] = meshgrid(Phi,Theta);
% Confirm that the grid is correct:
% [X,Y,Z] = sph2cart(Theta,Phi,1);
% surf(X,Y,Z);
% r = sqrt(X(1,1).^2 + Y(1,1).^2 + Z(1,1).^2);

for t = 1:size(Theta,2)
    for p = 1:size(Phi,1)
        y(t,p) = abs(SH(l,m,Theta(t,1),Phi(1,p)));
%         y(t,p) = sqrt(3)*Theta(t,1)/(2*sqrt(pi));
    end
end

% kolla viewporten
[X,Y,Z] = sph2cart(Theta,Phi,y);
surf(X,Y,Z);
% axis([-0.5 0.5 -0.5 0.5])

% 1) create a grid of elevation and azimuth angles
% 2) calculate the radius of spherical harmonic points over the grid
% 3) convert elevation, azimuth and radius to Cartesian
% 4) surf




















