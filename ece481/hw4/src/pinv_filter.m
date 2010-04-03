%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: pinv_filter.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Fri Apr 2 2010
%   Description: Applies the psuedoinverse filter. g and h both get padded to
%                perform a linear convolution
%                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function f = pinv_filter (g, h)
p = size(g) + size(h) -1;

%%Swapping p(1) and p(2) produces a image that is a lot better???
%%Something is wrong
%H = (fft2(h,p(1),p(2)));
H = (fft2(h,p(2),p(1)));
Hinv = 1./((H==0)+H) .* (H!=0);

G = fft2(g,p(2), p(1));
%G = fft2(g);
F = G.*Hinv;
f = real(ifft2(F));
f = f(1:size(g,1), 1:size(g,2));

