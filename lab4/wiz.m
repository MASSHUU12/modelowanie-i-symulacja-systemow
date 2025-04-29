clc
close all
clear

out = sim('l1');

x = out.x;
y = out.y;

R = str2double(get_param('l1/Subsystem', 'R'));
rs = str2double(get_param('l1/Subsystem', 'rs'));

for i = 1:length(x)
    xi = x(i);
    yi = y(i);

    plot(x(1:i), y(1:i));
    rectangle('Position', [-R, -R, 2 * R, 2 * R], 'Curvature', [1, 1]);
    rectangle('Position', [xi - rs, yi - rs, 2 * rs, 2 * rs], 'Curvature', [1, 1]);
    axis([-10, 10, -10, 10]);
    daspect([1, 1, 1]);
    pause(0.01);
end
