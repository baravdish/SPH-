function [df] = fact2(n)

df = 1;
for i = n : -2 : 1
    df = df * i;
end

end