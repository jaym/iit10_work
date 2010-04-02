%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: 
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: 
%   Description: 
%                
%                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function f = pinv_filter (g, h)
g_rows = size(g,1);
g_cols = size(g,2);
h_rows = size(h,1);
h_cols = size(h,2);
padr   = g_rows + h_rows - 1;
padc   = g_cols + h_cols - 1;

g = [g, zeros(g_rows, padc - g_cols); zeros(padr - g_rows, padc)];
h = [h, zeros(h_rows, padc - h_cols); zeros(padr - h_rows, padc)];

H = (fft2(h,256,256));
Hinv = 1./((H==0)+H) .* (H!=0);
G = fft2(g,256,256);
F = G.*Hinv;
f = real(ifft2(F));

