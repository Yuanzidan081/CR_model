clc;
clear;
close all;

% add path to main.m
addpath('Model/kinematics_ScrewTheory/');
addpath('Model/optimization/');
addpath('Parameter/');
addpath('Visulization\');

% import the parameters
parameter;

%% verify the algorithmn of some shapes

% 8
% tspan = 0:deg2rad(0.5):2*pi;
% x_tip = 0.25*sign((cos(tspan))).*(sin(tspan)).*cos(tspan).^2;
% y_tip = 0.25*sign(cos(tspan)).*cos(tspan).^2;
% z_tip = 0.9*ones(1,length(tspan));
% P_target = [x_tip', y_tip', z_tip'];

%circle
tspan = 0:deg2rad(3):2*pi;
x_tip = 0.25*cos(tspan);
y_tip = 0.25*sin(tspan);
z_tip = 0.9*ones(1,length(tspan));
P_target = [x_tip', y_tip', z_tip'];


err_bound=0.001;
torsion_mode='0';
orientation_mode='0';
sample_point=size(P_target,1);

% lambda_range = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9];
lambda_range = [0.1,0.2];
for k=1:length(lambda_range)

    global lambda
    lambda=lambda_range(k);

    % initialize the wait bar
    wb = myWaitBar(sample_point);
    txtname = 'data3';
    if k==1
        mode='w+';
    else
        mode='a+';
    end
    wb.maketxt(txtname,lambda,mode);

    % start simulation
    for i=1:sample_point
        tic;
        if i==1
            [P_actual,kappa,tau,alpha,Delta_p,final_twist,iteration_times] = IK_n_segments...
                (P_target(i,:),...
                number_arc_interval,...
                number_segments,...
                length_arc,...
                err_bound,...
                torsion_mode,...
                orientation_mode,...
                disk_interval,[]);
        else
            [P_actual,kappa,tau,alpha,Delta_p,final_twist,iteration_times] = IK_n_segments...
                (P_target(i,:),...
                number_arc_interval,...
                number_segments,...
                length_arc,...
                err_bound,...
                torsion_mode,...
                orientation_mode,...
                disk_interval,ft);
        end

        % P_mat(:,i)=P_actual;
        Err_res(i,:)=Delta_p;
        P_res(i,:)=P_actual';

        ct(i,:)=toc;%final computation time
        ft=final_twist;

        iter(i,:)=iteration_times;%final iteration times

        % update the waitbar
        wb.updateWaitBar(i);

        % forward kinematics to get the actual pose
        [H{i},~,p{i},F] = FK_n_segments(kappa(:,1),tau,alpha,number_arc_interval,number_segments,disk_interval);
        for j=1:number_segments
            % the j th segment and the i th deformmation shape
            arc{i,j}=p{i}(number_arc_interval_cumsum(j)+1:number_arc_interval_cumsum(j+1)+1,:);
        end
    end
    terror=max(Err_res)*1e3;
    xerror=max(P_res(:,1)-P_target(:,1))*1e3;
    yerror=max(P_res(:,2)-P_target(:,2))*1e3;
    zerror=max(P_res(:,3)-P_target(:,3))*1e3;
    para={terror,xerror,yerror,zerror};
    wb.updateData(iter,ct);

    wb.writetxt(txtname,para);
    disp(['the ', num2str(k),' th test finished!']);
%     
    close(findobj('Name','Simulation Performance'));
    clear wb;
end
disp(['all tests finished!']);
%% visualization

fig2=figure;
axes2 = axes(fig2);
plot_with_gif;
% plot_without_gif;

%%
% fprintf('Average iterations: %.4f\nMax iterations: %d\nAverage time: %.4f\nMax time: %.4f',mean(iter),max(iter),mean(ct),max(ct))