%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: 
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: 
%   Description: 
%                
%                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function f = wiener_filter (g, h, snn, F)

g_rows = size(g,1);
g_cols = size(g,2);
h_rows = size(h,1);
h_cols = size(h,2);
padr   = g_rows + h_rows - 1;
padc   = g_cols + h_cols - 1;

m = mean(mean(g));
g = g -m;

% Pad to perform linear convolution
g = [g, zeros(g_rows, padc - g_cols); zeros(padr - g_rows, padc)];
h = [h, zeros(h_rows, padc - h_cols); zeros(padr - h_rows, padc)];

H = fft2(double(h));
G = fft2(double(g));
if nargin == 3
    %Estimate sff
    sff = g;
    N = size(g,1) * size(g,2);
    sff = 1/N*(abs(double(G)) .^ 2);
elseif nargin == 4
        %Actual sff
        N = size(F,1) * size(F,2);
        sff = 1/N *(abs(double(F)) .^ 2);
end


P = (conj(H).*sff)./((abs(H).^2).*sff + snn);
f = real(ifft2(P.*G)) + m;

%Crop
f = f(1:g_rows, 1:g_cols);
