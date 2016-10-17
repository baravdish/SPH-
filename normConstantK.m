function [K] = normConstantK(l,m)
% The index l represents the band order
% l: band index
% m: [-l,l] degree OBS!! Solve index structure for m!!

denominator = (2*l+1)*factorial((l-abs(m)));
numerator = 4*pi*factorial((l+abs(m)));

K = sqrt(denominator/numerator);
end