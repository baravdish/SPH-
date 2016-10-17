%% Main
% ================================
% Ground truth table: (StupidSHTricks36.pdf Appendix A2) by Peter Sloan
% ================================
clear
clc

theta = pi/4;
phi = pi/4;
l = 0;
m = 0;

y = SH(l,m,theta,phi)

%% Something
% 1) create a grid of elevation and azimuth angles
% help meshgrid
% 2) calculate the radius of the desired spherical harmonic points over the grid
% help legendre
% 3) convert elevation, azimuth and radius to Cartesian
% help sph2cart
% 4) produce a 3D surface plot
R = 1;
Phi = linspace(0,2*pi);
Theta = linspace(0,pi);
[Phi,Theta] = meshgrid(Phi,Theta);

for t = 1:size(Theta,2)
    for p = 1:size(Phi,1)
        theta = Theta(t,1);
        phi = Phi(1,p);
        y(t,p) = SH(l,m,theta,phi);
    end
end

figure
[X,Y,Z] = sph2cart(Theta,Phi,y);
surf(X,Y,Z);


% r = 100;
% [X,Y,Z] = sphere(r);
% [THETA, PHI, r] = cart2sph(X,Y,Z);
% surf(X,Y,Z);
% l = 1;
% m = -1;
% for t = 1:size(THETA,2)
%     for p = 1:size(PHI,1)
%         theta = THETA(2,t);
%         phi = PHI(p,2);
%         y(t,p) = SH(l,m,theta,phi);
%     end
% end
