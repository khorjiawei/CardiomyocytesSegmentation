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

%%
bw=imbinarize(I);

se=strel('disk',2);
for i=1:num_layers
bw_open=imopen(bw(:,:,i),se);
bw2(:,:,i)=bwareaopen(bw_open,1000);
end

SE = strel('sphere',2);
bw2_close=imclose(bw2,SE);
   
%%
I2=I.*uint8(bw2_close);
disp('completed')
%% save file
OutputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/plane_clean.tif';
imwrite(I2(:,:,1),OutputFileName);
for i=2:num_layers
imwrite(I2(:,:,i),OutputFileName,'WriteMode','append');
end

disp('Writing completed');