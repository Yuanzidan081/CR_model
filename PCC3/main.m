%%% this script wants to demonstrate the shape of the robot shape %%%

%% valuable exlaination
% dt=disk_thickness
% btp=base_top_point
% ddtcp=distance_disk_top_center_to_plane
% ldt=base_top_point+disk_top_center_to_plane_distance
% N=number of the disk
% dtp=disk_top_point
% dtTm=disk_top_transformation_matrix
% dtpc_zx=disk_top_point_coordinate_z_x
% dtpc_zy=disk_top_point_coordinate_z_y
% dtpc_zz=disk_top_point_coordinate_z_z
clc;
close all;
clear;

addpath("Test\");
addpath("Model\Function\")

parameters;
% test_central_point_line_graph;
test_sim_circlular;
% test_workspace;



