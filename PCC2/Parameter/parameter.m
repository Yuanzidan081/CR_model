H0=eye(4);% initial homogenous matrix at s=0

% try the data about the paper

% 《From Differential Geometry of Curves
% to Helical Kinematics of Continuum
% Robots Using Exponential Mapping》

%% Single-segment Constant Curvature
% L=1; % the length of the whole arc m
% L_seq=linspace(0,L,20);
% kappa=pi/10:pi/10:pi;% curvature m^{-1}
% torsion=0;% torsion
% alpha=0;%the angle between bending plane and +X axis

%% Single-segment Constant Curvature and Torsion
% Test-1
% L=1; % the length of the whole arc m
% L_seq=linspace(0,L,20);
% kappa=0:pi/2:pi*2;% curvature m^{-1}
% torsion=3;% torsion
% alpha=0;%the angle between bending plane and +X axis

% Test-2
L=1; % the length of the whole arc m
L_seq=linspace(0,L,20);
kappa=3;% curvature m^{-1}
torsion=0:pi/2:pi*2;% torsion
alpha=0;%the angle between bending plane and +X axis
