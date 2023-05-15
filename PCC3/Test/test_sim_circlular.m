parameters;
%% verify that the disk can be simulated with circular curve 
ind=1:N;
x=dtp(ind,1);
y=dtp(ind,2);
z=dtp(ind,3);
% figure;
% hold on;
% plot(x,y,'LineWidth',1,'Color',[0 0 1]);
% scatter(x,y,'Marker','*','Color',[1 0 0]);
figure;
subplot(1,2,1);
hold on;
plot3(x,y,z,'LineWidth',2,'Color',[0 0 1]);
scatter3(x,y,z,100,'Marker','.','MarkerEdgeColor',[1 0 0],'MarkerFaceColor',[1 0 0],'LineWidth',1);
axis square;
quiver3(dtpx,dtpy,dtpz,dtp_c(:,1),dtp_c(:,2),dtp_c(:,3),0.3,'LineWidth',1,'Color',[1 0 0]);
quiver3(dtpx,dtpy,dtpz,dtp_c(:,4),dtp_c(:,5),dtp_c(:,6),0.3,'LineWidth',1,'Color',[0 1 0]);
quiver3(dtpx,dtpy,dtpz,dtp_c(:,7),dtp_c(:,8),dtp_c(:,9),0.3,'LineWidth',1,'Color',[0 0 1]);
setax3;
hold off;
subplot(1,2,2);
hold on;
plot3(x,y,z,'LineWidth',3,'Color',[0 0 1]);
r_disk=1.9;
h=0.7;
for i=1:length(dtpx)
    p=[dtpx(i);dtpy(i);dtpz(i)];
    p_z=[dtp_c(i,7);dtp_c(i,8);dtp_c(i,9)];
    disk_edge_points = Calculate_disk_ledge(p,p_z,r_disk,h);
if h==0
    plot3(disk_edge_points(:,1),disk_edge_points(:,2),disk_edge_points(:,3),'Color','#E7298A');
    patch(disk_edge_points(:,1),disk_edge_points(:,2),disk_edge_points(:,3),'red');
else
    surf(disk_edge_points(:,[1,4]),disk_edge_points(:,[2,5]),disk_edge_points(:,[3,6]),'FaceColor','r');
    patch(disk_edge_points(:,1),disk_edge_points(:,2),disk_edge_points(:,3),'red');
    patch(disk_edge_points(:,4),disk_edge_points(:,5),disk_edge_points(:,6),'red');
end
end
setax3;

function setax3
set(gcf,'Color','#ffffff');
set(gcf,    ...
    'units','pixels','position',[200,200,600,300]);
set(gca,                ...
    'View',        [-80,20],...
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

end