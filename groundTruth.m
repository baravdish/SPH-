% GROUNDTRUTH - Use this to test against the ground truth 
% =======================================================
% Ground truth table, see: Stupid Spherical Harmonics Tricks by Peter Sloan
% =======================================================
% Author: Gabriel Baravdish

theta = pi/4;
phi = pi/3;
l = 1;
m = 0;

totalDifference = 0;
for t = linspace(0,pi,100)
    Y = sphericalharmonic(l,m,t,phi);
    truth = sqrt(3)*cos(t)/(2*sqrt(pi));
    if abs(Y-truth) > eps
        disp('Larger than double precision');
    end
    totalDifference = totalDifference + abs(Y - truth);
end
totalDifference


% ======== Few polynomial forms
% x = sin(theta)*cos(phi);
% y = sin(theta)*sin(phi);
% z = cos(theta);
% Y = sphericalharmonic(l,m,theta,phi)

% Ground truth, compare with Y:

% disp('l = 0, m = 0');
% 1/(2*sqrt(pi))
% disp('l = 1, m = -1');
% -sqrt(3)*y/(2*sqrt(pi))
% disp('l = 1, m = 0');
% sqrt(3)*z/(2*sqrt(pi))
% disp('l = 1, m = 1');
% -sqrt(3)*x/(2*sqrt(pi))
% disp('l = 2, m = -2');
% sqrt(15)*y*x/(2*sqrt(pi))
% disp('l = 2, m = -1');
% -sqrt(15)*y*z/(2*sqrt(pi))
% disp('l = 2, m = 0');
% sqrt(5)*(3*z^2 - 1)/(4*sqrt(pi))
% disp('l = 2, m = 1');
% -sqrt(15)*x*z/(2*sqrt(pi))
% disp('l = 2, m = 2');
% sqrt(15)*(x^2 - y^2)/(4*sqrt(pi))

















