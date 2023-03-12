function [radius,circle_center] = Calculate_circle_center(p1,p2,p3)
% Calculate_circle_center
% Author: Lin Siyuan
% Date : 2023/03/11
% purpose: calculate the center of circle with the three given points
% Input: 
%   p1: the 1st point in R^3, it is a 3 \times 1 vector
%   p2: the 2nd point in R^3, it is a 3 \times 1 vector
%   p3: the 3rd point in R^3, it is a 3 \times 1 vector
%   note that these three points are placed in a order, p1 means the 1st
%   point, p2 the middle point, p3 the last point of the arc
% Output:
%   radius： the radius of the arc
%   circle_center: circular arc center, it is a 3 \times 1 vector
p21 = p1 - p2;
p12_a = (p1 + p2)/2;
p32 = p2 - p3;
p23_a=(p2 + p3) / 2;
pv = cross(p21, p32);
if pv == [0; 0; 0]
    circle_center=NaN(3,1);
    radius=NaN;
    disp('the three points are located in the same line.');
elseif pv ~= [0; 0; 0]
    A=[p21(1), p21(2), p21(3);...
       p32(1), p32(2), p32(3);...
       pv(1),  pv(2),  pv(3)];
    b=[p21'*p12_a;
       p32'*p23_a;
       pv'*p1];
    circle_center=A\b;
    radius=norm(circle_center-p1);
end
end

