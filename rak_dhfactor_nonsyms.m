function [a, alph, d, thet] = rak_dhfactor_nonsyms(R, joint_type, link_len)

    a = zeros(1,length(R.a));
    alph = zeros(1,length(R.alpha));
    d = zeros(1,length(R.d));
    thet = zeros(1,length(R.theta));
    
%     tmp_str_dist = 'L';
%     tmp_str_angle = 'q';

    % TODO: Change/Check L1, L2, L3 ... acc link length provided
    for i = 1:length(joint_type)

        % Since angles never have any syms in them except 0, just
        % evaluate that syms 0 variable
        thet(i) = eval(R.theta(i));
        alph(i) = eval(R.alpha(i));

        % Extra checks required for distances, as they can be syms number
        % or syms Li
        % If R.ai has 'L', subst with the value of Li
        if ( ~( isempty(findstr(cell2mat(arrayfun(@char, R.a(i), 'uniform', 0)), 'L')) ) )
            a(i) = link_len(i);
        else
            % Let it evaluate whatever syms number it turns out to be
            a(i) = eval(R.a(i)); 
        end
        % Similar comparison for d
        if ( ~( isempty(findstr(cell2mat(arrayfun(@char, R.d(i), 'uniform', 0)), 'L')) ) )
            d(i) = link_len(i);
        else
            % Let it evaluate whatever syms number it turns out to be
            d(i) = eval(R.d(i)); 
        end
    end
    
end