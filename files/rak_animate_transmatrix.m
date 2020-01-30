function [] = rak_animate_transmatrix(T)
    order = 'zyx';
%     angles = tr2rpy(T, order);
    angles = tr2rpy(T);
    angles = rad2deg(angles);
    %rak_animate_selective([0 0 0], angles, order);
    trans = T(1:3, 4);
    rak_animate_selective(trans, angles, order);
end
