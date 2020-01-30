function [T_eff] = rak_animate_selective(trans, angle, order)

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
    
    T_eff = [ 1 0 0 0; ...
              0 1 0 0; ...
              0 0 1 0; ...
              0 0 0 1;];

    %translation x
    if trans(1)>=0
        trans_x = resol:resol:trans(1);
        for i = trans_x
            T_trans = makehgtform('translate', [resol, 0, 0]);
            T_eff = T_eff*T_trans;
            set(t_final, 'Matrix', T_eff);
            pause(sleep);
        end
    elseif trans(1)<0
        trans_x = 0:-resol:trans(1);
        for i = trans_x
            T_trans = makehgtform('translate', [-resol, 0, 0]);
            T_eff = T_eff*T_trans;
            set(t_final, 'Matrix', T_eff);
            pause(sleep);
        end
    end
       
    %translation y
    if trans(2)>=0
        trans_y = resol:resol:trans(2);
        for i = trans_y
            T_trans = makehgtform('translate', [0, resol, 0]);
            T_eff = T_eff*T_trans;
            set(t_final, 'Matrix', T_eff);
            pause(sleep);
        end
    elseif trans(2)<0
        trans_y = 0:-resol:trans(2);
        for i = trans_y
            T_trans = makehgtform('translate', [0, -resol, 0]);
            T_eff = T_eff*T_trans;
            set(t_final, 'Matrix', T_eff);
            pause(sleep);
        end
    end
    
    %translation z
    if trans(3)>=0
        trans_z = resol:resol:trans(3);
        for i = trans_z
            T_trans = makehgtform('translate', [0, 0, resol]);
            T_eff = T_eff*T_trans;
            set(t_final, 'Matrix', T_eff);
            pause(sleep);
        end
    elseif trans(3)<0
        trans_z = 0:-resol:trans(3);
        for i = trans_z
            T_trans = makehgtform('translate', [0, 0, -resol]);
            T_eff = T_eff*T_trans;
            set(t_final, 'Matrix', T_eff);
            pause(sleep);
        end
    end          
    
    ax = [];
    for i = 1:length(order)
        s = order(i);
        if (s == 'x' || s =='X')
            ax = [ax; [1 0 0]];
        elseif (s == 'y'|| s == 'Y')
            ax = [ax; [0 1 0]];
        elseif (s == 'z'|| s == 'Z')
            ax = [ax; [0 0 1]];     
        end
    end
    
   % Rotation done in the Z, Y, X order !!
    for a = 1:length(order)
        if angle(a) >= 0
            angle_range = 0:resol:angle(a);
            for i = angle_range
                T_rot = makehgtform('axisrotate',ax(a,:), resol);
                T_eff = T_eff*T_rot;
                set(t_final, 'Matrix', T_eff);
                pause(sleep);
            end
        elseif angle(a) < 0
            angle_range = 0:-resol:angle(a);
            for i = angle_range
                T_rot = makehgtform('axisrotate',ax(a,:), -resol);
                T_eff = T_eff*T_rot;
                set(t_final, 'Matrix', T_eff);
                pause(sleep);
            end
        end
    end
    
end