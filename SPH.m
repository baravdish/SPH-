%% Main
% ================================
% Ground truth table: (StupidSHTricks36.pdf Appendix A2) by Peter Sloan
% ================================
clear
clc

theta = pi/4;
phi = pi/4;
l = 1;
m = 1;

y = SH(l,m,theta,phi)

%% Something
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
% 
% 













