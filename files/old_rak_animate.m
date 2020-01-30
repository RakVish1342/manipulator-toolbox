function [] = rak_animate(trans, angle)

    warning('off')
    
    angle = deg2rad(angle);
    
    figure('units','normalized','outerposition',[0 0 1 1])
    ax = axes('XLim',[-1 5],'YLim',[-1 4],'ZLim',[-1 4]);
    set(gca, 'CameraPosition', [44.788001060282454 -23.161463679561585 12.801907700577727]);

    % Defining plot parameters
    grid on
    xlabel('x-axis')
    ylabel('y-axis')
    zlabel('z-axis')

    % Create a frame obj
    h(1) = line([0 1],[0 0],[0 0],'color','r');
    h(2) = line([0 0],[0 1],[0 0],'color','g');
    h(3) = line([0 0],[0 0],[0 1],'color','b');
    h(4) = text(1,0,0,'x');
    h(5) = text(0,1,0,'y');
    h(6) = text(0,0,1,'z');
    h(7) = text(0,0,0,'o');

    % Create orig and final transform objects 
    % and parent them to the axes defined.
    t_orig = hgtransform('Parent',ax);
    t_final = hgtransform('Parent',ax);

    % Copy all properties of frame obj to t_orig and plot/display it
    set(h,'Parent',t_orig);
    % Copy all properties of frame obj to t_final
    copyobj(h,t_final);
    
    resol = 0.01;
    sleep = 0.0025;

    % Take T_in here (T_in can be from any method of rotation)
    
% % %     % Get individual angles from it, individual positions from it
% % % %     T = [ 1 0 0 1;
% % % %           0 0 1 2;
% % % %           0 1 0 3;
% % % %           0 0 0 1 ];
% % %     T = rpy(90 0 0)
% % % 
% % %     angles = tr2rpy(T, 'xyz')
% % %     trans = T(1:3, 4);
% % %     % Use the function given below    
    
    T_eff = [ 1 0 0 0; ...
              0 1 0 0; ...
              0 0 1 0; ...
              0 0 0 1;];

    for i = resol:resol:trans(1)
        T_trans = makehgtform('translate', [resol, 0, 0]);
        T_eff = T_eff*T_trans;
        set(t_final, 'Matrix', T_eff);
        pause(sleep);
    end
    for i = resol:resol:trans(2)
        T_trans = makehgtform('translate', [0, resol, 0]);
        T_eff = T_eff*T_trans;
        set(t_final, 'Matrix', T_eff);
        pause(sleep);
    end
    for i = resol:resol:trans(3)
        T_trans = makehgtform('translate', [0, 0, resol]);
        T_eff = T_eff*T_trans;
        set(t_final, 'Matrix', T_eff);
        pause(sleep);
    end
          
    
    % Rotation done in the Z, Y, X order !!
    for i = 0:resol:angle(3)
        T_rot = makehgtform('axisrotate',[0 0 1], resol);
        T_eff = T_eff*T_rot;
        set(t_final, 'Matrix', T_eff);
        pause(sleep);
    end
    for i = 0:resol:angle(2)
        T_rot = makehgtform('axisrotate',[0 1 0], resol);
        T_eff = T_eff*T_rot;
        set(t_final, 'Matrix', T_eff);
        pause(sleep);
    end
    for i = 0:resol:angle(1)
        T_rot = makehgtform('axisrotate',[1 0 0], resol);
        T_eff = T_eff*T_rot;
        set(t_final, 'Matrix', T_eff);
        pause(sleep);
    end
    
end