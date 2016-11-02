function [C] = sphcoefficients(I, SPH, L)

imageVec = I(:);
weight = 4*pi;
C = zeros(L+1,2*L+1);
for l = 0:L
    for m = -l:l
        y = SPH(:,:,l+1,m+l+1);
        yVec = y(:)';
        C(l+1,m+l+1) =  weight*yVec*imageVec/length(yVec);
    end
end

% C = 4*pi*C;

end