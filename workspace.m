clear all;
close all;
clc;

% figure('units','normalized','outerposition',[0 0 1 1])

%% Input Transformation matrix
% Symbolic variables
syms t1 t2 t3 L1 L2 L3 d4 real
dh = [L1,pi/4,0,t1; L2,0,0,t2;L3,0,0,t3;0,0,d4,0];
dh = subs(dh , [L1,L2,L3], vpa([0.6 0.2 0.3]));
q = [t1 t2 t3 d4];
jlimits = [-45*pi/180 45*pi/180; -120*pi/180 120*pi/180; -90*pi/180 90*pi/180; 0 10];
n=50; % # of Samples 
nlinks = size(dh,1);

%% Convert position syms expression into function 
T0H = fkine2(dh); % Forward kinmematics
fx = matlabFunction(T0H(1,4),'vars', {q.'}); 
fy = matlabFunction(T0H(2,4),'vars', {q.'});
fz = matlabFunction(T0H(3,4),'vars', {q.'});

%% Sample 
qvec = sample_mat(jlimits,nlinks,n);
X = fx(qvec); 
Y = fy(qvec);
Z = fz(qvec);

% Sample plot
density = 1;
npoints = size(X,2);
sindex = randsample(1:npoints,density*npoints);
Xs = X(:,sindex);
Ys = Y(:,sindex);
Zs = Z(:,sindex);

% Plotting workspace
plot3(Xs,Ys,Zs,'.');
alpha(.1);