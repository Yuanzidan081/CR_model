function [SE3e] = se3toSE3(se3e,s)
% se3toSE3
% Author: Lin Siyuan
% Date :2023/02/08
% purpose: transfer the element in se3 to the element in SE3e
% Input: 
%   se3e: an element in se3
% Output:
%   SE3e: an element in SE3
so3e=se3e(1:3,1:3);
SO3e=so3toSO3(so3e,s);
r6e=se3toR6(se3e);
u=r6e(4:6);
v=r6e(1:3);
if u(1)*u(2)*u(3)==0
    SE3e=[eye(3),v*s;...
    0,0,0,1];
else
    SE3e=[SO3e,(eye(3)-SO3e)*cross(u,v)/(norm(u))^2+u*u'*v*s/(norm(u))^2;...
    0,0,0,1];
end
end

