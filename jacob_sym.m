% syms t1 t2 t3 a1 a2 a3 real
% dh = [a1 0 0 t1; a2 0 0 t2; a3 0 0 t3]

function J = jacob_sym(dh,jtype)
    nlinks = size(dh,1);
    z = sym(zeros(3,nlinks+1));
    p = sym(zeros(3,nlinks+1));
    z(:,1) = [0 0 1]';
    p(:,1) = zeros(3,1);
    T = sym(eye(4,4));
    for i = 1:nlinks
        T = T * dh2tr(dh(i,1),dh(i,2),dh(i,3),dh(i,4));
        z(:,i+1) = T(1:3,3);
        p(:,i+1) = T(1:3,4);
    end
%     jtype = ['r','r','r']; 
    J = sym(zeros(6,nlinks));
    for i = 1:nlinks
       if jtype(i) == 'r'
           J(1:3,i) = cross(z(:,i), p(:,nlinks+1)-p(:,i));
           J(4:6,i) = z(:,i);
       elseif  jtype(i) == 'p'
           J(1:3,i) = z(:,i);
           J(4:6,i) = [0 0 0];
       end
    end
    J = simplify(J);
%     compact_matrix(simplify(J),[t1,t2,t3],1:3)
end