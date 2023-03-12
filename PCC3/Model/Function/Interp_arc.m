function interp_points = Interp_arc(p_start,p_end,circle_center,arc_type,r,n)
%Interp_arc
% Author: Lin Siyuan
% Date : 2023/03/12
% purpose: interp the point of the arc with the given start and end point and r
% Input: 
%   p_start: the start point in R^3, it is a 3 \times 1 vector
%   p_end: the end point in R^3, it is a 3 \times 1 vector
%   circle_center: the center of the circle in R^3, it is a 3 \times 1
%   vector
%   arc_type: it only can be given in {'minor arc','major arc'}
%   r: the radius of the arc, scalar
%   n: the number of interpolation points, scalar
% Output:
%   interp_points: the interpolation points, n\times 3 matrix, the coloum means the coordination of x, y, z axis 



p_NSo_in_OS=circle_center;
p1o=p_start-circle_center;
p2o=p_end-circle_center;
% straight line 
if strcmp(arc_type,'straight line')
    interp_points=[(linspace(p_start(1),p_end(1),n))',...
        (linspace(p_start(2),p_end(2),n))',...
    (linspace(p_start(3),p_end(3),n))'];
else
% arc
% use the p_start->p_end to be the new x axis x_n
% use the normal vector of the arc plane to be the new z axis z_n
% use the cross product of the x_n and z_n to be the new y axis y_n=cross(z_n,x_n)
% use the circle_center to be the new origin
if strcmp(arc_type,'minor arc')
    p_n=cross(p1o,p2o);
    theta=acos((p1o'*p2o)/(norm(p1o)*norm(p2o)));
elseif strcmp(arc_type,'major arc')
    p_n=-cross(p1o,p2o);
    theta=2*pi-acos((p1o'*p2o)/(norm(p1o)*norm(p2o)));
end
% refer to my blog: https://blog.csdn.net/subtitle_/article/details/123301279
XVector_NS_in_OS=p1o/norm(p1o);
ZVector_NS_in_OS=p_n/norm(p_n);
YVector_NS_in_OS=cross(ZVector_NS_in_OS,XVector_NS_in_OS);

R_NS_in_OS=[XVector_NS_in_OS,YVector_NS_in_OS,ZVector_NS_in_OS];
% p_OSo_in_NS=-R_NS_in_OS'*p_NSo_in_OS;

theta_interp=linspace(0,theta,n);
p_A_in_NS=[(r*cos(theta_interp));(r*sin(theta_interp));zeros(1,n)];
T=[R_NS_in_OS,p_NSo_in_OS;0,0,0,1];
p_A_in_OS=T*[p_A_in_NS;ones(1,n)];
interp_points=(p_A_in_OS(1:3,:))';

end
end

