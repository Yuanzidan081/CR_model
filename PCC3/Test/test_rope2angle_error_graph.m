%% find the bending angle when the change of rope length is given, plot their relationship to find the zero point
% single dof
% dc: diameter of the joint cylinder
% delta_sdrl:Delta_single_dof_rope_length
% beta_sda: beta_single_dof_angle
% the document's 'ldt' is declared as 'ddtcp' here
clc;
clear;
close all;
r=1.62;
dc=3.8;
ddtcp=0.3;
Ns=6;
delta_sdrlmax=1.2671;
delta_sdrl=linspace(-delta_sdrlmax,delta_sdrlmax,10);
beta_sdr=linspace(-pi/20,pi/20,100);
% beta_sdr=linspace(-asin(2*ddtcp/dc),asin(2*ddtcp/dc),100);
% beta_sdr=linspace(-3*pi,3*pi,1000);

beta_sol=ones(length(delta_sdrl),1);
y_sol=ones(length(delta_sdrl),1);



% use fzero to find the zero point of the angle
% myfun_s = @(x,d) x^3-6*x+6*d/((6-1)*1.62);
myfun_s = @(x,d) (6-1)*(sqrt(1.62^2*(1-cos(x))^2+(0.3+1.62*sin(x))^2)-0.3)-d;%Delta L2
% myfun_s = @(x,d) (6-1)*(sqrt(1.62^2*(1-cos(x))^2+(0.3-1.62*sin(x))^2)-0.3)+d;%Delta L4
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


figure(1);
subplot(2,1,1);
hold on;
box on;
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

% considering the sign of the rope length



subplot(2,1,2);
hold on;
box on;
plot(delta_sdrl,real(beta_fsol)-beta_sol,'b');
% plot(delta_sdrl,real(beta_fsol)-beta_sol,'b');
xlabel('\Delta L_2/mm');
ylabel('error of bending angle/rad');
title('Error of bending angle-single DOF model');


%% find the bending angle when the change of rope length is given, plot their relationship to find the zero point
% double dof
% dc: diameter of the joint cylinder
% delta_ddrl:Delta_double_dof_rope_length
% beta_dda: beta_double_dof_angle
% the document's 'ldt' is declared as 'ddtcp' here
r=1.62;
dc=3.8;
ddtcp=0.3;
Nd=25;
delta_ddrlmax=3.0411;
delta_ddrl=linspace(-delta_ddrlmax,delta_ddrlmax,10);
beta_ddr=linspace(-pi/20,pi/20,100);
% beta_ddr=linspace(-asin(2*ddtcp/dc),asin(2*ddtcp/dc),100);
% beta_ddr=linspace(-3*pi,3*pi,1000);

beta_sol=ones(length(delta_ddrl),1);
y_sol=ones(length(delta_ddrl),1);



% use fzero to find the zero point of the angle
% myfun_s = @(x,d) x^3-6*x+6*d/((6-1)*1.62);
myfun_s = @(x,d) (25-1)/2*(sqrt(1.62^2*(1-cos(x))^2+(0.3+1.62*sin(x))^2)-0.3)-d;%Delta L2
% myfun_s = @(x,d) (25-1)/2*(sqrt(1.62^2*(1-cos(x))^2+(0.3-1.62*sin(x))^2)-0.3)+d;%Delta L4
for i=1:length(delta_ddrl)
d = delta_ddrl(i);                    % parameter
fun = @(x) myfun_s(x,d);    % function of x alone
x0=[-0.18 0.18];
beta_sol(i) = fzero(fun,x0);
y_sol(i)=fun(beta_sol(i));
end

% use the formula for finding the roots of a third-order polynomial
% beta_fsol=ones(length(delta_ddrl),3);
beta_fsol=ones(length(delta_ddrl),1);
y_fsol=ones(length(delta_ddrl),1);
omega=complex(-0.5,0.5*sqrt(3));
Delta=ones(1,length(delta_ddrl));
for i=1:length(delta_ddrl)
    p=-6;
    q=12*delta_ddrl(i)./((Nd-1)*r);
    Delta(i)=(q/2)^2+(p/3)^3;
    % all the Delta are less than 0, it means that the formular has three
    % roots
    A=(-q/2+sqrt(Delta(i)))^(1/3);
    B=(-q/2-sqrt(Delta(i)))^(1/3);
%     beta_fsol(i,1)=real(A+B);
%     beta_fsol(i,2)=real(omega*A+omega^2*B);
%     beta_fsol(i,1)=real(omega^2*A+omega*B);
    beta_fsol(i,1)=real(omega^2*A+omega*B);
    d = delta_ddrl(i);                    % parameter
    fun = @(x) myfun_s(x,d);    % function of x alone
    y_fsol(i,1)=fun(beta_fsol(i,1));
end


figure(1);
subplot(2,1,1);
hold on;
box on;
cmap=colormap("parula");
for i=1:length(delta_ddrl)
    % use Taylor expansion to approximate the solution
%         y=beta_ddr.^3-12.*beta_ddr+6.*delta_ddrl(i)./((Nd-1)*r);
    % use the accurate solution
    y=(Nd-1)/2.*(sqrt(r.^2.*(1-cos(beta_ddr)).^2+(ddtcp+r.*sin(beta_ddr)).^2)-ddtcp)-delta_ddrl(i);
    plot(beta_ddr,y,'Color',cmap(i*10,:));
end



z=zeros(1,length(beta_ddr));
plot(beta_ddr,z,'r');

scatter(beta_sol,y_sol,'MarkerEdgeColor',[0.47 0.67 0.19],'Marker','*');
scatter(beta_fsol,y_fsol,'MarkerEdgeColor',[0.67 0.47 0.19],'Marker','*');
xlim([-pi/20-0.01 pi/20+0.01]);
title('y=$\beta^3$-6$\beta$+$\frac{12\Delta_l}{(N_d-1)r}$','interpreter','latex');
xlabel('bend angle/rad');
ylabel('y');
% lgd=cell(1,length(delta_ddrl));
% for i=1:length(delta_ddrl)
%     lgd{i}=['$\Delta_l=$',num2str(round(delta_ddrl(i),4)),'mm'];
% end
% legend(lgd,'interpreter','latex');

% considering the sign of the rope length



subplot(2,1,2);
hold on;
box on;
plot(delta_ddrl,real(beta_fsol)-beta_sol,'b');
% plot(delta_ddrl,real(beta_fsol)-beta_sol,'b');
xlabel('\Delta L_2/mm');
ylabel('error of bending angle/rad');
title('Error of bending angle-double DOF model');


