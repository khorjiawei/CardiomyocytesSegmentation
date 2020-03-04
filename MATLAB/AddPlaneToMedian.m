%% Reading from tiff stack
clear; clc; close all;

%dir='series1_tilescan4_channel3_cropped_sp200_0_ep800_600';
dir='series1_tilescan4_channel3_cropped_sp300_300_ep600_600';
tic
disp('Loading image stack..');
total_num_layers=211; %total number of layers in the stack of images
start_layer=1;
count=1;
for i=start_layer:total_num_layers
    median(:,:,i)=imread(strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/median.tif'),i);
    plane(:,:,i)=imread(strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/plane_clean-scaled_closedGaps_threshold5.tif'),i);

end
[num_rows,num_cols,num_layers]=size(median);

disp('Image loaded.')
toc

%%

median_norm=mat2gray(median);
plane_norm=0.2.*mat2gray(plane);
I2=(median_norm+plane_norm);
I2=mat2gray(I2);
disp('Summing completed.');

%% save file
OutputFileName=strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/medianPlusplaneCleanScaledClosedGapsThreshold5.tif');
imwrite(I2(:,:,1),OutputFileName);
for i=2:num_layers
imwrite(I2(:,:,i),OutputFileName,'WriteMode','append');
end

disp('Writing completed');
