function [circle_center] = Calculate_circle_center(p1,p2,p3)
% Calculate_circle_center
% Author: Lin Siyuan
% Date : 2023/03/11
% purpose: calculate the center of circle with the three given points
% Input: 
%   p1: the 1st point in R^3, it is a 3 \times 1 vector
%   p2: the 2nd point in R^3, it is a 3 \times 1 vector
%   p3: the 3rd point in R^3, it is a 3 \times 1 vector
% Output:
%   circle_center: circular arc center, it is a 3 \times 1 vector
p12=p1-p2;
p12_a=(p1+p2)/2;
p23=p2-p3;
p23_a=(p2+p3)/2;
pv=cross(p12,p23);
A=[p12(1), p12(2), p12(3);...
   p23(1), p23(2), p23(3);...
   pv(1),  pv(2),  pv(3)];
b=[p12'*p12_a;
   p23'*p23_a;
   pv'*p1];
circle_center=A\b;
end

