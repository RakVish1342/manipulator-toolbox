% syms t1 t2 t3 l1 l2 l3 a1 a2 a3 real
% dh = [l1 0 0 t1; l2 0 0 t2; l3 0 0 t3]
% jtype = ['r','r','r']; 
% otype = "l" % Link : l , motor : m
% type = "m" % For Link
% type = "l" % For Motor

function J = jacob_dyn(dh,jtype,otype)
    nlinks = size(dh,1);
    cntr_len = sym('l', [1 nlinks],'positive');
    gear_rat = sym('kr', [1 nlinks],'positive');
    z = sym(zeros(3,nlinks+1));
    p = sym(zeros(3,nlinks+1));
    a = sym(zeros(3,nlinks+1));
    z(:,1) = [0 0 1]';
    p(:,1) = zeros(3,1);
    a(:,1) = zeros(3,1);
    T = sym(eye(4,4));
    for i = 1:nlinks
        Ta = T * dh2tr(cntr_len(i),dh(i,2),dh(i,3),dh(i,4));
        a(:,i+1) = Ta(1:3,4);
        T = T * dh2tr(dh(i,1),dh(i,2),dh(i,3),dh(i,4));
        z(:,i+1) = T(1:3,3);
        p(:,i+1) = T(1:3,4);
    end
%     jtype = ['r','r','r']; 
    J = sym(zeros(6,nlinks,nlinks));
    for j = 1:nlinks
        for i = 1:nlinks 
            if i <= j 
                if otype == "l"
                    J(:,i,j) = get_jcol(i,j,z,p,a,jtype(i), otype);
                elseif otype == "m" & i < j
                    J(:,i,j) = get_jcol(i,j,z,p,a,jtype(i), otype);
                elseif otype == "m" & i == j
                    J(1:3,i,j) = [0 0 0];
                    J(4:6,i,j) = gear_rat(i) * z(:,i);
                end
            end
        end
    end
    J = simplify(J);
end