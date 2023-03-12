function arc_type = Define_arc_type(p1,p2,p3)
% Calculate_circle_center
% Author: Lin Siyuan
% Date : 2023/03/12
% purpose: define whether the arc is minor arc or major arc
% Input: 
%   p1: the 1st point in R^3, it is a 3 \times 1 vector
%   p2: the 2nd point in R^3, it is a 3 \times 1 vector
%   p3: the 3rd point in R^3, it is a 3 \times 1 vector
%   note that these three points are placed in a order, p1 means the 1st
%   point, p2 the middle point, p3 the last point of the arc
% Output:
%   arc_type: it only can be given in {'minor arc','major arc'}

p21=p1-p2;
p23=p3-p2;
if cross(p21,p23) == [0;0;0]
    arc_type='straight line';
elseif cross(p21,p23) ~= [0;0;0]
    if p21' * p23 < 0
        arc_type='minor arc';
    elseif p21' * p23 >=0
        arc_type='major arc';
    end
end
end

