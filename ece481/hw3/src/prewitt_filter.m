%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: prewitt_filter.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Sun Mar 7 2010
%   Description: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function g = prewitt_filter (f, threshold)
f_x = conv2_linear(f,[1 0 -1; 1 0 -1; 1 0 -1],1);
f_y = conv2_linear(f,[-1 -1 -1; 0 0 0; 1 1 1],1);

g = (0 + 255*(sqrt(f_x .^ 2 + f_y .^ 2) >= threshold))
