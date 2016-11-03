function [reconstruction] = sphreconstruction(I, SPH, L)
%SPHRECONSTRUCTION Reconstruct image I with coefficients C and SPH functions
% SPH
%   reconstruction = SPHRECONSTRUCTION(I, SPH, L)
%   L: band index [0,N] - integer N
%   SPH: Spherical harmonic base function - 4D SPH(theta,phi,l,m)
%   
% Author: Gabriel Baravdish

% Number of color channels in image
if gt(size(I,3), 1)
    nChannels = size(I,3);
else
    nChannels = 1;
end

% Start reconstruction process
reconstruction = zeros(size(I));
for i = 1:nChannels
    
    % Calculate coefficients and reconstruct
    C = sphcoefficients(I(:,:,i), SPH, L);
    
    % Sum the coefficients
    % Note nested loops, but limit is ~50*50 iterations = no problems
    
    for l = 0:L
        for m = -l:l
            % Sum(c*y)
            reconstruction(:,:,i) = reconstruction(:,:,i) + C(l+1,m+l+1)*SPH(:,:,l+1,m+l+1);
        end
    end
end


end