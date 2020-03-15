clear;clc;close all;

im=imread('test_image_for_snake.PNG');
img=dip_image(im)

%X,Y,Slice,DX,Dy,Orientation,Coherency,Energy
%tabl=csvread('OJ-Table-Vector-Field.csv',1,0);
tabl=csvread('test_image_for_snake_sigma3.csv',1,0);

temp=tabl(:,6);
dim_y=length(unique(tabl(:,2)));
dim_x=length(unique(tabl(:,1)));
orientation=reshape(temp,[dim_y,dim_x]);
%orientation=permute(orientation,[2 1]);
orientation(orientation<0)=orientation(orientation<0)+180;
orientation=180-orientation;
orientation_med=orientation;
orientation_med=medfilt2(orientation,[3 3]);

seed_loc(1,:)=[203,215];
seed_loc(2,:)=[124,177];
seed_loc(3,:)=[280,116];
seed_loc(4,:)=[50,107];

[num_seeds,~]=size(seed_loc);

for s=[3,2]%2:num_seeds
    
    hold on; plot(seed_loc(s,1),seed_loc(s,2),'or','MarkerSize',10,'LineWidth',2);
    
    xpos=seed_loc(s,1);
    ypos=seed_loc(s,2);
    xpos_store=xpos;
    ypos_store=ypos;
    centerline_posY=[xpos,ypos];
    step=1;
    temp=0;
    for i=1:130
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
    plot(centerline(:,1),centerline(:,2),'y','LineWidth',2);
    
    diameter=30;
    for i=1:length(centerline)
        boundaries_posX(i,:)=centerline(i,:)+[diameter,0];
        boundaries_negX(i,:)=centerline(i,:)-[diameter,0];
    end
    boundaries=[boundaries_posX;[flipud(boundaries_negX);boundaries_posX(1,:)]];
    plot(boundaries(:,1),boundaries(:,2),'b','LineWidth',2);
end

