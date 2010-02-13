%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%          File: guassian_filter.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Sat Feb 13 2010
%
%   Description: This script reads an image and applys a guassian filter with
%                various sigma values. A file with the results is saved in
%                the data folder.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

q     = input('file: ', 's');
f     = uint8(imread(q));
[r,c] = size(f);
r = (r-1)/2;
c = (c-1)/2;
[u v] = meshgrid(-c:c, -r:r);

figure;
i = 1;
F = fft2(f);
imagesc(fftshift(log(abs(F).^2)));
print('data/fft.eps', '-deps');

figure;
subplot(3,3,i); imshow(f); axis image; title('Original');
for sig = [350 115 75 60 50 40 20 10]
    H = fftshift(exp(-(u.^2 + v.^2)/(2*sig^2)));
    g = real(ifft2(F .* H));
    i = i + 1;
    subplot(3,3,i); imagesc(g); axis image; title(['\sigma=', num2str(sig)]);
end
print('data/plot.eps', '-deps');
pause(1);
