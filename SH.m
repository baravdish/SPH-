function [y] = SH(l,m,theta,phi)
%SH Calculate sample of basis function y
%   y = SH(l,m,theta,phi)
%   l: band index [0,N] - integer N
%   m: "degree" [-l,l] (l as in L)
%   theta: 0 < theta <= 2pi - double check this
%   phi: 0 < phi <= pi - double check this

% Normalization constant K
K = normConstantK(l,m);

% There are 3 cases for y(theta,phi): m > 0, m = 0, m < 0
% P is just for trace
if m > 0
    P = LegendrePoly(l,m,cos(theta));
    y = sqrt(2)*K*cos(m*phi)*P;
elseif m < 0
    P = LegendrePoly(l,-m,cos(theta));
    y = sqrt(2)*K*sin(-m*phi)*P;
else % m == 0
    P = LegendrePoly(l,0,cos(theta));
    y = K*P;
end

end

