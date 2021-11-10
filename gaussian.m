clear all;
clc;
% read the image
img = imread('office_noisy.png');
% make the image white-black
colormap(gray)
%define sigma(Standard Deviation of Gaussian Distribution)
sigma = [0.5,1,2,5,10,50];
  counter = 2;
  counter2 = 1;
for i=1:length(sigma)
%define gaussian filter second value is the size(width) of the 2D signal-
%typically the filter is 6 times sigma
filt = fspecial('gaussian', [sigma(i)*6,sigma(i)*6] , sigma(i));
% show the gaussian distribution in odd index
subplot(6,2,counter2)
%the height of the plot in z direction is defined by the value in the
%corresponding row column entry in (sigma(i)*6) * (sigma(i)*6) grid formed by the input matrix
surf(filt)
title(['gaussion filter\sigma=' ,num2str(sigma(i))]);
%same means that the output matrix has the same size as the input image
%matrix
%is used as filter it outputs the filtered image(linear)
img_filt = conv2(img,filt,'same');
subplot(6,2,counter)
%image is smoothed
image(img_filt)
%define a title above image while plotting
title('filtered image')
axis tight equal
%define odd and even index (odd for gaussian distribution and even for filtered image)
counter = counter+2;
counter2 = counter2+2;
end