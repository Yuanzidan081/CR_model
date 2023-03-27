%%% this script wants to demonstrate the shape of the robot shape %%%

%% valuable exlaination
% dt=disk_thickness
% btp=base_top_point
% ddtcp=distance_disk_top_center_to_plane
% ldt=base_top_point+disk_top_center_to_plane_distance
% N=number of the disk
% dtp=disk_top_point

clc;
close all;
clear;

addpath("Test\");
addpath("Model\Function\")

dt=0.7;
btp=[0;0;dt];
beta_x=-pi/60;
beta_y=pi/60;
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
N=20;
dtp=ones(N,3);

dtp(1,:)=btp';
t=[btp;1];
for i = 2:N
    if mod(i,2)==0
        t=TRot_x*t;
    elseif mod(i,2)==1
        t=TRot_y*t;
    end
    dtp(i,:)=(t(1:3))';
end

subplot(2,2,1);
plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1);
view(0,0);
subplot(2,2,2);
plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1);
view(-90,0);
subplot(2,2,3);
plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1);
view(0,90);
subplot(2,2,4);
plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1);

x=[];
y=[];
xcnt=1;
ycnt=1;
for i =1:N
    if mod(i,2) == 0
        x(xcnt) = dtp(i,1);
        xcnt = xcnt + 1;
    elseif mod(i,2) ~= 0
        y(ycnt) = dtp(i,2);
        ycnt = ycnt + 1;
    end
end
figure;
plot(x,y);


beta_x=-pi/20:pi/360:pi/20;
beta_y=-pi/20:pi/360:pi/20;
[beta_x0,beta_y0]=meshgrid(beta_x,beta_y);
figure;
subplot(2,2,1);
end_x=generate_xsurf(beta_x0,beta_y0,ldt);
subplot(2,2,2);
end_y=generate_ysurf(beta_x0,beta_y0,ldt);
subplot(2,2,3);
% end_z=generate_zsurf(beta_x0,beta_y0,ldt);