% Notes
% Transformation to Jacobian 
    % rpy2jac 
    % eu2jac 
    % tr2jac
% R.jacob0 % World corrdinate
% R.jacobn % End effector corrdinate


%% Robotics Link
a1 = 0.3;
a2 = 0.3;
d4 = 0.3;

alpha = [0 0 0 0];  
a = [a1, a2, 0, 0]; 
d = [0, 0, 0, -d4];  
theta = zeros(1,4); 
dh = [theta' d' a' alpha']; 

L{1} = Link('d', dh(1,2), 'a', dh(1,3), 'alpha', dh(1,4)); 
L{2} = Link('d', dh(2,2), 'a', dh(2,3), 'alpha', dh(2,4)); 
L{3} = Link('theta', dh(3,1), 'a', dh(3,3), 'alpha', dh(3,4)); 
L{4} = Link('d', dh(4,2), 'a', dh(4,3), 'alpha', dh(4,4)); 
L{3}.qlim = [0, 0.2]; % add if prismatic joint
R = SerialLink([L{1} L{2} L{3} L{4}]);

% Geometric Jacobian
q = [3.14 3.14 2 3.14/2]
J0 = R.jacob0(q); % Based frame Jacobian
Jn = R.jacobn(q); % End effector Jacobian
