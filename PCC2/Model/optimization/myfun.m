function y = myfun(initial_twist,number_arc_interval,number_segments,disk_interval,P_target)
% myfun
% Author: Lin Siyuan
% Date : 2023/05/16
% Purpose: define the optimization function

%% Input: 
%   f: the twist vector as a cell n* (6\times 1)
%   number_arc_interval: the number of the interval in every arc, the first arc has k(1)+1，
%           the second has k(2), ... the whole continuum robot has sum(k)+1, you
%          must set it as a n*1 vector 
%   number_segments: the number of continuum robot segments, it is a scalar
%   disk_interval: the distance interval between the discs of continuum robot,
%            it is a scalar

%% Output:
%   y: the error function

[~,~,p,~]=FK_n_segments_twist(initial_twist,number_arc_interval,number_segments,disk_interval);
p_end=p(end,:);
P_actual=p_end';
y=P_target-P_actual;
end

