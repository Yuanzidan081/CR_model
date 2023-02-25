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

%% verify the algorithmn two segments 
t=[0;0;1;0;0;0];
norm_u=Calculate_norm_u(t(4:6));
ad_mat=Calculate_ad_mat(t)
Integral_exp_ad(1,norm_u,ad_mat)

%% visualization
% fig1=figure(1);
% fig_setting;
% 
% 
% for i=1:size(kappa,1)
% %     hold on;
%     for j=1:number_segments
%         text=['plot3(arc{',num2str(i),',',num2str(j),...
%             '}(:,1),arc{',num2str(i),',',num2str(j),...
%             '}(:,2),arc{',num2str(i),',',num2str(j),'}(:,3));'];
%         eval(text);
%         hold on;
%     end
%     line_setting;
%     axes_setting;
%     drawnow();
%     pause(0.2)
%     generate_gif;
% end
% 
% label_setting;





