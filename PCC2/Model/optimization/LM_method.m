function [outputArg1,outputArg2] = LM_method(inputArg1,inputArg2)
% LM_method
% Author: Lin Siyuan
% Date : 2023/05/215
% Purpose: Levenberg-Marquardt method

%% Input: 
%   P_target: the target position
%   number_arc_interval: the number of the interval in every arc, the first arc has k(1)+1，
%           the second has k(2), ... the whole continuum robot has sum(k)+1, you
%          must set it as a n*1 vector 
%   number_segments: the number of continuum robot segments, it is a scalar
%   length_arc: the length of each arc
%   err_bound: error bound for computation
%   torsion_mode: choose if torsion has an effect on the shape
%   orientation_mode: choose only position and any orientation: 0
%                     choose only position and given orientation: 1
%   disk_interval: the distance interval between the discs of continuum robot,
%            it is a scalar
%   initial_twist: initial twist 6n*1 vector
% 
%% Output:
%   kappa: all the arc curvature, you'd better set it as a n*1 vector
%   tau: all the arc torsion, you can set it as zero, you'd better set it
%        as a n*1 vector 
%   alpha: the angle between the bending plane and the local +X axis, you
%          must set it as a n*1 vector
%   final_twist: final twist 6n*1 vector
%   iteration_times: the iteration times 
outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

