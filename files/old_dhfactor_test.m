clear all; close all;
syms q1 q2 L1 q3 L2
% s = 'Rz(90).Rx(90).Ty(3).Rx(90).Tz(2)'
% s = 'Rz(q1).Rx(q2).Ty(L1).Rx(q3).Tz(L2)'
s = 'Rz(45).Rx(45).Ty(3).Rx(45).Tz(3)';




f = DHFactor(s)
display('==========')
r = eval( f.command('myrobot') )
r.get('grav')


    




