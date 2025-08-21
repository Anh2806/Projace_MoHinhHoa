clc;
%% Khai bao bo thong so mo hinh
M = 1;
m = 0.1;
l = 1;
g = 9.81;
q11 = 1;
q33 =50;
r1 = 1;
%% Cai dat gia tri khoi tao
thetadot_init = 0;
theta_init = pi/18;
xdot_init = 0;
x_init = 0;
%% Tuyen so lieu tinh hoa 
A = [ 0 1 0 0; 10.78 0 0 0; 0 0 0 1; -0.98 0 0 0];
B = [0; -1 ; 0; 1];
C = [1 0 0 0; 0 0 1 0];
%% Ma tran trong so
Q = [ q11 0 0 0; 0 1 0 0; 0 0 q33 0; 0 0 0 1];
R = r1;
%% Ma tran LQR
P = care(A,B,Q,R)
K = lqr(A,B,Q,R)
%% Bo loc Kalman
G=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
Qn=0.000001*G;
Rn=[0.001 0;0 0.01];
%% Ma tran LQG
L = lqe(A,G,C,Qn,Rn)
