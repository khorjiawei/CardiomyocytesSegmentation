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
    I(:,:,i)=imread(strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/series1_tilescan4_channel1_cropped_sp300_300_ep600_600.tif'),i);
end
[num_rows,num_cols,num_layers]=size(I);

disp('Image loaded.')
toc

%% Nuclei preprocessing
% %threshold using otsu's method (which chooses the threshold to minimise intraclass variance) 
bw = imbinarize(I);

%perform closing to "close" holes in the nuclei 
se = strel('disk',5);
b_bw_close=imclose(bw,se);

%perform opening to remove noise
se = strel('disk',3);
b_bw_close_open=imopen(b_bw_close,se);
nuclei=b_bw_close_open;

%connected component labelling
label_b=bwconncomp(b_bw_close_open);

stats=regionprops3(label_b);

%%
I2=zeros(size(I));
for i=1:label_b.NumObjects
    centroid_pos=floor(stats.Centroid(i,:));
    I2(centroid_pos(2),centroid_pos(1),centroid_pos(3))=i;
end
I2=uint8(I2);
%% save file
OutputFileName=strcat('/home/jwk114/CardiomyocytesSegmentation/Images/',dir,'/markers.tif');
imwrite(I2(:,:,1),OutputFileName);
for i=2:num_layers
imwrite(I2(:,:,i),OutputFileName,'WriteMode','append');
end

disp('Writing completed');
