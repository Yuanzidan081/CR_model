%% plot the line graph of disk top points
parameters;
% subplot(2,2,1);
% plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1.5,Color='b');
% hold on;
% scatter3(dtp(:,1),dtp(:,2),dtp(:,3),100,'Marker','.','Color','r');
% view(0,0);
% axis square;
% 
% subplot(2,2,2);
% plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1.5,Color='b');
% hold on;
% scatter3(dtp(:,1),dtp(:,2),dtp(:,3),100,'Marker','.','Color','r');
% view(-90,0);
% axis square;
% 
% subplot(2,2,3);
% plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1.5,Color='b');
% hold on;
% scatter3(dtp(:,1),dtp(:,2),dtp(:,3),100,'Marker','.','Color','r');
% view(0,90);
% axis square;
% 
% 
% subplot(2,2,4);
figure;
plot3(dtp(:,1),dtp(:,2),dtp(:,3),LineWidth=1.5,Color='k');
hold on;
axis square;
quiver3(dtpx,dtpy,dtpz,dtp_c(:,1),dtp_c(:,2),dtp_c(:,3),0.2,'LineWidth',1,'Color',[1 0 0]);
quiver3(dtpx,dtpy,dtpz,dtp_c(:,4),dtp_c(:,5),dtp_c(:,6),0.2,'LineWidth',1,'Color',[0 1 0]);
quiver3(dtpx,dtpy,dtpz,dtp_c(:,7),dtp_c(:,8),dtp_c(:,9),0.2,'LineWidth',1,'Color',[0 0 1]);
scatter3(dtp(:,1),dtp(:,2),dtp(:,3),100,'Marker','.','Color','r');
setax3;

function setax3
set(gcf,'Color','#ffffff');
set(gcf,    ...
    'units','pixels','position',[100,100,622.2857142857142,416]);
set(gca,                ...
    'View',        [-90,90],...
    'Box',        'on',...
    'BoxStyle',      'back');
set(gca,                ...
    'Xlim',        [-2,20],...
    'Ylim',        [-13,2],...
    'Zlim',      [0,13]);
hXLabel=get(gca,'XLabel');
hYLabel=get(gca,'YLabel');
hZLabel=get(gca,'ZLabel');

set(hXLabel,        ...
    'String',      'X(m)',...
    'FontSize', 12);

set(hYLabel,        ...
    'String',      'Y(m)',...
    'FontSize', 12);

set(hZLabel,        ...
    'String',      'Z(m)',...
    'FontSize', 12);
set(gca,                ...
    'DataAspectRatio', [1,1,1]);
% set(gca,                ...
%     'view', [-90,90]);
end