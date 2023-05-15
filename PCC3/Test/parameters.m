%% intialize the parameter
dt=0.7;
btp=[0;0;dt];
beta_x=pi/30;
beta_y=pi/20;
% beta_y=0;
ddtcp=0.3;
ldt=dt+ddtcp;
TRot_x=[1,0,0,0;...
    0,cos(beta_x),-sin(beta_x),-ldt*sin(beta_x);...
    0,sin(beta_x),cos(beta_x),ldt*cos(beta_x);...
    0,0,0,1];
TRot_y=[cos(beta_y),0,sin(beta_y),ldt*sin(beta_y);...
    0,1,0,0;...
    -sin(beta_y),0,cos(beta_y),ldt*cos(beta_y);...
    0,0,0,1];
N=25;
dtp=ones(N,3);
dtp(1,:)=btp';
dtTm(1,:)=[1,0,0,0,0,1,0,0,0,0,1,0,btp',1];
T=reshape(dtTm(1,:),4,4);

%% calculate the position vector and transformation matrix
for i = 2:N
    if mod(i,2)==0
        tL=[0;-ldt*sin(beta_x);ldt*cos(beta_x);1];
        t=T*tL;
        T=T*TRot_x;
    elseif mod(i,2)==1
        tL=[ldt*sin(beta_y);0;ldt*cos(beta_y);1];
        t=T*tL;
        T=T*TRot_y;
        
    end
    dtTm(i,:)=reshape(T,1,16);
    dtp(i,:)=(t(1:3))';
end
dtpx=dtp(:,1);
dtpy=dtp(:,2);
dtpz=dtp(:,3);

dtp_c=dtTm(:,[1:3,5:7,9:11]);