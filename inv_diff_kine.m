clear all;

%% Inverse kinematics - Using Jacobian
% Input arguments
syms t1 t2 d3 t4 real;
dh = [0.3 0 0 t1; 0.3 0 0 t2; 0 0 d3 0;0 0 -0.3 t4 ]; % a al d th
jtype = ['r' 'r' 'p' 'r'];
qvec = [t1 t2 d3 t4];
tstep = 0.01;
t=0:tstep:2.5;
q0 = [pi/4; pi/2; 0.2; 0];
xd = [0.42*cos(t*pi/10); 
      0.42*sin(t*pi/10);
      0.1*(1+sin(t));
      0*t; 0*t;
      t*pi/10 + 7*pi/12];
xd_dot = [-0.42*(pi/10)*sin(t*pi/10); 
           0.42*(pi/10)*cos(t*pi/10); 
           0.1*(cos(t));
           0*t; 0*t;
           pi/10*ones(1,length(t))];

% Code starts here
q= zeros(4,length(t));
xe = zeros(6,length(t));
K=1*eye(6,6);
q(:,1) = q0;
T = fkine2(dh);
J = jacob_sym(dh,jtype);
% J = J([1:3,6],:); %%%%%%%%%%%%%%%%%%%
i =1 ;

for i = 1:length(t)
    % Calculated end effector pose
%     xe(:,i)= fwd_kin_pl(a1, a2, d4, q(:,i));    
    Te = double(subs(T,qvec,q(:,i)'));
    xp = Te(1:3,4);
    xt = tr2rpy(Te)';
    xe(:,i) = [xp;xt];
%     xe(:,i) = double(subs(T(1:4,4),qvec,q(:,i)'));
    % Inverse of Analytical jacobian
%     Ja = an_Jac_pl(a1, a2, d4, q(:,i));
    Ja = double(subs(J,qvec,q(:,i)'));
    % Error in desired and calculated end effector pose
    e(:,i)= xd(:,i) - xe(:,i);
    % Differential joint variable
%     qdot = inv(Ja)*(xd_dot(:,i)+K*e(:,i));
    qdot = pinv(Ja)*(xd_dot(:,i)+K*e(:,i));
    % Integrator to get joint variables from differential joint variable
    q(:,i+1)=q(:,i)+qdot*tstep;
end

disp('q at 2.5 sec')
q(:,i)
