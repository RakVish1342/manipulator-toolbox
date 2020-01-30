function [T_eff] = rak_animate_eul(trans, rot)
    T_eff = rak_animate_selective(trans, rot, 'zyz');
end