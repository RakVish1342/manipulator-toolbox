function [Robo] = rak_dhfactor_robolink(a, alph, d, thet, joint_type, link_len)

    % Initialize robo_link to 'Link' type. Later ignore this entry.
    robo_link = [Link('d', 0, 'a', 0, 'alpha', 0)];
    % Create the Serial Links
    for i = 1:length(joint_type)
        if joint_type(i) == 'r'
            robo_link = [robo_link, Link('d', d(i), 'a', a(i), 'alpha', alph(i))];
        elseif joint_type(i) == 'p'
            % TODO: Change/Check qlim value to the link length
            robo_link = [robo_link, Link('a', a(i), 'alpha', alph(i), 'theta', thet(i), 'prismatic', 'qlim', [0, link_len(i)])];
        end
    end
       
    %TODO adjust to (max_link_length+2)
    bounds = max(link_len) + 2;
    W = [-bounds bounds -bounds bounds -bounds bounds];
    robo_link = robo_link(2:end);
    Robo = SerialLink(robo_link);
    %TODO: take input from user for the angle at which to plot it...or just
    %plot at 0 degrees for all?
    q = zeros(1, length(robo_link));
    Robo.plot(q,'workspace',W);
    Robo.teach
end