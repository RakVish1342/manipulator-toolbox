function  x = fkine_2p(q);

% global pi_l a k_r2

% mdl_planar2
% T = p2.fkine([pi/4,pi/4])
% 
% x = zeros(1,3)';
% x(1:2) = T(1:2,4);
% ang = tr2rpy(T);
% x(3) = ang(3);
x = zeros(2,1);
% x(1) = sqrt((cos(q(1))+cos(q(1)+ q(2)))^2 + (sin(q(1))+sin(q(1)+ q(2)))^2);
% x(2) = q(1)+q(2);
x(1) = cos(q(1))+cos(q(1)+ q(2));
x(2) = sin(q(1))+sin(q(1)+ q(2));
end