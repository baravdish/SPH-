function [reconstruction] = sphreconstruction(I, C, SPH, L)

reconstruction = zeros(size(I));
for l = 0:L
    for m = -l:l
        reconstruction = reconstruction + C(l+1,m+l+1)*SPH(:,:,l+1,m+l+1);
    end
end

end