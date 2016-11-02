function [I] = initimage(name, scale)

I = im2double(imread(name));
I = rgb2gray(I);
% 0.025
% 0.0375
% 0.05
% 0.1
I = imresize(I, scale);

end