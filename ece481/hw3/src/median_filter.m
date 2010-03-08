%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%          File: median_filter.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Sun Mar 7 2010
%   Description: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function filtered = median_filter (to_filter, sz)
   
filtered = to_filter;
s = size(to_filter);
for i = 1:s(1)
    for j = 1:s(2)
        for dim = 1:ndims(to_filter)
            if (upr  = i - sz) < 1 upr = 1, end;
            if (lft = j - sz) < 1 lft = 1, end;
            if (lwr  = i + sz) > s(1) lwr = s(1), end;
            if (rgt  = j + sz) > s(2) rgt = s(2), end;

            filtered(i,j,dim) = median(vec(filtered(upr:lwr, lft:rgt,dim)));
        end
    end
end
