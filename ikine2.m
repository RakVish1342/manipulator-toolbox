% Inverse kinematics
    
function q = ikine2(R,T,q0,dh,jtype)
    syms(symvar(dh));
    J = jacob_sym(dh,jtype);
    m = zeros(6,1);
    for i = 1:6
        m(i) = ~all(eval(J(i,:) == 0));
    end
    if(sum(m) <= size(dh,1)) 
        q = R.ikine(T, q0, m);
    else
        q = 0;
        disp("The robot does not have closed form solution. Try inverse kinematics using jacobian")
    end
end