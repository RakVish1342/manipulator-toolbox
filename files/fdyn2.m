function [] = fdyn2(R,q0,qd0,Tc)

    T = 4;
    % tor = @(Tc) Tc;
    [ti,q,qd] = R.fdyn(T,@torqfun, q0, qd0,Tc);

    figure;
    plot(ti,q*180/pi)
    legend('\theta_1','\theta_2','\theta_3')
    xlabel('Time(sec)')
    ylabel('Joint angles(degres)')

    figure;
    plot(ti,qd)
    legend('$\dot{\theta_1}$','$\dot{\theta_2}$','$\dot{\theta_3}$', 'Interpreter','latex')
    xlabel('Time(sec)')
    ylabel('Joint velocity(rad/sec)')
end