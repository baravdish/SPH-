function [f] = intensityfunction(theta,phi)
%INTENSITYFUNCTION Return a pre-defined function by (theta,phi)
%   theta: 0 < theta <= pi
%   phi: 0 < phi <= 2pi
% 
% Author: Gabriel Baravdish

f = max(0, 5*cos(theta)-4) + ...
    max(0, -4*sin(theta-pi)*cos(phi-2.5)-3);