clc;
close all;
clear;
addpath("Model\Function\")
p1=10*rand(3,1);
p2=10*rand(3,1);
p3=10*rand(3,1);

% disp(['p1=[',num2str(p1(1)),',',num2str(p1(2)),',',num2str(p1(3)),']']);
% disp(['p2=[',num2str(p2(1)),',',num2str(p2(2)),',',num2str(p2(3)),']']);
% disp(['p3=[',num2str(p3(1)),',',num2str(p3(2)),',',num2str(p3(3)),']']);
po=Calculate_circle_center(p1,p2,p3);
figure;

scatter3(po(1),po(2),po(3),'MarkerFaceColor','k', ...
    'MarkerEdgeColor','none','SizeData',10);
hold on;
scatter3(p1(1),p1(2),p1(3), ...
    'MarkerFaceColor','#E41A1C', ...
    'MarkerEdgeColor','none', ...
    'SizeData',50);
scatter3(p2(1),p2(2),p2(3), ...
    'MarkerFaceColor','#377EB8', ...
    'MarkerEdgeColor','none', ...
    'SizeData',40);
scatter3(p3(1),p3(2),p3(3), ...
    'MarkerFaceColor','#4DAF4A', ...
    'MarkerEdgeColor','none', ...
    'SizeData',30);


line([p1(1),po(1)],[p1(2),po(2)],[p1(3),po(3)]);
line([p2(1),po(1)],[p2(2),po(2)],[p2(3),po(3)]);
line([p3(1),po(1)],[p3(2),po(2)],[p3(3),po(3)]);
view(3);
disp(['norm(po1)=',num2str(norm(po-p1))]);
disp(['norm(po2)=',num2str(norm(po-p2))]);
disp(['norm(po3)=',num2str(norm(po-p3))]);