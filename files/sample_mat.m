function qvec = sample_mat(jlimits,nlinks,n)
    %% Generating different pose
    qstring = '';
    grid_string = '';
    for i = 1:nlinks
        
        qsample{i} = linspace(jlimits(i,1),jlimits(i,2),n);
        qstring = strcat(qstring, 'qsample{',num2str(i),'},');
        grid_string = strcat(grid_string,'gq_',num2str(i),',');
    end
    % This will create matrices of nxnxn for each variable
    eval(strcat('[',grid_string,"] = ndgrid(",qstring(1:(end-1)),");")); 

    qvec = zeros(nlinks,n^nlinks);
    for i = 1:nlinks
       qvec(i,:) = eval(strcat('reshape(gq_',num2str(i),',[1,n^',num2str(nlinks),']);'));
    end
end