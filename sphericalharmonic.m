function [y] = SH(l,m,theta,phi)
%SH Calculate sample of basis function y
%   y = SH(l,m,theta,phi)
%   l: band index [0,N] - integer N
%   m: "degree" [-l,l] (l as in L)
%   theta: 0 < theta <= pi - double check this
%   phi: 0 < phi <= 2pi - double check this

% Normalization constant K
% Debug note: Confirmed correct, since l = 0, m = 0 => sphere. Other values
% of K gives an ellipsoid 

% There are 3 cases for y(theta,phi): m > 0, m = 0, m < 0
% P is just for trace
if m > 0
    K = normConstantK(l,m);
    P = LegendrePoly(l,m,cos(theta)); % Debug note: Confirmed correct - see groundTruth.m
    y = sqrt(2)*K*cos(m*phi)*P;
elseif m < 0
    K = normConstantK(l,-m);
    P = LegendrePoly(l,-m,cos(theta));
    y = sqrt(2)*K*sin(-m*phi)*P;
else % m == 0
    P = LegendrePoly(l,0,cos(theta));
    y = normConstantK(l,0)*P;
end

end


















