function  Jad = jacob_dot_2p(q,qd);

% global pi_l a k_r2

% mdl_planar2
% J = p2.jacob_dot(q,qd);
% J = J([1:2,6] , :);
q2 = q(2);
qd2 = qd(2);
Jad = [ 0, -(2^(1/2)*(cos(q2) + 1)^(1/2))/4 * qd2;
        0,                                0];
end