H0=eye(4);% initial homogenous matrix at s=0

k1=4*pi/10:-pi/10:0;
k2=0:pi/10:4*pi/10;
k3=4*pi/10:pi/10:8*pi/10;
kappa=[k1',k2',k3'];% curvature of arc1 and arc2 m^{-1}


tau=[0;0;0];% torsion m^{-1}
alpha=[0;pi/3;pi/6];%the angle between bending plane and +X axis
number_arc_interval=[50;30;30];
number_arc_interval_cumsum=cumsum([0;number_arc_interval]);
number_segments=3;
disk_interval=0.01;

all_segments_number=number_segments*size(kappa,1);