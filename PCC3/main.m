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
plot(x,y,'LineWidth',1,'Color',[0 0 1]);
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

%% the relationship between angle and the change of rope
% single dof
% delta_sdrlmax:Delta_single_dof_rope_length_max
% beta_sdamax: beta_single_dof_angle_max
% the document's 'ldt' is declared as 'ddtcp' here
r=1.62;
ddtcp=0.3;
Ns=6;
beta_sdamax=pi/20;
delta_sdrlmax=(Ns-1)*(r*beta_sdamax-1/6*r*beta_sdamax^3);
disp('the maximum change of rope in the single segment is');
disp(num2str(delta_sdrlmax));
error_sdrlmax=(Ns-1)*r^2*beta_sdamax^4/(8*ddtcp);
disp('the maximum error of rope in the single segment is');
disp(num2str(error_sdrlmax));
% double dof
% delta_ddrlmax:Delta_double_dof_rope_length_max
% beta_ddamax: beta_double_dof_angle_max
r=1.62;
ddtcp=0.3;
Nd=25;
beta_ddamax=pi/20;
delta_ddrlmax=(Nd-1)/2*(r*beta_ddamax-1/6*r*beta_ddamax^3);
disp('the maximum change of rope in the double segment is');
disp(num2str(delta_ddrlmax));
error_ddrlmax=(Nd-1)/2*r^2*beta_ddamax^4/(8*ddtcp);
disp('the maximum error of rope in the double segment is');
disp(num2str(error_ddrlmax));

%% plot the relationship between the length of rope and the angle
% single dof
% delta_sdrl:Delta_single_dof_rope_length
% beta_sda: beta_single_dof_angle
% the document's 'ldt' is declared as 'ddtcp' here
r=1.62;
ddtcp=0.3;
Ns=6;
beta_sda=linspace(0,pi/20,100);
delta_sdrlo=(Ns-1).*(sqrt((r.*(1-cos(beta_sda))).^2+(ddtcp+r.*sin(beta_sda)).^2)-ddtcp);
delta_sdrl1=(Ns-1).*(r.*beta_sda);
delta_sdrl3=(Ns-1).*(r.*beta_sda-1/6*r.*beta_sda.^3);
figure;
hold on;
plot(beta_sda,delta_sdrlo,'k')
plot(beta_sda,delta_sdrl1,'r');
plot(beta_sda,delta_sdrl3,'b');
title('The Taylor expansion of the single dof segment');
xlabel('bend angle/rad');
ylabel('the change of rope length/mm');
hold off;
% single dof
% delta_sdrl:Delta_single_dof_rope_length
% beta_sda: beta_single_dof_angle
% the document's 'ldt' is declared as 'ddtcp' here
r=1.62;
ddtcp=0.3;
Nd=25;
beta_dda=linspace(0,pi/20,100);
delta_ddrlo=(Nd-1)./2*(sqrt((r.*(1-cos(beta_dda))).^2+(ddtcp+r.*sin(beta_dda)).^2)-ddtcp);
delta_ddrl1=(Nd-1)./2*(r.*beta_dda);
delta_ddrl3=(Nd-1)./2*(r.*beta_dda-1/6*r.*beta_dda.^3);
figure;
hold on;
plot(beta_dda,delta_ddrlo,'k')
plot(beta_dda,delta_ddrl1,'r');
plot(beta_dda,delta_ddrl3,'b');
title('The Taylor expansion of the double dof segment');
xlabel('bend angle/rad');
ylabel('the change of rope length/mm');
hold off;
%% find the bending angle when the change of rope length is given, plot their relationship to find the zero point
% single dof
% dc: diameter of the joint cylinder
% delta_sdrl:Delta_single_dof_rope_length
% beta_sda: beta_single_dof_angle
% the document's 'ldt' is declared as 'ddtcp' here
r=1.62;
dc=3.8;
ddtcp=0.3;
Ns=6;
delta_sdrlmax=1.2671;
delta_sdrl=linspace(-delta_sdrlmax,delta_sdrlmax,20);
% beta_sdr=linspace(-pi/20,pi/20,100);
beta_sdr=linspace(-asin(2*ddtcp/dc),asin(2*ddtcp/dc),100);
% beta_sdr=linspace(-3*pi,3*pi,1000);

