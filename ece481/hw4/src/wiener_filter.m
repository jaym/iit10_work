%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: wiener_filter.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Fri Apr 2 2010
%   Description: Applies the wiener filter. g and h are both padded so that
%                the convolution is linear
%                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function f = wiener_filter (g, h, snn, f)
p = size(g) + size(h) -1;

m = mean(mean(g));
g = g -m;

H = fft2(double(h),p(1), p(2));
G = fft2(double(g),p(1), p(2));
if nargin == 3
    %Estimate sff
    sff = g;
    N = size(g,1) * size(g,2);
    sff = 1/N*(abs(double(G)) .^ 2);
elseif nargin == 4
        %Actual sff
        F = fft2(double(f),p(1), p(2));
        N = size(F,1) * size(F,2);
        sff = 1/N *(abs(double(F)) .^ 2);
end


P = (conj(H).*sff)./((abs(H).^2).*sff + snn);
f = real(ifft2(P.*G)) + m;

%Crop
f = f(1:size(g,1), 1:size(g,2));
