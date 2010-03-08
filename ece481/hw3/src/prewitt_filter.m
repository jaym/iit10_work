%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: prewitt_filter.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Sun Mar 7 2010
%   Description: Using the 2d linear convolution function, apply the prewitt 
%                filter for edge detection.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function g = prewitt_filter (f, threshold, colors)
f_x = conv2_linear(f,[1 0 -1; 1 0 -1; 1 0 -1],colors);
f_y = conv2_linear(f,[-1 -1 -1; 0 0 0; 1 1 1],colors);

g = (0 + 255*(sqrt(f_x .^ 2 + f_y .^ 2) >= threshold));
