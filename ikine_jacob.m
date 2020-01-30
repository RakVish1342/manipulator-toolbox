%% Inverse kinematics - Using Jacobian
% Input arguments
% syms q1 q2 q3 q4 t real;
% dh = [0.3 0 0 q1; 0.3 0 0 q2; 0 0 q3 0;0 0 -0.3 q4 ]; % a al d th
% jtype = ['r' 'r' 'p' 'r'];
% q0 = [pi/4; pi/2; 0.2; 0];
% xd = [0.42*cos(t*pi/10); 
%       0.42*sin(t*pi/10);
%       0.1*(1+sin(t));
%       0; 0;
%       t*pi/10 + 7*pi/12];
% xdd = [-0.42*(pi/10)*sin(t*pi/10); 
%            0.42*(pi/10)*cos(t*pi/10); 
%            0.1*(cos(t));
%            0; 0;
%            pi/10*ones(1,length(t))];
function q = ikine_jacob(R,dh,jtype,q0,xd,xdd,tstep,end_time)
%     tstep = 0.01;
    t=0:tstep:end_time;
    xd = double(subs(xd));
    xdd = double(subs(xdd));
    nlinks = size(dh,1);
    qvec = get_qvar(nlinks);
    q= zeros(nlinks,length(t));
    xe = zeros(6,length(t));
    e = zeros(6,length(t));
    K=1*eye(6,6);
    q(:,1) = q0;
    T = fkine2(dh);
    J = jacob_sym(dh,jtype);

    for i = 1:length(t)
        % Calculated end effector pose
        Te = double(subs(T,qvec,q(:,i)'));
        xp = Te(1:3,4);
        xo = tr2rpy(Te)';
        xe(:,i) = [xp;xo];
        % Inverse of Analytical jacobian
%         Ja = double(subs(J,qvec,q(:,i)'));
        Ja = R.jacob0(q(:,i),'rpy');
        % Error in desired and calculated end effector pose
        e(:,i)= xd(:,i) - xe(:,i);
        % Differential joint variable
        qdot = pinv(Ja)*(xdd(:,i)+K*e(:,i));
        % Integrator to get joint variables from differential joint variable
        q(:,i+1)=q(:,i)+qdot*tstep;
    end

    % disp('q at 2.5 sec')
    % q(:,i)
end