function [I] = initimage(name, scale, isColor)
% INITIMAGE Initialize an image 
%   I = INITIMAGE(name, scale, isColor)
%   name: name and path of image
%   scale: scale of image size
%   isColor: if image should be grayscale or color
%   
% Author: Gabriel Baravdish

I = im2double(imread(name));
if nargin == 1
    return;
end
if nargin < 3 || isColor == false
    I = rgb2gray(I);
end
I = imresize(I, scale);
% 0.025
% 0.0375
% 0.05
% 0.1

end