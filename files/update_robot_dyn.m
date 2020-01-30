function R = update_robot_dyn(R,kr,ml,r,Il,Im)
    for i = 1:R.n
        R.links(i).G = kr(i);
        R.links(i).m = ml(i);
        R.links(i).r = r(i,:);
        R.links(i).I = Il(i,:);
        R.links(i).Jm = Im(i);
    end
end