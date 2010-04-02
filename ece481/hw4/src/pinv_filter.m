%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: 
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: 
%   Description: 
%                
%                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function f = pinv_filter (g, h)
H = (fft2(h,256,256));
Hinv = 1./((H==0)+H) .* (H!=0);
G = fft2(g,256,256);
F = G.*Hinv;
f = real(ifft2(F));

