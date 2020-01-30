
function qsing = singularities(dh,jtype,jlimits,n)
    nlinks = size(dh,1);
    q = get_qvar(nlinks);
    % Convert position syms expression into function 
    J = jacob_sym(dh,jtype);
    fx = matlabFunction(J,'vars', {q.'}); 
    T = sample_mat(jlimits,nlinks,n);

    qsing = [];
    for i = 1:size(T,2)
        if mod(i,100000) == 0 
            i/size(T,2)*100;
        end
        X = fx(T(:,i));
        mi = min(abs(svd(X)));
        ma = max(abs(svd(X)));
        if abs(mi/ma)<1e-4
%         if min(abs(svd(X)))<1e-2
            qsing=[qsing ; T(:,i)'];
        end
    end
    % plot(qsing)
%     plot3(qsing(:,1),qsing(:,2),qsing(:,3),'.')

    if isempty(qsing)
        disp("No singularities found within joint limits")
    else
        for i = 1:nlinks 
            values = unique(qsing(:,i));
            if length(values) < n
                disp(strcat("Singularity occurs at joint ",num2str(i)," for joint value: ",num2str(values')))
            end
        end
    end
end