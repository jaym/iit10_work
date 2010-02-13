%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%          File: rbg_channel.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Sat Feb 6 2010
%
%   Description: This script reads the tif files and displays the original
%                image, followed by the its RGB channels seperated.
%
%         Usage: This script works correctly with octave. For matlab, lines
%         27 and 28 need to commented out.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f     = uint8(imread(input('query: ','s')));
[r,c] = size(f);
r = (r-1)/2;
c = (c-1)/2;
[u v] = meshgrid(-c:c, -r:r);

figure;
i = 1;
F = fft2(f);
subplot(3,3,i); imshow(f); axis image; title('Original');
for sig = [350 115 75 60 40 40 20 10]
    H = fftshift(exp(-(u.^2 + v.^2)/(2*sig^2)));
    g = real(ifft2(F .* H));
    i = i + 1
    subplot(3,3,i); imagesc(g); axis image; title(['\sigma=', num2str(sig)]);
    %imshow(g,[]);
end
print('my_plot.eps', '-deps');
pause(100);
%figure;
%subplot(1,4,1), imagesc(q_img); axis image;
%subplot(1,4,2), imagesc(q_r); axis image;
%subplot(1,4,3), imagesc(q_g); axis image;
%subplot(1,4,4), imagesc(q_b); axis image;

%output = ["data/c", num2str(c++), ".eps"]
%print(output, "-deps");
%pause(1);
