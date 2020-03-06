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
    I(:,:,i)=imread(strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/plane_clean-scaled_threshold5.tif'),i);

end
[num_rows,num_cols,num_layers]=size(I);

disp('Image loaded.')
toc

%%
I2=permute(I,[1 3 2]);
[~,~,num_layers_I2]=size(I2);
%% save file
OutputFileName=strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/plane_clean-scaled_threshold5_yzPlane.tif');
imwrite(I2(:,:,1),OutputFileName);
for i=2:num_layers_I2
imwrite(I2(:,:,i),OutputFileName,'WriteMode','append');
end

disp('Writing completed');

