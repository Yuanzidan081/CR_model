%% the relationship between angle and the change of rope
% single dof
% delta_sdrlmax:Delta_single_dof_rope_length_max
% beta_sdamax: beta_single_dof_angle_max
% the document's 'ldt' is declared as 'ddtcp' here
clc;
clear;
close all;

r=1.62;
ddtcp=0.3;
Ns=6;
beta_sdafmax=pi/20;
beta_sdanmax=-pi/20;
% use Taylor expansion to calculate the change of the rope
delta_sdrlfmax=(Ns-1)*(r*beta_sdafmax-1/6*r*beta_sdafmax^3);
delta_sdrlnmax=(Ns-1)*(r*beta_sdanmax-1/6*r*beta_sdanmax^3);
disp('the positive maximum / negative maximum change of rope in the single segment is');
disp([num2str(delta_sdrlfmax),'/',num2str(delta_sdrlnmax)]);
% use the actual change and the approximate change of rope to compute error
error_sdrlfmax=(Ns-1).*(sqrt((r.*(1-cos(beta_sdafmax))).^2+(ddtcp+r.*sin(beta_sdafmax)).^2)-ddtcp)-delta_sdrlfmax;
error_sdrlnmax=(Ns-1).*(sqrt((r.*(1-cos(beta_sdanmax))).^2+(ddtcp+r.*sin(beta_sdanmax)).^2)-ddtcp)-delta_sdrlnmax;
disp('the positive maximum / negative minimun error of rope in the single segment is');
disp([num2str(error_sdrlfmax),'/',num2str(error_sdrlnmax)]);
% double dof
% delta_ddrlmax:Delta_double_dof_rope_length_max
% beta_ddamax: beta_double_dof_angle_max
r=1.62;
ddtcp=0.3;
Nd=25;
beta_ddafmax=pi/20;
beta_ddanmax=-pi/20;
delta_ddrlfmax=(Nd-1)/2*(r*beta_ddafmax-1/6*r*beta_ddafmax^3);
delta_ddrlnmax=(Nd-1)/2*(r*beta_ddanmax-1/6*r*beta_ddanmax^3);
disp('the positive maximum / negative maximum of rope in the double segment is');
disp([num2str(delta_ddrlfmax),'/',num2str(delta_ddrlnmax)]);
error_ddrlfmax=(Nd-1)/2.*(sqrt((r.*(1-cos(beta_ddafmax))).^2+(ddtcp+r.*sin(beta_ddafmax)).^2)-ddtcp)-delta_ddrlfmax;
error_ddrlnmax=(Nd-1)/2.*(sqrt((r.*(1-cos(beta_ddanmax))).^2+(ddtcp+r.*sin(beta_ddanmax)).^2)-ddtcp)-delta_ddrlnmax;
disp('the positive maximum / negative maximum error of rope in the double segment is');
disp([num2str(error_ddrlfmax),'/',num2str(error_ddrlnmax)]);
