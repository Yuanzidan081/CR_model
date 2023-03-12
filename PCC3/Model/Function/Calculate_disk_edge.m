function disk_edge_points = Calculate_disk_edge(p,po,p_n,r_disk)
% Calculate_disk_info
% Author: Lin Siyuan
% Date : 2023/03/12
% purpose: calculate the disk edge point in a circular shape
% Input: 
%   p: the characteristic point of the arc to calculate the disk edge
%   points, it is a 3\times 1 vector 
%   p_n: the normal vector perpendicular to the circular plane, it is a 3
%   \times 1 vector
%   r_disk: the radius of the disk
% Output:
%   disk_edge_points: the disk edge points

po1=p-po;
p_t=cross(p_n,po1);
XVector_NS_in_OS=p_n/norm(p_n);
YVector_NS_in_OS=po1/norm(po1);
ZVector_NS_in_OS=p_t/norm(p_t);

R_NS_in_OS=[XVector_NS_in_OS,YVector_NS_in_OS,ZVector_NS_in_OS];
p_NSo_in_OS=p;
n=100;
theta_circle=linspace(0,2*pi,n);

p_A_in_NS=[(r_disk*cos(theta_circle));(r_disk*sin(theta_circle));zeros(1,n)];
T=[R_NS_in_OS,p_NSo_in_OS;0,0,0,1];
p_A_in_OS=T*[p_A_in_NS;ones(1,n)];
disk_edge_points=(p_A_in_OS(1:3,:))';
end
