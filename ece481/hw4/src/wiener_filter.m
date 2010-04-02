%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: 
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: 
%   Description: 
%                
%                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function f = wiener_filter (g, h, snn, F, isim)
m = mean(mean(g));
g = g -m;
H = fft2(double(h),256,256);
G = fft2(double(g),256,256);
if nargin == 3
    sff = g;
    N = size(g,1) * size(g,2);
    sff = 1/N*(abs(double(G)) .^ 2);
elseif nargin == 5
    if isim == 1
        N = size(F,1) * size(F,2);
        sff = 1/N *(abs(double(F)) .^ 2);
    end
end


P = (conj(H).*sff)./((abs(H).^2).*sff + snn);
f = real(ifft2(P.*G)) + m;
