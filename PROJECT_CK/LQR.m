clc;
M = 1;
m = 0.1;
l = 1;
g = 9.81;
q11 = 1;
q33 = 1;
rl=1;
%cai dat gia tri khoi tao
thetadot_init = 0;
theta_init = 0.1;
xdot_init =0;
x_init=0;
%Tuyen tinh hoa
A = [0 1 0 0;10.78 0 0 0;0 0 0 1;-0.98 0 0 0];
B = [0;-1;0;1];
C = [0 1 0 0 ;0 0 1 0];
%Ma tran trong so
Q = [q11 0 0 0;0 1 0 0;0 0 q33 0; 0 0 0 1]
R = rl;
P = care(A,B,Q,R)
k = lqr(A,B,Q,R);