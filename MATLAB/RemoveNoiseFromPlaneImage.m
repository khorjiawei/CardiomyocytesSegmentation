%% Reading from tiff stack
clear; clc; close all;

dir='series1_tilescan4_channel3_cropped_sp200_0_ep800_600';
%dir='series1_tilescan4_channel3_cropped_sp300_300_ep600_600';
tic
disp('Loading image stack..');
total_num_layers=211; %total number of layers in the stack of images
start_layer=1;
count=1;
for i=start_layer:total_num_layers
    I_unscaled(:,:,i)=imread(strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/plane.tif'),i);
    I_scaled(:,:,i)=imread(strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/plane-scaleObj.tif'),i);
end
[num_rows,num_cols,num_layers]=size(I_unscaled);

disp('Image loaded.')
toc

%%
bw=imbinarize(I_unscaled);

se=strel('disk',2);
for i=1:num_layers
bw_open=imopen(bw(:,:,i),se);
bw2(:,:,i)=bwareaopen(bw_open,500);
end

SE = strel('sphere',2);
bw2_close=imclose(bw2,SE);
   
disp('Binarised and eroded')
%%
I2=I_scaled.*uint8(bw2_close);
I3=I_unscaled.*uint8(bw2_close);
disp('completed')
%% save file
OutputFileName=strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/plane_clean-scaled.tif');
imwrite(I2(:,:,1),OutputFileName);
for i=2:num_layers
imwrite(I2(:,:,i),OutputFileName,'WriteMode','append');
end

disp('Writing completed');

OutputFileName=strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/plane_clean-unscaled.tif');
imwrite(I3(:,:,1),OutputFileName);
for i=2:num_layers
imwrite(I3(:,:,i),OutputFileName,'WriteMode','append');
end