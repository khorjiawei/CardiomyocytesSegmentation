clear;clc;close all;

im=imread('test_image.tif');
img=dip_image(im)

%X,Y,Slice,DX,Dy,Orientation,Coherency,Energy
tabl=csvread('test_image.csv',1,0);
temp=tabl(:,6);
dim_y=length(unique(tabl(:,2)));
dim_x=length(unique(tabl(:,1)));
orientation=reshape(temp,[dim_y,dim_x]);
%orientation=permute(orientation,[2 1]);
orientation(orientation<0)=orientation(orientation<0)+180;
orientation=180-orientation;
orientation_med=orientation;
%orientation_med=medfilt2(orientation,[3 3]);

seed_loc(1,:)=[59,96];
seed_loc(2,:)=[162,105];

[num_seeds,~]=size(seed_loc);

for s=1:num_seeds
    
    hold on; plot(seed_loc(s,1),seed_loc(s,2),'ob','MarkerSize',5);
    
    xpos=seed_loc(s,1);
    ypos=seed_loc(s,2);
    xpos_store=xpos;
    ypos_store=ypos;
    centerline_posY=[xpos,ypos];
    step=1;
    temp=0;
    for i=1:100
        %temp(i)=orientation(xpos,ypos);
        xpos_store=xpos_store+step*cosd(orientation_med(xpos,ypos));
        xpos=round(xpos_store);
        ypos_store=ypos_store+step*sind(orientation_med(xpos,ypos));
        ypos=round(ypos_store);
        
        centerline_posY(i+1,:)=[xpos,ypos];
    end
    
    xpos=seed_loc(s,1);
    ypos=seed_loc(s,2);
    xpos_store=xpos;
    ypos_store=ypos;
    for i=1:100
        temp(i)=orientation(xpos,ypos);
        xpos_store=xpos_store-step*cosd(orientation_med(xpos,ypos));
        xpos=round(xpos_store);
        ypos_store=ypos_store-step*sind(orientation_med(xpos,ypos));
        ypos=round(ypos_store);
        
        centerline_negY(i,:)=[xpos,ypos];
    end
    centerline_negY=flipud(centerline_negY);
    centerline=[centerline_negY;centerline_posY];
    plot(centerline(:,1),centerline(:,2),'y');
    
end
