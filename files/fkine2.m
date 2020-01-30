function T = fkine2(dh)
    nlinks = size(dh,1);
    T = sym(eye(4,4));
    for i = 1:nlinks
        T = T * dh2tr(dh(i,1),dh(i,2),dh(i,3),dh(i,4));
    end
    T = simplify(T);
end