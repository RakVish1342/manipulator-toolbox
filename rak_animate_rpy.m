function [T_eff] = rak_animate_rpy(trans, angles, order)
    T_eff = rak_animate_selective(trans, angles, order);
end