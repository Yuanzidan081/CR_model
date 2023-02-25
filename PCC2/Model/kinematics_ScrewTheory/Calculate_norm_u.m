function norm_u = Calculate_norm_u(u,t)
% Calculate_norm_u
% Author: Lin Siyuan
% Date : 2023/02/25
% Purpose: Compute the norm of u

%% Input: 
%   u: if nargin=1: it is a 3/time3 1 vector, represents the twist
%      if nargin=2: it is a scalar, represents the curvature \kaapa
%   v: if nargin=1: you don't input it
%      if nargin=2: it is a scalar, represents the torsion \tau
%% Output:
%   T: the result of integral of the expointial of the adjoint matrix

if nargin==1
    norm_u=norm(u);
elseif nargin==2
    norm_u=sqrt(u^2+t^2);
end

end

