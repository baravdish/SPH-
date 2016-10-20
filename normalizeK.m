function [K] = normalizeK(l,m)
%NORMALIZEK Calculate normalization constant K
%   K = normalizeK(l,m)
%   l: represents the band order [0,N] - integer N
%   m: "degree" [-l,l] (l as in L)
% 
% Author: Gabriel Baravdish

if nargin < 2 || m > l
    disp('Conditions: nargin = 2, m > L');
    return;
end

denominator = (2*l+1)*factorial((l-m));
numerator = 4*pi*factorial((l+m));

K = sqrt(denominator/numerator);

end