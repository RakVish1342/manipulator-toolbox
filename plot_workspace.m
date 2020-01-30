function [] = plot_workspace(X,Y,Z,d)
%     density = 1;
    npoints = size(X,2);
    sindex = randperm(npoints,round(npoints*d));
    Xs = X(:,sindex);
    Ys = Y(:,sindex);
    Zs = Z(:,sindex);

    % Plotting workspace
    plot3(Xs,Ys,Zs,'.');
    alpha(.1);
end