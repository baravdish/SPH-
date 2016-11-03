function [reconstruction] = sphreconstruction(I, C, SPH, L)
%SPHRECONSTRUCTION Reconstruct image I with coefficients C and SPH functions
% SPH
%   reconstruction = SPHRECONSTRUCTION(I, C, SPH, L)
%   L: band index [0,N] - integer N
%   C: SPH Coefficients
%   SPH: Spherical harmonic base function - 4D SPH(theta,phi,l,m)
%   
% Author: Gabriel Baravdish

% Sum the coefficients
% Note nested loops, but limit is ~50*50 iterations = no problems
reconstruction = zeros(size(I));
for l = 0:L
    for m = -l:l
        % Sum(c*y)
        reconstruction = reconstruction + C(l+1,m+l+1)*SPH(:,:,l+1,m+l+1);
    end
end

end