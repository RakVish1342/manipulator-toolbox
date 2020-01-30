%I8_10  Variables initialization for Problem 8.10.

% L. Villani, G. Oriolo, B. Siciliano
% February 2009

global a k_r1 k_r2 pi_m pi_l

% load manipulator dynamic parameters without load mass
  param;
  pi_l = pi_m;

% gravity acceleration
  g = 9.81;

% friction matrix
  K_r = diag([k_r1 k_r2]);
  F_v = K_r*diag([0.01 0.01])*K_r;

% sample time of controller
  Tc = 0.001;

% initial position
q_i = [0 pi/5];
qd_i = [0 0];
x_d = [1.5 0.5]';

% duration of simulation
  t_d = 2.5;

% sample time for plots
  Ts = Tc;

% controller gains
  K_d = 500*diag([1 1]);
  K_p = 16250*diag([1 1]);
  
% Complaince matrix
K = diag([100 0]); % Environment 
% 
od = x_d;
or = [1 0]';
oe = [(K_p(1)*x_d(1) + K(1)*or(1))/(K_p(1) + K(1)) x_d(2)]';
fe = [K_p(1)*K(1)/(K_p(1) + K(1))*(x_d(1) - or(1))];
he = inv(eye(2,2) - K*inv(K_p))*K*(od - or);