clear;clc;close all;

%% initialisation
voxel_size_microns=[0.2841,0.2841,0.3463]; %in microns
image_size=[600,600,211]; %in pixels
image_size_microns=image_size.*voxel_size_microns; %in microns
init_d_microns=10; %initial diameter in microns
init_r_microns=init_d_microns/2; %initial radius in microns
init_l_microns=100; %initial length in microns
init_half_l_microns=init_l_microns/2; %initial half length in microns
init_d_xy=floor(init_d_microns/voxel_size_microns(1));
init_r_xy=floor(init_d_xy/2);
init_d_yz=floor(init_d_microns/voxel_size_microns(3));
init_r_yz=floor(init_d_yz/2);
init_l=floor(init_l_microns/voxel_size_microns(2));
init_half_l=floor(init_l/2);

center_row=[init_half_l_microns:init_l_microns:image_size_microns(1)]./voxel_size_microns(1);
center_row=floor(center_row); %in pixels
center_col=[init_r_microns:init_d_microns:image_size_microns(2)]./voxel_size_microns(2);
center_col=floor(center_col); %in pixels
center_depth=[init_r_microns:init_d_microns:image_size_microns(3)]./voxel_size_microns(3);
center_depth=floor(center_depth); %in pixels
%% structure tensor
st_xy=readtable('plane_clean-scaled_threshold5_xzPlane.csv');
st_yz=readtable('plane_clean-scaled_threshold5_yzPlane.csv');
orientation_xy=table2array(st_xy(:,6));
orientation_xy=reshape(orientation_xy,[length(unique(table2array(st_xy(:,2)))),length(unique(table2array(st_xy(:,1)))),length(unique(table2array(st_xy(:,3))))]);
orientation_xy=permute(orientation_xy,[2 1 3]); %spacing is 10,10,1
orientation_xy(orientation_xy<0)=orientation_xy(orientation_xy<0)+180;
orientation_yz=table2array(st_yz(:,6));
orientation_yz=reshape(orientation_yz,[length(unique(table2array(st_yz(:,1)))),length(unique(table2array(st_yz(:,2)))),length(unique(table2array(st_yz(:,3))))]); %spacing is 10,10,1
orientation_yz=permute(orientation_yz,[2 3 1]); %spacing is 10,1,10
orientation_yz(orientation_yz<0)=orientation_yz(orientation_yz<0)+180;

start_xy=[table2array(st_xy(1,2)),table2array(st_xy(1,1)),1];
start_yz=[table2array(st_yz(1,2)),1,table2array(st_yz(1,1))];
step_xy=[10,10,1];
step_yz=[10,1,10];

%% generate ellipses
row_ptr=1;
col_ptr=1;
depth_ptr=1;
siz=[length(center_row),length(center_col),length(center_depth)];
theta=zeros(siz);
phi=zeros(siz);
half_l=zeros(siz);
r_xy=zeros(siz);
r_yz=zeros(siz);

for depth_ptr=1:length(center_depth)
    for row_ptr=1:length(center_row)
        for col_ptr=1:length(center_col)
            row_pos=center_row(row_ptr);
            col_pos=center_col(col_ptr);
            depth_pos=center_depth(depth_ptr);
            
            %get theta, the angle in the xy plane
            topl=[row_pos-init_half_l,col_pos-init_r_xy,depth_pos-init_r_yz]; %coordinates of top left corner
            botr=[row_pos+init_half_l,col_pos+init_r_xy,depth_pos+init_r_yz]; %coordinates of bottom right corner
            topl(topl<start_xy)=start_xy(topl<start_xy); %to make sure the coordinates are not out of range
            botr(botr>image_size)=image_size(botr>image_size); %to make sure coordinates are not out of range
            idx_r=floor((topl(1)-start_xy(1))/step_xy(1))+1:floor((botr(1)-start_xy(1))/step_xy(1))+1;
            idx_c=floor((topl(2)-start_xy(2))/step_xy(2))+1:floor((botr(2)-start_xy(2))/step_xy(2))+1;
            idx_d=floor((topl(3)-start_xy(3))/step_xy(3))+1:floor((botr(3)-start_xy(3))/step_xy(3))+1;
            theta(row_ptr,col_ptr,depth_ptr)=mean(orientation_xy(idx_r,idx_c,idx_d),'all');
            
            %get phi, the angle in yz plane
            topl=[row_pos-init_half_l,col_pos-init_r_xy,depth_pos-init_r_yz]; %coordinates of top left corner
            botr=[row_pos+init_half_l,col_pos+init_r_xy,depth_pos+init_r_yz]; %coordinates of bottom right corner
            topl(topl<start_yz)=start_yz(topl<start_yz); %to make sure the coordinates are not out of range
            botr(botr>image_size)=image_size(botr>image_size); %to make sure coordinates are not out of range
            idx_r=floor((topl(1)-start_yz(1))/step_yz(1))+1:floor((botr(1)-start_yz(1))/step_yz(1))+1;
            idx_c=floor((topl(2)-start_yz(2))/step_yz(2))+1:floor((botr(2)-start_yz(2))/step_yz(2))+1;
            idx_d=floor((topl(3)-start_yz(3))/step_yz(3))+1:floor((botr(3)-start_yz(3))/step_yz(3))+1;
            phi(row_ptr,col_ptr,depth_ptr)=mean(orientation_yz(idx_r,idx_c,idx_d),'all');
        end
    end
end

%% visualise ellipses

del=0.01;
ang1=[0:del:pi];
ang2=[0:del:2*pi];
[ANG1,ANG2]=meshgrid(ang1,ang2);
im=zeros(image_size);

for depth_ptr=1:1%length(center_depth)
    for row_ptr=1:1%length(center_row)
        for col_ptr=1:1%length(center_col)
            pts_row=init_half_l*sin(ANG1).*cos(ANG2); %change init to actual length
            pts_col=init_r_xy*sin(ANG1).*sin(ANG2);
            pts_depth=init_r_yz*cos(ANG1);

            temp=[reshape(pts_row,1,[]);reshape(pts_col,1,[]);reshape(pts_depth,1,[])];

            ang_depth=90-theta(row_ptr,col_ptr,depth_ptr);
            ang_col=90-phi(row_ptr,col_ptr,depth_ptr);
            rot_matrix_depth=[cosd(ang_depth),sind(ang_depth),0;-sind(ang_depth),cosd(ang_depth),0;0,0,1];
            rot_matrix_col=[cosd(ang_col),0,sind(ang_col);0,1,0;-sind(ang_col),0,cosd(ang_col)];
            coord=floor(rot_matrix_col*rot_matrix_depth*temp+[center_row(row_ptr);center_col(col_ptr);center_depth(depth_ptr)]); %change center to actual center later
            coord(coord<1)=1;
            coord(coord(1,:)>image_size(1))=image_size(1);
            coord(coord(2,:)>image_size(2))=image_size(2);
            coord(coord(3,:)>image_size(3))=image_size(3);
            for i=1:length(coord)
                im(coord(1,i),coord(2,i),coord(3,i))=1;
            end
        end
    end
end
%% save file
OutputFileName=strcat('Images/test_image.tif');
imwrite(im(:,:,1),OutputFileName);
for i=2:image_size(3)
imwrite(im(:,:,i),OutputFileName,'WriteMode','append');
end

disp('Writing completed');