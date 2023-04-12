clc;
clear;
close all;
%% plot the relationship between the length of rope and the angle
% single dof
% delta_sdrl:Delta_single_dof_rope_length
% beta_sda: beta_single_dof_angle
% the document's 'ldt' is declared as 'ddtcp' here
r=1.62;
ddtcp=0.3;
Ns=6;
beta_sda=linspace(-pi/20,pi/20,100);
delta_sdrlo=(Ns-1).*(sqrt((r.*(1-cos(beta_sda))).^2+(ddtcp+r.*sin(beta_sda)).^2)-ddtcp);
delta_sdrl1=(Ns-1).*(r.*beta_sda);
delta_sdrl3=(Ns-1).*(r.*beta_sda-1/6*r.*beta_sda.^3);
figure(1);
subplot(2,1,1);
hold on;
box on;
plot(beta_sda,delta_sdrlo,'k');
plot(beta_sda,delta_sdrl1,'r');
plot(beta_sda,delta_sdrl3,'b');
title('Comparison of \Delta L_2 with 1st Taylor, 3rd Taylor and precise single DOF model');
xlabel('bending angle/rad');
ylabel('\Delta L_2/mm');
legend({'precise model','1st-order Taylor''s model','3rd-order Taylor''s model'},...
    'Location','northwest');
hold off;

subplot(2,1,2);
hold on;
box on;
plot(beta_sda,delta_sdrlo-delta_sdrl1,'r');
plot(beta_sda,delta_sdrlo-delta_sdrl3,'b');
title('Comparison of \Delta L_2''s error with 1st Taylor, 3rd Taylor and precise single DOF model');
xlabel('bending angle/rad');
ylabel('The approximate error/mm');
legend({'1st-order Taylor''s approximation error','3rd-order Taylor''s approximation error'},...
   'Location','northeast');
hold off;
%%
% double dof
% delta_sdrl:Delta_double_dof_rope_length
% beta_dda: beta_double_dof_angle
% the document's 'ldt' is declared as 'ddtcp' here
r=1.62;
ddtcp=0.3;
Nd=25;
beta_dda=linspace(-pi/20,pi/20,100);
delta_ddrlo=(Nd-1)./2*(sqrt((r.*(1-cos(beta_dda))).^2+(ddtcp+r.*sin(beta_dda)).^2)-ddtcp);
delta_ddrl1=(Nd-1)./2*(r.*beta_dda);
delta_ddrl3=(Nd-1)./2*(r.*beta_dda-1/6*r.*beta_dda.^3);
figure(2);
subplot(2,1,1);
hold on;
box on;
plot(beta_dda,delta_ddrlo,'k')
plot(beta_dda,delta_ddrl1,'r');
plot(beta_dda,delta_ddrl3,'b');
title('Comparison of \Delta L_2 with 1st Taylor, 3rd Taylor and precise double DOF model');
xlabel('bending angle/rad');
ylabel('\Delta L_2/mm');
legend({'precise model','1st-order Taylor''s model','3rd-order Taylor''s model'},...
    'Location','northwest');
hold off;


subplot(2,1,2);
hold on;
box on;
plot(beta_dda,delta_ddrlo-delta_ddrl1,'r');
plot(beta_dda,delta_ddrlo-delta_ddrl3,'b');
title('Comparison of \Delta L_2''s error with 1st Taylor, 3rd Taylor and precise double DOF model');
xlabel('bending angle/rad');
ylabel('The approximate error/mm');
legend({'1st-order Taylor''s approximation error','3rd-order Taylor''s approximation error'},...
   'Location','northeast');
hold off;
