function [P] = LegendrePoly(l, m, x)
% l - band index
% m - "degree index", m to [0,L], m^2 degree
% x - value, [-1,1]
% De element som är ensamma i kolumnen tas fram med 2)
% De element som har 1 granne i kolumnen tas fram med 3)
% De element som har minst 2 grannar i kolumnen tas fram med 1)
% =============================================================
% Testa den här funktionen mot hårdkodad P(2,2) och kolla om de är lika
l = l+1; % index (0,0)
m = m+1;
pStart = 1;
% P = zeros(l+1,m+1);
% P(1,1) = pStart;

Pmm = pStart;
P = Pmm;
Pm1 = 0;
Pk = 0; % Stega oss neråt kolumnvis tills vi har P_(l-1) och P_(l-2)
% för att sedan kunna använda 1) och ta fram P(l,m)
% Rita på papper från Gritty Details

if m > 1
    % Diagonalen
    % P(m,m)
    Pmm = ((-1)^m)*fact2((2*m-1))*(1-x^2)^(m/2);
else
    disp('m is not bigger than 1');
    return;
end

if l == m
    P = Pmm;
    return;
end

Pm1 = x*(2*m+1)*Pmm;
if l == (m + 1)
    P = Pm1;
    return;
end

for k = (m+2):l
    denominator = (2*k - 1)*x*Pm1 - (k+m-1)*Pmm;
    numerator = k-m;
    Pk = denominator / numerator;
    % Stega oss nedåt tills vi kommer till P(l-1,m), P(l-2,m)
    % T.ex. för index (0,0): P(4,1) => Från ovan/default räknar vi 
    % ut P(2,1) och P(1,1). Pk blir då P(3,1)
    Pmm = Pm1;
    Pm1 = Pk;
    P = Pk;
end


end














