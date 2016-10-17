function [K] = normConstantK(l,m)
%NORMCONSTANTK Calculate normalization constant K
%   K = normConstantK(l,m)
%   l: represents the band order [0,N] - integer N
%   m: "degree" [-l,l] (l as in L)

if nargin < 2 || m > l
    disp('Conditions: nargin = 2, m > L');
    return;
end

denominator = (2*l+1)*factorial((l-abs(m)));
numerator = 4*pi*factorial((l+abs(m)));

K = sqrt(denominator/numerator);

end