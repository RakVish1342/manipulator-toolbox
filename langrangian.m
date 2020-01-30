%% Question 1
% MAE 547 HW#5
% Author: Ravi Pipaliya
% Created: 11/19/2019

clear all;
clc;
%% Input arguments
syms t1 t2 a1 a2 g real
dh = [a1 0 0 t1; a2 0 0 t2]; % a al d th
jtype = ['r','r'];
g0 = [0 -g 0]';
q = [t1 t2]';

% Calculated arguments
qd = sym(strcat(arrayfun(@char, q, 'uniform', 0),"_dot"));
qdd = sym(strcat(arrayfun(@char, q, 'uniform', 0),"_ddot"));
n = size(dh,1); % # of links

%% Jacobian Matrix
jl = jacob_dyn(dh,jtype,"l");
jm = jacob_dyn(dh,jtype,"m");

%% Dynamic paramters
% syms ml1 ml2 mm1 mm2 Il1 Il2 Im1 Im2 real
ml = sym('ml' ,[1:n]);
mm = sym('mm' ,[1:n]);
Il = sym('Il' ,[1:n]);
Im = sym('Im' ,[1:n]);

%% B matrix
B = sym(zeros(n,n));
for i = 1:n
    B = B + ...
        ml(i)*jl(1:3,:,i)'*jl(1:3,:,i) + ...
        jl(4:6,:,i)'*Il(i)*jl(4:6,:,i) + ...
        mm(i)*jm(1:3,:,i)'*jm(1:3,:,i) + ...
        jm(4:6,:,i)'*Im(i)*jm(4:6,:,i)    ;
end
B = simplify(B)

%% C matrix
c = sym(zeros(n,n));;
for i = 1:n
    for j = 1:n
        for k = 1:n
        c(i,j,k) = 1/2*(diff(B(i,j),q(k)) + ...
                        diff(B(i,k),q(j)) - ...
                        diff(B(j,k),q(i)));
        end
    end
end
C = sym(zeros(n,n));
for k = 1:n
    C = C + c(:,:,k)*qd(k);
end
C= simplify(C)

%% G matrix
G = sym(zeros(n,1));
for i = 1:n
    for j = 1:n
        G(i) = G(i) - ml(j)*g0'*jl(1:3,i,j) - mm(j)*g0'*jm(1:3,i,j);
    end
end
G= simplify(G)