function disk_edge_points = Calculate_disk_ledge(p,p_z,r_disk,h)
% Calculate_disk_ledge
% Author: Lin Siyuan
% Date : 2023/04/12
% purpose: calculate the disk edge point in a line shape
% Input: 
%   p: the characteristic point of the arc to calculate the disk edge
%   points, it is a 3\times 1 vector 
%   p_z: the normal vector going along the line, it is a 3 \times 1 vector
%   r_disk: the radius of the disk
%   h: the height of the disk
% Output:
%   disk_edge_points: the disk edge points

if nargin<4
    h=0;
end


np=null(p_z');

p_x=np(:,1);
p_y=np(:,2);

XVector_NS_in_OS=p_x/norm(p_x);
YVector_NS_in_OS=p_y/norm(p_y);
ZVector_NS_in_OS=p_z/norm(p_z);

R_NS_in_OS=[XVector_NS_in_OS,YVector_NS_in_OS,ZVector_NS_in_OS];
p_NSo_in_OS=p;
n=100;
theta_circle=linspace(0,2*pi,n);

p_A_in_NS=[(r_disk*cos(theta_circle));(r_disk*sin(theta_circle));zeros(1,n)];
T=[R_NS_in_OS,p_NSo_in_OS;0,0,0,1];
p_A_in_OS=T*[p_A_in_NS;ones(1,n)];
disk_edge_points=(p_A_in_OS(1:3,:))';


% set the height of the disk

if h~=0
    p_A_in_NS_h=p_A_in_NS+[0;0;h];
    p_A_in_OS_h=T*[p_A_in_NS_h;ones(1,n)];
    disk_edge_points(:,4:6)=(p_A_in_OS_h(1:3,:))';
end

end

