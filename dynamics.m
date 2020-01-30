%% Question 3
% MAE 547 HW#5
% Author: Ravi Pipaliya
% Created: 11/19/2019

clear all;
close all;
clc;

Tc = [20 5 1];
q0 = [-60 90 30]*pi/180;
qd0 = [0 0 0];

alpha = zeros(1,3);  
a = [1 1 1];
d = zeros(1,3);
theta = [0 0 0];
kr = [90 90 90];
ml = [50 50 50];
r = [-0.5 0 0;-0.5 0 0;-0.5 0 0;]' ;
Il = [ 0 0 10 ; 0 0 10 ; 0 0 10]';
Im = [ 0.02 ; 0.02 ; 0.02];

for i = 1:3
    L{i} = Link('d', d(i), 'a', a(i), 'alpha', alpha(i),...
                'G', kr(i),'m', ml(i), 'r' , r(:,i),...
                'I', Il(:,i), 'Jm', Im(i));
end

R = SerialLink([L{1} L{2} L{3}]);%%
T = 4;
[ti,q,qd] = R.fdyn(T,@TORQFUN, q0, qd0);

figure;
plot(ti,q*180/pi)
legend('\theta_1','\theta_2','\theta_3')
xlabel('Time(sec)')
ylabel('Joint angles(degres)')

figure;
plot(ti,qd)
legend('$\dot{\theta_1}$','$\dot{\theta_2}$','$\dot{\theta_3}$', 'Interpreter','latex')
xlabel('Time(sec)')
ylabel('Joint velocity(rad/sec)')

type TORQFUN

