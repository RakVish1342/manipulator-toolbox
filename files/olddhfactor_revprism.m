clear all; close all;
syms q1 q2 L1 L2
% 
% s = 'Rz(q1).Ty(L1).Rz(0).Tz(L2)'
% f = DHFactor(s)
% display('==========')
% r = eval( f.command('myrobot') )
% % r.theta
% % r.a
% % r.d
% % r.alpha

% s = 'Rz(q1).Rx(q2).Ty(L1).Rx(q3).Tz(L2)';
s = 'Rz(90).Rx(q2).Ty(L1).Rx(q3).Tz(L2)';
dh = DHFactor(s);
dh
r = eval( dh.command('myrobot') )

