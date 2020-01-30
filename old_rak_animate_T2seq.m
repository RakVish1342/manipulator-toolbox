function [] = rak_animate_T2seq(T)
    angles = tr2rpy(T, 'zyx') % 'xyz' throws error
    angles1 = rad2deg(angles)
    rak_animate([0, 0, 0], angles1, 'zyx') % check the order
end