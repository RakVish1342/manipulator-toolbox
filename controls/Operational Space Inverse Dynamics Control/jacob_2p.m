function  Ja = jacob_2p(q);

% global pi_l a k_r2
% syms q1 q2 real
q2 = q(2);
Ja = [ 0, -(2^(1/2)*sin(q2))/(2*(cos(q2) + 1)^(1/2));
 1,                                          1];
% mdl_planar2
% J = p2.jacob0(q,'rpy');
% J = J([1:2,6] , :);
% Ja = double(subs(J,q2,q(2)));
end