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

c = 0;
while(1)
    q_img = imread(input('query: ','s'));
    q_r = q_img(:,:,1);
    q_g = q_img(:,:,2);
    q_b = q_img(:,:,3);

    figure;
    subplot(1,4,1), imagesc(q_img); axis image;
    subplot(1,4,2), imagesc(q_r); axis image;
    subplot(1,4,3), imagesc(q_g); axis image;
    subplot(1,4,4), imagesc(q_b); axis image;
    
    output = ["data/c", num2str(c++), ".eps"]
    print(output, "-deps");
    pause(1);
end
