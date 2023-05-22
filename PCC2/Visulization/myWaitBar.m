classdef myWaitBar
    %MYWAITBAR 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        Fig
        Text
        maxIter
        Line1
        Line2
    end
    
    methods
        function obj = myWaitBar(maxIter)
            obj.maxIter = maxIter;
            close all;
            WS = get(0,'ScreenSize');
            wt = 500;
            ht = 100;
            obj.Fig = figure('Position', [(WS(3)-wt)/2,(WS(4)-ht)/2,wt,ht],...
                'Name','Simulation Performance','NumberTitle','off','menu','none',...
                'Color','white','Resize','off');
            % Prompt
            Prompt_h = ht/2;
            Prompt_w = wt;
            Prompt_Info = uipanel(obj.Fig, 'Units', 'pixels','Position',[1,ht/2,Prompt_w,Prompt_h],'BackgroundColor','#FAFAFA');
            obj.Text = cell (4,1);
            Text_y =Prompt_h/2;
            Text_x = 0;
            string_list = {'Average iterations','Processing', 'Max iteration','Processing','Average time','Processing','Max time','Processing'};
            for i = 1:2
                for j = 1:4
                    k = (i-1)*4+j;
                    obj.Text{k} = uicontrol(Prompt_Info, 'style','edit','Units','pixels','Enable','off', ...
                        'Position',[Text_x,Text_y,Prompt_w/4,Prompt_h/2],'String',string_list{k},'FontSize',10);
                    Text_x = Text_x+Prompt_w/4;
                end
                Text_x = 0;
                Text_y = Text_y-Prompt_h/2;
            end

            % Axesbar
            Axes_xoffset = 0;
            Axes_yoffset = 10;
            Axesbar = axes(obj.Fig, 'Units','pixels','Position',[Axes_xoffset,1+Axes_yoffset,wt-2*Axes_xoffset,ht/2-2*Axes_yoffset]);
            axis(Axesbar, [-0.05,1.05,-0.2,0.2]);
            axis(Axesbar,'off');
            hold(Axesbar,'on');

            
            obj.Line1 = plot(Axesbar, [0,1], [0,0], '-', 'Color', [0.9,0.9,0.9],'LineWidth',15);
            obj.Line2 = plot(Axesbar, [0,0], [0,0], '-', 'Color', [0.1,0.9,0.1],'LineWidth',15);
            hold(Axesbar,'off');
            drawnow

        end
        
        function updateData(obj,iterations,ct)
            set(obj.Text{2},'string',mean(iterations));
            set(obj.Text{4},'string',max(iterations));
            set(obj.Text{6},'string',mean(ct));
            set(obj.Text{8},'string',max(ct));
        end
        function updateWaitBar(obj,iteration)
            i = iteration/obj.maxIter;
            obj.Line1.XData = [i,1];
            obj.Line2.XData = [0,i];
            if mod(iteration,3)==0
                set(obj.Text{2},'string','.');
                set(obj.Text{4},'string','.');
                set(obj.Text{6},'string','.');
                set(obj.Text{8},'string','.');
            elseif mod(iteration,3)==1
                set(obj.Text{2},'string','..');
                set(obj.Text{4},'string','..');
                set(obj.Text{6},'string','..');
                set(obj.Text{8},'string','..');
            elseif mod(iteration,3)==2
                set(obj.Text{2},'string','...');
                set(obj.Text{4},'string','...');
                set(obj.Text{6},'string','...');
                set(obj.Text{8},'string','...');
            end
            drawnow
        end
        function maketxt(obj,txtName,para,mode)
            filename=[txtName,'.txt'];
            fileID = fopen(filename,mode);
            fprintf(fileID,'lambda=%s\n',para);
            fprintf(fileID,'%s|%s|%s|%s|%s|%s|%s|%s\n',obj.Text{1}.String,obj.Text{3}.String,...
                obj.Text{5}.String,obj.Text{7}.String,'Max error','Max X error','Max Y error','Max Z error');
            fclose(fileID);
        end
        function writetxt(obj,txtName,para)
            filename=[txtName,'.txt'];
            fileID = fopen(filename,'a+');
            fprintf(fileID,'%s|%s|%s|%s|%f|%f|%f|%f\n\n',obj.Text{2}.String,obj.Text{4}.String,...
                obj.Text{6}.String,obj.Text{8}.String,para{1},para{2},para{3},para{4});
            fclose(fileID);

        end
    end
end

