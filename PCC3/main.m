%%% this script wants to demonstrate the shape of the robot shape %%%

%% valuable exlaination
% dt=disk_thickness
% btp=base_top_point
% ddtcp=distance_disk_top_center_to_plane
% ldt=base_top_point+disk_top_center_to_plane_distance
% N=number of the disk
% dtp=disk_top_point
% dtTm=disk_top_transformation_matrix
% dtpc_zx=disk_top_point_coordinate_z_x
% dtpc_zy=disk_top_point_coordinate_z_y
% dtpc_zz=disk_top_point_coordinate_z_z
clc;
close all;
clear;

addpath("Test\");
addpath("Model\Function\")

%% intialization
dt=0.7;
btp=[0;0;dt];
beta_x=pi/30;
beta_y=pi/20;
% beta_y=0;
ddtcp=0.3;
ldt=dt+ddtcp;
TRot_x=[1,0,0,0;...
    0,cos(beta_x),-sin(beta_x),-ldt*sin(beta_x);...
    0,sin(beta_x),cos(beta_x),ldt*cos(beta_x);...
    0,0,0,1];
TRot_y=[cos(beta_y),0,sin(beta_y),ldt*sin(beta_y);...
    0,1,0,0;...
    -sin(beta_y),0,cos(beta_y),ldt*cos(beta_y);...
    0,0,0,1];
N=25;
dtp=ones(N,3);
dtp(1,:)=btp';
dtTm(1,:)=[1,0,0,0,0,1,0,0,0,0,1,0,btp',1];
T=reshape(dtTm(1,:),4,4);

%% calculate the position vector and transformation matrix
for i = 2:N
    if mod(i,2)==0
        tL=[0;-ldt*sin(beta_x);ldt*cos(beta_x);1];
        t=T*tL;
        T=T*TRot_x;
    elseif mod(i,2)==1
        tL=[ldt*sin(beta_y);0;ldt*cos(beta_y);1];
        t=T*tL;
        T=T*TRot_y;
        
    end
    dtTm(i,:)=reshape(T,1,16);
    dtp(i,:)=(t(1:3))';
end
dtpx=dtp(:,1);
dtpy=dtp(:,2);
dtpz=dtp(:,3);

dtp_c=dtTm(:,[1:3,5:7,9:11]);

%% plot the line graph of disk top points
subplot(2,2,1);
plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1.5,Color='b');
hold on;
scatter3(dtp(:,1),dtp(:,2),dtp(:,3),100,'Marker','.','Color','r');
view(0,0);
axis square;

subplot(2,2,2);
plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1.5,Color='b');
hold on;
scatter3(dtp(:,1),dtp(:,2),dtp(:,3),100,'Marker','.','Color','r');
view(-90,0);
axis square;

subplot(2,2,3);
plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1.5,Color='b');
hold on;
scatter3(dtp(:,1),dtp(:,2),dtp(:,3),100,'Marker','.','Color','r');
view(0,90);
axis square;


subplot(2,2,4);
plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1.5,Color='k');
hold on;
axis square;
quiver3(dtpx,dtpy,dtpz,dtp_c(:,1),dtp_c(:,2),dtp_c(:,3),0.2,'LineWidth',1,'Color',[1 0 0]);
quiver3(dtpx,dtpy,dtpz,dtp_c(:,4),dtp_c(:,5),dtp_c(:,6),0.2,'LineWidth',1,'Color',[0 1 0]);
quiver3(dtpx,dtpy,dtpz,dtp_c(:,7),dtp_c(:,8),dtp_c(:,9),0.2,'LineWidth',1,'Color',[0 0 1]);
scatter3(dtp(:,1),dtp(:,2),dtp(:,3),100,'Marker','.','Color','r');


% figure
% plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1.5,Color='b');
% hold on;
% scatter3(dtp(:,1),dtp(:,2),dtp(:,3),200,'Marker','.','Color','r');
%% verify that the disk can be simulated with circular curve 
ind=1:2:N;
x=dtp(ind,1);
y=dtp(ind,2);
z=dtp(ind,3);
figure;
hold on;
plot(x,y,'LineWidth',1,'Color',[0 0 1]);
scatter(x,y,'Marker','*','Color',[1 0 0]);
figure;
plot3(x,y,z);

%% find the relationship betweeen end position x/y/z and two angles,
% the last graph shows the workspcae of the flexible manipulator with 20 joints
beta_x=-pi/20:pi/360:pi/20;
beta_y=-pi/20:pi/360:pi/20;
[beta_x0,beta_y0]=meshgrid(beta_x,beta_y);
figure;
subplot(2,2,1);
end_x=generate_xsurf(beta_x0,beta_y0,ldt);
subplot(2,2,2);
end_y=generate_ysurf(beta_x0,beta_y0,ldt);
subplot(2,2,3);
end_z=generate_zsurf(beta_x0,beta_y0,ldt);
subplot(2,2,4);
surf(end_x,end_y,end_z);
xlabel('end_x');
ylabel('end_y');
zlabel('end-z');
title('Worksapce of the manipulator with 25 joints');