beta_sol=ones(length(delta_sdrl),1);
y_sol=ones(length(delta_sdrl),1);



% use fzero to find the zero point of the angle
% myfun_s = @(x,d) x^3-6*x+6*d/((6-1)*1.62);
% myfun_s = @(x,d) (6-1)*(sqrt(1.62^2*(1-cos(x))^2+(0.3+1.62*sin(x))^2)-0.3)-d;
myfun_s = @(x,d) (6-1)*(sqrt(1.62^2*(1-cos(x))^2+(0.3-1.62*sin(x))^2)-0.3)+d;
for i=1:length(delta_sdrl)

d = delta_sdrl(i);                    % parameter
fun = @(x) myfun_s(x,d);    % function of x alone
x0=[-0.18 0.18];
beta_sol(i) = fzero(fun,x0);
y_sol(i)=fun(beta_sol(i));
end

% use the formula for finding the roots of a third-order polynomial
% beta_fsol=ones(length(delta_sdrl),3);
beta_fsol=ones(length(delta_sdrl),1);
y_fsol=ones(length(delta_sdrl),1);
omega=complex(-0.5,0.5*sqrt(3));

Delta=ones(1,length(delta_sdrl));
for i=1:length(delta_sdrl)
    p=-6;
    q=6*delta_sdrl(i)./((Ns-1)*r);
    Delta(i)=(q/2)^2+(p/3)^3;
    % all the Delta are less than 0, it means that the formular has three
    % roots
    A=(-q/2+sqrt(Delta(i)))^(1/3);
    B=(-q/2-sqrt(Delta(i)))^(1/3);
%     beta_fsol(i,1)=real(A+B);
%     beta_fsol(i,2)=real(omega*A+omega^2*B);
%     beta_fsol(i,1)=real(omega^2*A+omega*B);
    beta_fsol(i,1)=real(omega^2*A+omega*B);
    d = delta_sdrl(i);                    % parameter
    fun = @(x) myfun_s(x,d);    % function of x alone
    y_fsol(i,1)=fun(beta_fsol(i,1));
end


figure;
hold on;

cmap=colormap("parula");
for i=1:length(delta_sdrl)
    % use Taylor expansion to approximate the solution
%         y=beta_sdr.^3-6.*beta_sdr+6.*delta_sdrl(i)./((Ns-1)*r);
    % use the accurate solution
    y=(Ns-1).*(sqrt(r.^2.*(1-cos(beta_sdr)).^2+(ddtcp+r.*sin(beta_sdr)).^2)-ddtcp)-delta_sdrl(i);
    plot(beta_sdr,y,'Color',cmap(i*10,:));
end



z=zeros(1,length(beta_sdr));
plot(beta_sdr,z,'r');

scatter(beta_sol,y_sol,'MarkerEdgeColor',[0.47 0.67 0.19],'Marker','*');
scatter(beta_fsol,y_fsol,'MarkerEdgeColor',[0.67 0.47 0.19],'Marker','*');
xlim([-pi/20-0.01 pi/20+0.01]);
title('y=$\beta^3$-6$\beta$+$\frac{6\Delta_l}{(N_s-1)r}$','interpreter','latex');
xlabel('bend angle/rad');
ylabel('y');
% lgd=cell(1,length(delta_sdrl));
% for i=1:length(delta_sdrl)
%     lgd{i}=['$\Delta_l=$',num2str(round(delta_sdrl(i),4)),'mm'];
% end
% legend(lgd,'interpreter','latex');

real(beta_fsol)-beta_sol

