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
I(I~=0)=1;
I_comp=~I;
