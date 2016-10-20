function [P] = legendrepolynomial(l, m, x)
%LEGENDREPOLYNOMIAL Calculate Legendre polynomial P of band order l and "degree"
%   m, for a value x.
%   P = legendrepolynomial(l,m,x)
%   l: represents the band order [0,N] - integer N
%   m: "degree" [0,l] (l as in L)
%   x: value, represents x = cos(theta) => x in range [-1,1]
% Author: Gabriel Baravdish
% Details:
% This method consists of 3 rules or algorithms, which are described in - 
% Spherical Harmonic Lighting: The Gritty Details, Robin Green 2003 page 10

% =============================================================
% These comments are just for the author:
% De element som är ensamma i kolumnen tas fram med 2)
% De element som har 1 granne i kolumnen tas fram med 3)
% De element som har minst 2 grannar i kolumnen tas fram med 1)
% =============================================================
% Testa den här funktionen mot hårdkodad P(2,2) och kolla om de är lika
% =============================================================

% Check for bad input arguments
if m < 0 || m > l || abs(x) > 1 || nargin < 3
    disp('Bad arguments, conditions: m <= L, m >= 0, and abs(x) > 1')
    return;
end
% Old/future code:
% l = l+1; % increment to cover index (0,0) because it's (1,1) in matlab
% P = zeros(l+1,m+1);
% P(1,1) = pStart;

pStart = 1; % P(1,1)

Pmm = pStart; % Represents P(m,m)
P = Pmm;
Pm1 = 0; % R epresents P(m+1, m)
Pk = 0; % Represents P(k,m), where k < l
% Comments for author:
% Stega oss neråt kolumnvis tills vi har P_(l-1) och P_(l-2)
% för att sedan kunna använda 1) och ta fram P(l,m)
% Rita på papper från Gritty Details

% Case 2):
if m > 0
    % The diagonal
    % P(m,m)
    Pmm = ((-1)^m)*fact2(2*m-1)*(1-x^2)^(m/2);
end

% In case 2), P(m,m):
if l == m
    P = Pmm;
    return;
else
    % Case 3), P(m+1, m):
    Pm1 = x*(2*m+1)*Pmm;
    if l == (m + 1)
        P = Pm1;
        return;
    else
        % Case 1): Calculate P(k,m) up to P(l,m)
        for k = (m+2):l
            denominator = (2*k - 1)*x*Pm1 - (k+m-1)*Pmm;
            numerator = k-m;
            Pk = denominator / numerator;
            % ===============================================
            % Comments for author: Stega oss nedåt tills vi kommer till 
            % P(l-1,m), P(l-2,m) T.ex. för 
            % index (0,0): P(4,1) => Från ovan/default räknar vi 
            % ut P(2,1) och P(1,1). Pk blir då P(3,1)
            % ===============================================
            
            % Step down column-wise until we reach P(l-1,m) and 
            % P(l-2,m) so we can use 1) to get P(l,m) 
            Pmm = Pm1; 
            Pm1 = Pk;
            P = Pk;
        end
    end
end

end