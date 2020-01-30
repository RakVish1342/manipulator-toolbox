%  Plots of Problem 8.10.

for i= 1:2
% joint positions

  global K K_p
  subplot(1,2,i);
  plot(time, x_d(i)*ones(size(time)),'--',time,x(:,i));
%   axis([0 t_d 0.6 0.85])
  xlabel('[t]');
  ylabel(strcat('x',num2str(i)));
  title(strcat('x',num2str(i),"  | K_x = ",num2str(K(1)),", Kp_x =", num2str(K_p(1)) ));
  
end