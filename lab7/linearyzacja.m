clc
close all
clear

out = sim('zbiorniki_lin.slx');

[A, B, C, D] = linmod("zbiorniki_lin", [40.3, 20.13], 3.98);
