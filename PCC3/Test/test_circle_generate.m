
% addpath("Model\Function\")


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test the function Calculate_circle_center.m
% arc test example
p1=10*rand(3,1);
p2=10*rand(3,1);
p3=10*rand(3,1);



[r,po]=Calculate_circle_center(p1,p2,p3);
figure;

scatter3(po(1),po(2),po(3),'MarkerFaceColor','k', ...
    'MarkerEdgeColor','none','SizeData',10);
hold on;
scatter3(p1(1),p1(2),p1(3), ...
    'MarkerFaceColor','#E41A1C', ...
    'MarkerEdgeColor','none', ...
    'SizeData',50);
% scatter3(p2(1),p2(2),p2(3), ...
%     'MarkerFaceColor','#377EB8', ...
%     'MarkerEdgeColor','none', ...
%     'SizeData',40);
scatter3(p3(1),p3(2),p3(3), ...
    'MarkerFaceColor','#4DAF4A', ...
    'MarkerEdgeColor','none', ...
    'SizeData',30);


% line([p1(1),po(1)],[p1(2),po(2)],[p1(3),po(3)]);
% line([p2(1),po(1)],[p2(2),po(2)],[p2(3),po(3)]);
% line([p3(1),po(1)],[p3(2),po(2)],[p3(3),po(3)]);
% view(3);
% disp(['norm(po1)=',num2str(norm(po-p1))]);
% disp(['norm(po2)=',num2str(norm(po-p2))]);
% disp(['norm(po3)=',num2str(norm(po-p3))]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test the function Define_arc_type.m

arc_type=Define_arc_type(p1,p2,p3);
disp(['the arc type is ', arc_type]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test the function Interp_arc.m
n=50;
[interp_points,p_n]=Interp_arc(p1,p3,po,arc_type,r,n);
plot3(interp_points(:,1),interp_points(:,2),interp_points(:,3), ...
    'Color','#984EA3', ...
    'LineWidth',5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test the function Calculate_disk_edge.m

r_disk=0.3;
%%% single point test
% disk_edge_points = Calculate_disk_edge(p1,po,p_n,r_disk);
% plot3(disk_edge_points(:,1),disk_edge_points(:,2),disk_edge_points(:,3),'Color','#E7298A');
% patch(disk_edge_points(:,1),disk_edge_points(:,2),disk_edge_points(:,3),'red');

%%% multi-point test
h=0.2;
for i=1:length(interp_points)
disk_edge_points = Calculate_disk_edge((interp_points(i,:))',po,p_n,r_disk,h);
if h==0
    plot3(disk_edge_points(:,1),disk_edge_points(:,2),disk_edge_points(:,3),'Color','#E7298A');
    patch(disk_edge_points(:,1),disk_edge_points(:,2),disk_edge_points(:,3),'red');
else
    surf(disk_edge_points(:,[1,4]),disk_edge_points(:,[2,5]),disk_edge_points(:,[3,6]),'FaceColor','r');
    patch(disk_edge_points(:,1),disk_edge_points(:,2),disk_edge_points(:,3),'red');
    patch(disk_edge_points(:,4),disk_edge_points(:,5),disk_edge_points(:,6),'red');
% plot3(disk_edge_points(:,1),disk_edge_points(:,2),disk_edge_points(:,3),'Color','#E7298A');
% plot3(disk_edge_points(:,4),disk_edge_points(:,5),disk_edge_points(:,6),'Color','#E7298A');
end

end