function end_y = generate_ysurf(beta_x0,beta_y0,ldt)
%generate_ysurf
% Author: Lin Siyuan
% Date : 2023/03/27
% purpose: to find the relationship between two angles and y coordinate of 
% end effector
%
% Input: 
%   beta_x0 | type:(m,n): the range of beta_x produced by meshgrid, it should includes 0
%   beta_y0 | type:(n,m): the range of beta_y produced by meshgrid, it should includes 0
%   ldt    | type:double: base_top_point+disk_top_center_to_plane_distance 
% Output:
%   end_y | type:(1,n): the y of beta_x and beta_y
end_y=-((cos(beta_x0)+1).*cos(beta_y0)+cos(beta_x0)-2).*((cos(beta_x0)+1).*cos(beta_y0)...
+cos(beta_x0)).*((cos(beta_x0)+1).^6.*cos(beta_y0).^6+6.*(cos(beta_x0)-5/6).*(cos(beta_x0)+1).^5.*cos(beta_y0).^5 ...
+15.*(cos(beta_x0).^2-5./3.*cos(beta_x0)+1/3).*(cos(beta_x0)+1).^4.*cos(beta_y0).^4+20.*(cos(beta_x0).^3 ...
-2.5.*cos(beta_x0).^2+cos(beta_x0)+0.3).*(cos(beta_x0)+1).^3.*cos(beta_y0).^3+(15.*cos(beta_x0).^6 ...
-20.*cos(beta_x0).^5-55.*cos(beta_x0).^4+28.*cos(beta_x0).^3+59.*cos(beta_x0).^2+4.*cos(beta_x0)-7)...
.*cos(beta_y0).^2+(6.*cos(beta_x0).^6-19.*cos(beta_x0).^5-5.*cos(beta_x0).^4+38.*cos(beta_x0).^3+4.*cos(beta_x0).^2 ...
-16.*cos(beta_x0)-2).*cos(beta_y0)+cos(beta_x0).^6-5.*cos(beta_x0).^5+5.*cos(beta_x0).^4+6.*cos(beta_x0).^3 ...
-7.*cos(beta_x0).^2-2.*cos(beta_x0)+1).*sin(beta_x0).*(cos(beta_y0)+1).*((cos(beta_x0)+1).^2.*cos(beta_y0).^2 ...
+(2.*cos(beta_x0).^2-2).*cos(beta_y0)+cos(beta_x0).^2-2.*cos(beta_x0)-2).*ldt.*((cos(beta_x0) ...
+1).*cos(beta_y0)+cos(beta_x0)-1);
% xe0=find(beta_x0==0);
% if ~isempty(xe0)
%     end_y(xe0)=0;
% end
surf(beta_x0,beta_y0,end_y);
xlabel('\beta_x');
ylabel('\beta_y');
zlabel('end_y');
title('end_y-\beta_x/\beta_y');
end

