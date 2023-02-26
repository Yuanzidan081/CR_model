clc;
clear;
close all;

% add path to main.m
addpath('Model/kinematics_ScrewTheory/');
addpath('Model/common/');
addpath('Parameter/');
addpath('Visulization\');

% import the parameters
parameter;

%% verify the algorithmn of some shapes

% square
tspan = 0:deg2rad(3):2*pi;

x_tip = 0.2*cos(tspan);
y_tip = 0.25*sin(tspan);
z_tip = 0.9*ones(1,length(tspan));
P_target = [x_tip; y_tip; z_tip];
% P_target=[0.2;0.4;0.6]

err_bound=0.001;
torsion_mode='0';
orientation_mode='0';
for i=1:size(P_target,2)
tic;
if i==1
[P_actual,kappa,tau,alpha,delta_p,final_twist] = IK_n_segments...
    (P_target(:,i),...
    number_arc_interval,...
    number_segments,...
    length_arc,...
    err_bound,...
    torsion_mode,...
    orientation_mode,...
    disk_interval,[]);
else
    [P_actual,kappa,tau,alpha,delta_p,final_twist] = IK_n_segments...
    (P_target(:,i),...
    number_arc_interval,...
    number_segments,...
    length_arc,...
    err_bound,...
    torsion_mode,...
    orientation_mode,...
    disk_interval,ft);
end
ft=final_twist;
% P_mat(:,i)=P_actual;
P_res(1,:)=P_actual';

toc;
[H{i},~,p{i},F] = FK_n_segments(kappa(:,1),tau,alpha,number_arc_interval,number_segments,disk_interval);
for j=1:number_segments
        % the j th segment and the i th deformmation shape()t
    arc{i,j}=p{i}(number_arc_interval_cumsum(j)+1:number_arc_interval_cumsum(j+1)+1,:);
end
end

P_target=P_target';
%% visualization



fig1=figure(1);
fig_setting;



for i=1:size(P_target,1)
    
    hold on;
    
    ax_P_res=plot3(P_res(:,1),P_res(:,2),P_res(:,3),'Color','r');
    ax_P_target=plot3(P_target(:,1),P_target(:,2),P_target(:,3),'Color','b');
    for j=1:number_segments
        text=['plot3(arc{',num2str(i),',',num2str(j),...
            '}(:,1),arc{',num2str(i),',',num2str(j),...
            '}(:,2),arc{',num2str(i),',',num2str(j),'}(:,3));'];
        eval(text);
        hold on;
    end
    
    

    line_IK_setting;
    axes_setting;
    drawnow();
    pause(0.2)
    generate_gif;
    delete(ax);
    
end

label_setting;





