%  Plots of Problem 8.10.

for i= 1:2
% joint positions
  subplot(3,2,i);
  plot(time, x_d(i)*ones(size(time)),'--',time,x(:,i));
%   axis([0 t_d 0.6 0.85])
  xlabel('[s]');
  ylabel('[rad]');
  title(strcat('x',num2str(i)));

  subplot(3,2,2 + i);
  plot(time, xd_d(i)*ones(size(time)),'--',time,xd(:,i));
  xlabel('[s]');
  ylabel('[rad/s]');
  title(strcat('x',num2str(i),'_{dot}'));
  
  subplot(3,2,4 + i);
  plot(time, xdd_d(i)*ones(size(time)),'--',time,xdd(:,i));
%   axis([0 t_d 0.6 0.85])
  xlabel('[s]');
  ylabel('[rad/s^2]');
  title(strcat('x',num2str(i),'_{ddot}'));
  
end