function [K] = normalizeK(l,m, vars)
%NORMALIZEK Calculate normalization constant K
%   K = normalizeK(l,m)
%   l: represents the band order [0,N] - integer N
%   m: "degree" [-l,l] (l as in L)
%   vars: lookup table
% Author: Gabriel Baravdish

if nargin < 2 || m > l
    disp('Conditions: nargin = 2, m > L');
    return;
end


% Lookup table
% FACT = vars.FACT;
% try
%     FACT = evalin('base','FACT');
% catch
%     warning('In normalizeK, could not load vars from workspace');
%     return;
% end

% denominator = (2*l+1)*FACT((l-m+1));
% numerator = 4*pi*FACT((l+m+1));

% gamma 
n = l+m;
if m == l
    denominator = (2*l+1)*1;
    numerator = 4*pi*gamma((n+1));
elseif l - m == 1
    denominator = (2*l+1)*1;
    numerator = 4*pi*gamma((n+1));
elseif l - m == 2
    denominator = (2*l+1)*2;
    numerator = 4*pi*gamma((n+1));
else
    denominator = (2*l+1)*gamma(l-m+1);
    numerator = 4*pi*gamma((l+m+1));
end

K = sqrt(denominator/numerator);

end