function [C] = sphcoefficients(I, SPH, L)
% SPHCOEFFICIENTS Project SPH functions into SPH coefficients.
%   reconstruction = SPHCOEFFICIENTS(I, SPH, L)
%   L: band index [0,N] - integer N
%   SPH: Spherical harmonic base function - 4D SPH(theta,phi,l,m)
%   
% Author: Gabriel Baravdish

% Sum every product I(x,y)*Y(x,y) (integral), where I is the intensity function and y is SPH,
% the result is a dot product dot(I,Y) (or just I*Y if I and Y are vectors)
imageVec = I(:); % Make I to vector-form so we can use the dotproduct
weight = 4*pi;
C = zeros(L+1,2*L+1);
for l = 0:L
    for m = -l:l
        y = SPH(:,:,l+1,m+l+1); % Get the spherical harmonic functions for [l,m]
        yVec = y(:)'; % Fold to a vector
        C(l+1,m+l+1) =  weight*yVec*imageVec/length(yVec); % Simple product
    end
end

% C = 4*pi*C;

end