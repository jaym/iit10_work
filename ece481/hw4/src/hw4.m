%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: hw4.m 
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Fri Apr 2 2010
%   Description: Runs the filters created for HW 4 with the PSF 1/32*ones(1,32)
%                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%
addpath('src/');
g = imread('images/g.tif');
act = imread('images/f.tif');

printf "The PSF is a row vector of size 32 where each element is given a weight of 1/32\n"
h = 1/32*ones(1,32)
printf "To do a linear convolution, both the image and the PSF are zero padded to\n the size 256x256+32-1\n"

printf "Doing part 3b\n"
figure; subplot(3,1,1);
imagesc(pinv_filter(g,h));colormap(gray);axis image; title('i. Pseudoinverse Filter');
subplot(3,1,2);
imagesc(wiener_filter(g,h,4));axis image; title('ii. Wiener Filter(estimated sff)');
subplot(3,1,3);
imagesc(wiener_filter(g,h,4,act));axis image; title('iii. Wiener Filter(known sff)');


print('data/3b.eps', '-deps');
input('Press any key to exit')
