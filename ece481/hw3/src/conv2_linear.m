%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: conv2_linear.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Sun Mar 7 2010
%   Description: Takes an image f, filter h, and the number of color channels
%                colors, and performs a linear convolution using the built-in
%                conv2 function.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function convolved = conv2_linear (f, h, colors)
szf = size(f);
szh = size(h);
f_rows = szf(1);
f_cols = szf(2);
h_rows = szh(1);
h_cols = szh(2);
pr_sz = f_rows * h_rows - 1;
pc_sz = f_cols * h_cols - 1;
if(colors > 1)
    for dim = 1:colors
        f_padded = [f(:,:,dim), zeros(f_rows,pc_sz - f_cols); zeros(pr_sz - f_rows, pc_sz)];
        h_padded = [h, zeros(h_rows,pc_sz - h_cols); zeros(pr_sz - h_rows, pc_sz)];
        convolved(:,:,dim) = conv2(f_padded, h_padded);
    end
    convolved = convolved(1:f_rows,1:f_cols,:);
else
    f_padded = [f, zeros(f_rows,pc_sz - f_cols); zeros(pr_sz - f_rows, pc_sz)];
    h_padded = [h, zeros(h_rows,pc_sz - h_cols); zeros(pr_sz - h_rows, pc_sz)];
    convolved = conv2(f_padded, h_padded);
    convolved = convolved(1:f_rows,1:f_cols);
end
