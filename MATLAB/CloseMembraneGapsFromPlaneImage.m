%% Reading from tiff stack
clear; clc; close all;

tic
disp('Loading image stack..');
total_num_layers=211; %total number of layers in the stack of images
manual_crop=[300,300]; %select region of interest for each layer of image
start_layer=1;
count=1;
for i=start_layer:total_num_layers
    temp=imread('/home/jwk114/CardiomyocytesSegmentation/Images/plane.tif',i);
    I(:,:,i)=temp(1:manual_crop(1),1:manual_crop(2));
end
[num_rows,num_cols,num_layers]=size(I);

disp('Image loaded.')
toc

%% Morphologically close grayscale image
se=strel('disk',5);
J=imclose(I,se);

figure;
subplot(1,2,1);
imshow(I(:,:,1),[]);
subplot(1,2,2);
imshow(J(:,:,1),[]);

%% save file
OutputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/plane_closed.tif';
imwrite(J(:,:,1),OutputFileName);
for i=2:num_layers
imwrite(J(:,:,i),OutputFileName,'WriteMode','append');
end

disp('Writing completed');