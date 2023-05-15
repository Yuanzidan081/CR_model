function end_z = generate_zsurf(beta_x0,beta_y0,ldt)
%generate_zsurf
% Author: Lin Siyuan
% Date : 2023/03/27
% purpose: to find the relationship between two angles and z coordinate of 
% end effector
%
% Input: 
%   beta_x0 | type:(m,n): the range of beta_x produced by meshgrid, it should includes 0
%   beta_y0 | type:(n,m): the range of beta_y produced by meshgrid, it should includes 0
%   ldt    | type:double: base_top_point+disk_top_center_to_plane_distance 
% Output:
%   end_z | type:(1,n): the z of beta_x and beta_y
d=0.7;
end_z=ldt.*(cos(beta_y0)+1).^12.*(cos(beta_x0).^12+11.*ldt.*(cos(beta_y0)+1).^11.*(cos(beta_y0)...
-10/11).*cos(beta_x0).^11+55.*ldt.*(cos(beta_y0)+1).^10.*(cos(beta_y0).^2-101/55.*cos(beta_y0)...
+7/11).*cos(beta_x0).^10+165.*(cos(beta_y0).^3-92/33.*cos(beta_y0).^2+323/165.*cos(beta_y0)...
-38/165).*ldt.*(cos(beta_y0)+1).^9.*cos(beta_x0).^9+330.*ldt.*(cos(beta_y0)+1).^8.*(cos(beta_y0).^4 ...
-83/22.*cos(beta_y0).^3+222/55.*cos(beta_y0).^2-323/330.*cos(beta_y0)-49/330).*cos(beta_x0).^8+462.*(cos(beta_y0).^5 ...
-370./77.*cos(beta_y0).^4+538./77.*cos(beta_y0).^3-608./231.^cos(beta_y0).^2-172./231.*cos(beta_y0)+3./11) ...
.*ldt.*(cos(beta_y0)+1).^7.*cos(beta_x0).^7+462.*ldt.*(cos(beta_y0)+1).^6.*(cos(beta_y0).^6-65/11.*cos(beta_y0).^5 ...
+11.*cos(beta_y0).^4-190/33.*cos(beta_y0).^3-74/33.*cos(beta_y0).^2+135/77.*cos(beta_y0)-2/77).*cos(beta_x0).^6 ...
+330.*ldt.*(cos(beta_y0)+1).^5.*(cos(beta_y0).^7-392/55.*cos(beta_y0).^6+903/55.*cos(beta_y0).^5 ...
-1862/165.*cos(beta_y0).^4-868/165.*cos(beta_y0).^3+369/55.*cos(beta_y0).^2-46/165.*cos(beta_y0)-19/55).*cos(beta_x0).^5 ...
+165.*ldt.*(cos(beta_y0).^8-94/11.*cos(beta_y0).^7+1316/55.*cos(beta_y0).^6-3458/165.*cos(beta_y0).^5) ...
-350/33.*cos(beta_y0).^4+222/11.*cos(beta_y0).^3-56/33.*cos(beta_y0).^2-34/11.*cos(beta_y0)+7/33).*(cos(beta_y0) ...
+1).^4.*cos(beta_x0).^4+55.*ldt.*(cos(beta_y0)+1).^3.*(cos(beta_y0).^9-114/11.*cos(beta_y0).^8 ...
+1932/55.*cos(beta_y0).^7-2128/55.*cos(beta_y0).^6-1064/55.*cos(beta_y0).^5+54.*cos(beta_y0).^4-8.*cos(beta_y0).^3 ...
-180/11.*cos(beta_y0).^2+28/11.*cos(beta_y0)+8/11).*cos(beta_x0).^3+11.*(cos(beta_y0).^10-145/11.*cos(beta_y0).^9 ...
+603/11.*cos(beta_y0).^8-76.*cos(beta_y0).^7-364/11.*cos(beta_y0).^6+1566/11.*cos(beta_y0).^5-380/11.*cos(beta_y0).^4 ...
-780/11.*cos(beta_y0).^3+210/11.*cos(beta_y0).^2+104/11.*cos(beta_y0)-10/11).*ldt.*(cos(beta_y0) ...
+1).^2.*cos(beta_x0).^2+ldt.*(cos(beta_y0)+1).*(cos(beta_y0).^11-20.*cos(beta_y0).^10+107.*cos(beta_y0).^9 ...
-190.*cos(beta_y0).^8-56.*cos(beta_y0).^7+450.*cos(beta_y0).^6-172.*cos(beta_y0).^5-330.*cos(beta_y0).^4 ...
+140.*cos(beta_y0).^3+88.*cos(beta_y0).^2-20.*cos(beta_y0)-4).*cos(beta_x0)-cos(beta_y0).^11.*ldt ...
+8.*cos(beta_y0).^10.*ldt-19.*cos(beta_y0).^9.*ldt-cos(beta_y0).^8.*ldt+54.*cos(beta_y0).^7.*ldt ...
-32.*cos(beta_y0).^6.*ldt-54.*cos(beta_y0).^5.*ldt+35.*cos(beta_y0).^4.*ldt+24.*cos(beta_y0).^3.*ldt ...
-10.*ldt.*cos(beta_y0).^2-4.*ldt.*cos(beta_y0)+d;

% xe0=find(beta_x0==0);
% if ~isempty(xe0)
%     end_y(xe0)=0;
% end
surf(beta_x0,beta_y0,end_z);
xlabel('\beta_x');
ylabel('\beta_y');
zlabel('end_z');
title('end_z-\beta_x/\beta_y');
end
