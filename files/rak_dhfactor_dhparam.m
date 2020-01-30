function [R, joint_type] = rak_dhfactor_dhparam(s, num_links, joint_type)
    syms('q',[1 num_links])
    syms('L',[1 num_links])
    
    display(s)
    dh = DHFactor(s);
    R = eval(dh.command('myrobot'));
    R.display
    
    R;
    joint_type;
end
