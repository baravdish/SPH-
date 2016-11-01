function [y] = sphericalharmonic(l,m,theta,phi, vars)
%SPHERICALHARMONIC Calculate sample of spherical harmonic basis function y
%   y = sphericalharmonic(l,m,theta,phi)
%   l: band index [0,N] - integer N
%   m: "degree" [-l,l] (l as in L)
%   theta: 0 < theta <= pi - double check this
%   phi: 0 < phi <= 2pi - double check this
%   vars: lookup table
% Author: Gabriel Baravdish

% Debug note normalizeK: Confirmed correct, since l = 0, m = 0 => sphere. Other values
% of K gives an ellipsoid 

% There are 3 cases for y(theta,phi): m > 0, m = 0, m < 0
% P is just for trace
if m > 0
    K = normalizeK(l,m,vars);
    P = legendrepolynomial(l,m,cos(theta),vars); % Debug note: Confirmed correct - see groundTruth.m
    y = sqrt(2)*K*cos(m*phi)*P;
elseif m < 0
    K = normalizeK(l,-m,vars);
    P = legendrepolynomial(l,-m,cos(theta),vars);
    y = sqrt(2)*K*sin(-m*phi)*P;
else % m == 0
    P = legendrepolynomial(l,0,cos(theta),vars);
    y = normalizeK(l,0,vars)*P;
end

end


















