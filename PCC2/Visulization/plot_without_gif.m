fig_setting;

len=size(P_target,1);

subplot(4,2,[1,3,5,7]);
for i=1:size(P_target,1)
    
    
    ax_P_target=plot3(P_target(:,1),P_target(:,2),P_target(:,3),'Color','r','LineWidth',2,'LineStyle','-.');
    ax_P_target.Color(4)=1;
    hold on;
    ax_P_res=plot3(P_res(:,1),P_res(:,2),P_res(:,3),'Color','b','LineWidth',1);
    ax_P_res.Color(4)=1  ;
    
    if mod(i,round(len/4))==0
    for j=1:number_segments
        text=['plot3(arc{',num2str(i),',',num2str(j),...
            '}(:,1),arc{',num2str(i),',',num2str(j),...
            '}(:,2),arc{',num2str(i),',',num2str(j),'}(:,3));'];
        eval(text);
        hold on;
    end
    
    

    line_IK_setting;
    end
    axes_setting;
    legend('Desired','Simulated','Location','best')
%     drawnow();
%     pause(0.2)
%     generate_gif;
%     delete(ax);
    
end

label_setting;

% step=
subplot(4,2,2);
plot((P_res(:,1)-P_target(:,1))*1e3,'LineWidth',1,'Color','b');
set(gca,'FontWeight','bold');
ylabel('X(mm)','FontWeight','bold','FontSize', 12);
title('Tip position error','FontWeight','bold','FontSize', 12);
xlim([1,len]);

subplot(4,2,4);
plot((P_res(:,2)-P_target(:,2))*1e3,'LineWidth',1,'Color','b');
set(gca,'FontWeight','bold');
ylabel('Y(mm)','FontWeight','bold','FontSize', 12);
xlim([1,len]);

subplot(4,2,6);
plot((P_res(:,3)-P_target(:,3))*1e3,'LineWidth',1,'Color','b');
set(gca,'FontWeight','bold');
ylabel('Z(mm)','FontWeight','bold','FontSize', 12);
xlim([1,len]);

subplot(4,2,8);
plot(Err_res*1e3,'LineWidth',1,'Color','r');
set(gca,'FontWeight','bold');
ylabel('norm(mm)','FontWeight','bold','FontSize', 12);
xlabel('step','FontWeight','bold','FontSize', 12);
xlim([1,len]);
