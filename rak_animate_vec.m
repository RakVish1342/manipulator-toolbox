function [T] = rak_animate_vec(v, th, trans)
    th = deg2rad(th);
    T = angvec2tr(th, v);
    T(1:3, 4) = trans';
    rak_animate_transmatrix(T);
end


