function end_x = generate_xsurf(beta_x0,beta_y0,ldt)
%generate_xsurf
% Author: Lin Siyuan
% Date : 2023/03/27
% purpose: to find the relationship between two angles and x coordinate of 
% end effector
%
% Input: 
%   beta_x0 | type:(m,n): the range of beta_x produced by meshgrid, it should includes 0
%   beta_y0 | type:(n,m): the range of beta_y produced by meshgrid, it should includes 0
%   ldt    | type:double: base_top_point+disk_top_center_to_plane_distance 
% Output:
%   end_x | type:(1,n): the x of beta_x and beta_y




end_x=(cos(beta_x0).*(cos(beta_y0)+1)+cos(beta_y0)-2).^2.*(cos(beta_x0).*(cos(beta_y0)+1)...
+cos(beta_y0)).^2.*sin(beta_y0).*(cos(beta_y0)+1).*((cos(beta_y0)+1).^2.*cos(beta_x0).^2+(2.*cos(beta_y0).^2 ...
-2).*cos(beta_x0)+cos(beta_y0).^2-2 .*cos(beta_y0)-2).^2.*ldt.* (cos(beta_x0)...
+1).*(cos(beta_x0).*(cos(beta_y0)+1)+cos(beta_y0)-1).^2;


ye0=find(beta_y0==0);
if ~isempty(ye0)
    end_x(ye0)=0;
end
surf(beta_x0,beta_y0,end_x);
xlabel('\beta_x');
ylabel('\beta_y');
zlabel('end_x');
title('end_x-\beta_x/\beta_y')
end

