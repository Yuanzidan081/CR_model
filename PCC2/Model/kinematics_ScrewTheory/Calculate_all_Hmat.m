function [Hmat_sep,Hmat_cum] = Calculate_all_Hmat(f,length_arc)
% Calculate_Ad_mat_
% Author: Lin Siyuan
% Date : 2023/02/25
% Purpose: Compute Homogenous matrix of two form: 
% seperated and multiplied

%% Input: 
%   f:  a 6n \times 1 vector, containing n twist, each twist has a form of
%       [v,u]
%   length_arc: a n \times 1 vector, containing the length of each segments
%% Output:
%   Hmat_sep: homogenous matrix (seperated form)
%   Hmat_cum: homogenous matrix (multiplied form) 



number_segments=size(f,1)/6;
f_=reshape(f,6,[]);
Hmat_sep=cell(number_segments+1,1);
Hmat_cum=cell(number_segments+1,1);
Hmat_sep{1}=eye(4);
Hmat_cum{1}=Hmat_sep{1};
for i=2:number_segments+1
    Hmat_sep{i}=R6toSE3_(f_(:,i-1),length_arc(i-1));
    Hmat_cum{i}=Hmat_cum{i-1}*Hmat_sep{i};
end

end

