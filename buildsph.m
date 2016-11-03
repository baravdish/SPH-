function [SPH] = buildsph(L, M, THETA, PHI, vars)
% ================= TEST =================
% 0.01, [10,10] - 0.6
% 0.05, [10,10] - 16
% 0.1, [10,10] - 65
% ================= WITH LUT ================
% 0.01, [10,10] - 0.1
% 0.05, [10,10] - 2
% 0.1, [10,10] - 8
% PHI = linspace(0,2*pi,size(I,2));
% THETA = linspace(0,pi,size(I,1));
% [PHI,THETA] = meshgrid(PHI,THETA);
% [X,Y,Z] = sph2cart(THETA,PHI,1);
% surf(X,Y,Z,I);
% shading interp
% colormap gray


thetaSize = size(THETA,1);
phiSize = size(PHI,2);
SPH = zeros(thetaSize,phiSize,L,2*M+1);

for l = 31:40
    for m = -l:l
        for t = 1:thetaSize
            for p = 1:phiSize
                SPH(t,p,l+1,m+l+1) =  ...
                sphericalharmonic(l,m,THETA(t,1),PHI(1,p),vars);
            end
        end
    end
end

end