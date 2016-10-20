function [df] = fact2(n)
% FACT2 - Calculate the double factorial.
% Author: Gabriel Baravdish

if nargin < 1
    disp('Too few arguments!');
elseif n < 0
    disp('Bad input! n >= 0');
    return
elseif n == 0 || n == 1
    df = 1;
    return
end

df = 1;
for i = n:-2:1
    df = df*i;
end

end