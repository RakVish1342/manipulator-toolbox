function [T] = rak_animate_quat(vec, trans)
    q = Quaternion(vec);
    T = q.T();
    T(1:3, 4) = trans';
    rak_animate_transmatrix(T);
end
