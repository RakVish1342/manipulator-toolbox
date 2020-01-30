% Rewrite the matrix in compact form
function T = compact_matrix(T)
    nlinks = length(symvar(T));
    old_angles = get_qvar(nlinks);
    new_angles = 1:nlinks;
    [m, n] = size(T);
    for p = 1:m
        for q = 1:n
            for k = 1:3
                old = nchoosek(old_angles,k);
                new = nchoosek(new_angles,k);
                for l = 1:size(old)
                    T(p,q) = subs(T(p,q),cos(sum(old(l,:))),evalin(symengine, strcat('c',strjoin(string(new(1,:)),""))));
                    T(p,q) = subs(T(p,q),sin(sum(old(l,:))),evalin(symengine, strcat('s',strjoin(string(new(1,:)),""))));
                end
            end
        end
    end
end