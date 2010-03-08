%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: hist_eq.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Sun Mar 7 2010
%   Description: Given a grayscale image f, apply the histogram equaliztion
%                method to automatically enhance the contrast of the image.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function g = hist_eq(f)
v      = vec(f);
v_min  = min(v);
v_max  = max(v);
v_sz   = size(v,1);
h = zeros(1,v_max+1);
h_2 = zeros(1,v_max+1);
% sum number of pixels with value i
for i = v_min:v_max
    h(i + 1) = sum(1 .* (v == i));
end
% get cdf
for i = 1:size(h,2);
    h_2(i) = sum(h(1:i))/v_sz;
end
% Do transfomation
g = 255 .* h_2(f+1);
