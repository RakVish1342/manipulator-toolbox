clear all; close all;
syms q1 g q2 L1 L2 d2
a1 = 2;
a2 = 2;


% s = 'Rz(q1).Rx(90).Tx(L1).Tz(d2)Tz(L2)'
s = 'Rz(q1).Rx(g).Tx(L1).Tz(d2)Tz(L2)'
% s = 'Rz(q1).Tx(3).Rz(q2).Tx(3)'
% s = 'Tx(2).Rz(q1).Tx(2).Rx(q2)'
f = DHFactor(s)
display('==========')
r = eval( f.command('myrobot') )
r.theta
r.a
r.d
r.alpha