len=size(P_target,1);
set(gcf,'Color','#FFFFFF')
label_setting;
hold on;

T=title('Inverse kinematics simulation');

set(T,        ...
    'FontWeight', 'bold',...
    'FontSize', 12);

for i=1:size(P_target,1)
    ax_P_res=plot3(axes2,P_res(:,1),P_res(:,2),P_res(:,3),'Color','b','LineWidth',1);
    ax_P_res.Color(4)=1  ;
%     if mod(i,round(len/4))==0
    for j=1:number_segments
        text=['ax=plot3(axes2,arc{',num2str(i),',',num2str(j),...
            '}(:,1),arc{',num2str(i),',',num2str(j),...
            '}(:,2),arc{',num2str(i),',',num2str(j),'}(:,3));'];
        eval(text);
        
    end
    
    

    line_IK_setting;
%     end
    axes_setting;
    
    drawnow();
    pause(0.2)
    generate_gif;
    if i ~= size(P_target,1)
    delete(ax);
%     delete(ax_P_res);
    end
end
