function L = dh2link(dh,jtype)
    for i = 1:size(dh,1)
        if jtype(i) == 'r'
            L{i} = Link('d', double(dh(i,3)), 'a', double(dh(i,1)), 'alpha', double(dh(i,2))); 
        elseif jtype(i) == 'p'
            L{i} = Link('theta', double(dh(i,4)), 'a', double(dh(i,1)), 'alpha', double(dh(i,2))); 
        else
            disp("Uncompatible Joint type")
        end
    end
end