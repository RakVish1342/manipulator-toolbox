function dh_mod = modify_dh(dh,jtype)
    nlinks = size(dh,1);
    syms('q',[1 nlinks], 'real')
    dh_mod = sym(dh);
    for i = 1:size(dh,1)
        if jtype(i) == 'r'
            eval(strcat("dh_mod(i,4) = q",num2str(i),";"))
        elseif jtype(i) == 'p'
            eval(strcat("dh_mod(i,3) = q",num2str(i),";"))
        else
            disp("Uncompatible Joint type")
        end
    end
end