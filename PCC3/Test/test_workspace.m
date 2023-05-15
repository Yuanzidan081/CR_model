%% find the relationship betweeen end position x/y/z and two angles,
% the last graph shows the workspcae of the flexible manipulator with 20 joints
ldt=0.3;
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