clear all; close all;
% load('matlab.mat');
% load('dh_params1.mat');
% load('dh_params2.mat');

% [s, num_links, joint_type, ax_rot, link_ax, link_len] = rak_mit_dhfactor_string()
load('dh_params_check.mat');
[R, joint_type] = rak_dhfactor_dhparam(s, num_links, joint_type)
[a, alph, d, thet] = rak_dhfactor_nonsyms(R, joint_type, link_len)
rak_dhfactor_robolink(a, alph, d, thet, joint_type, link_len)
