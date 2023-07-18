f = getframe(fig2);
imind = frame2im(f);
[imind,cm] = rgb2ind(imind,256);
if i == 1
	imwrite(imind,cm,'demo_FK_2.gif','gif', 'Loopcount',inf,'DelayTime',0.1);
else
    imwrite(imind,cm,'demo_FK_2.gif','gif','WriteMode','append','DelayTime',0.2);
end