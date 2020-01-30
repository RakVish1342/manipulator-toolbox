% Evaluate symbolic expressions
function T = eval_matrix(T, var,val)
    for i = 1:length(var)
        T = subs(T,var(i),val(i));
    end
    [m, n] = size(T);
    for p = 1:m
        for q = 1:n
         T(p,q) = vpa(round(double(T(p,q)),3));
        end
    end
    T = double(T);
end