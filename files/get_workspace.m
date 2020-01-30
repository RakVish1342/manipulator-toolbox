function [X,Y,Z] = get_workspace(dh,jtype,jlimits,n)
    nlinks = size(dh,1);
%     syms(symvar(dh));
    q = get_qvar(nlinks);
    
    %% Convert position syms expression into function 
    T0H = fkine2(dh); % Forward kinmematics
    fx = matlabFunction(T0H(1,4),'vars', {q.'}); 
    fy = matlabFunction(T0H(2,4),'vars', {q.'});
    fz = matlabFunction(T0H(3,4),'vars', {q.'});
        

    %% Sample 
    qvec = sample_mat(jlimits,nlinks,n);
    X = fx(qvec); 
    Y = fy(qvec);
    Z = fz(qvec);
    
    if (isempty(symvar(T0H(1,4))))
        X = ones(1,size(qvec,2)).*double(T0H(1,4));
    end
    if (isempty(symvar(T0H(2,4))))        
        Y = ones(1,size(qvec,2)).*double(T0H(2,4));
    end
    if (isempty(symvar(T0H(3,4))))
        Z = ones(1,size(qvec,2)).*double(T0H(3,4));
    end
end