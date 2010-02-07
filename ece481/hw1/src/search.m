%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%          File: search.m
%        Author: Jay Mundrawala(jay@ir.iit.edu)
%       Created: Sat Feb 6 2010
%
%   Description: This script reads the tif files in the images directory 
%                and calculates their average values for the red, green, 
%                and blue channels. It then asks the user for query images, 
%                and displays the two closest images to the query image.
%
%         Usage: This script works correctly with octave. Make sure pwd is
%                the root directory of the project.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Print current working directory...the images folder should be visible to
%this directory.
printf("pwd=%s\n",pwd());

%Get non query images from the images directory
dir_list = dir('./images/');
files = {};
for i = 1:length(dir_list)
    if(length(regexpi(dir_list(i).name, '^(\d+)\.tif$', 'match')) > 0)
        files(end+1) = ["images/", dir_list(i).name];
    end
end

%Store mean rgb values for each image
db_rgb = {};
for i = 1:length(files)
    db_img = imread(files{i});
    db_mean_r = mean(mean(db_img(:,:,1)));
    db_mean_g = mean(mean(db_img(:,:,2)));
    db_mean_b = mean(mean(db_img(:,:,3)));
    db_rgb{end+1} = [db_mean_r, db_mean_g, db_mean_b];
end

%Query Interaction
while(1)
    q_img = imread(input('query: ','s'));
    q_mean_r = mean(mean(q_img(:,:,1)));
    q_mean_g = mean(mean(q_img(:,:,2)));
    q_mean_b = mean(mean(q_img(:,:,3)));

    dist_ary = [];
    top1 = 1;
    top2 = 0;
    for i = 1:length(db_rgb)
        rgb = db_rgb{i};
        dist = sqrt((q_mean_r - rgb(1))^2 +
                    (q_mean_g - rgb(2))^2 +
                    (q_mean_b - rgb(3))^2);
        dist_ary(i) = dist;
        if(i > 1)
            if(dist < dist_ary(top1))
                top2 = top1;
                top1 = i;
            elseif(top2 == 0)
                top2 = i;
            elseif(dist < dist_ary(top2))
                top2 = i;
            end
        end
    end

    t1 = imread(files{top1});
    t2 = imread(files{top2});
    figure, axis image; 
    subplot(1,3,1), imagesc(q_img);
    subplot(1,3,2), imagesc(t1);
    subplot(1,3,3), imagesc(t2);
    pause(1);
end
