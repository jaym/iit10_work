%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%          File: plot_intensity.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Sat Feb 13 2010
%
%   Description: This script reads an image and applys a guassian filter with
%                various sigma values. A file with the results is saved in
%                the data folder, along with the intensity values for the
%                stars.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

q     = 'images/saturn_bad.tif'
f     = uint8(imread(q));
[r,c] = size(f);
r = (r-1)/2;
c = (c-1)/2;
[u v] = meshgrid(-c:c, -r:r);

figure;
i = 2;
F = fft2(f);
subplot(6,2,1); imshow(f); title('Original Image');
subplot(6,2,2); plot(f(72,315:328)); title('Intensity Plot');
n = 0;
for sig = [75 60 40 20 10]
    H = fftshift(exp(-(u.^2 + v.^2)/(2*sig^2)));
    g = real(ifft2(F .* H));
    i = i + 1;
    if(mod(i-1, 12) == 0)
        n = n + 1;
        print(['data/intensity_',num2str(n) ,'.eps'], '-deps');
        figure;
        i = 1;
    end;
    subplot(6,2,i); imshow(g,[]); axis image; title(['\sigma=', num2str(sig)]);
    i = i + 1;
    subplot(6,2,i); plot(g(72,315:328)); 
end
print(['data/intensity_',num2str(n+1) ,'.eps'], '-deps');
pause(10);
