clc
close all
clear

out = sim('lab4');

x = out.x;
y = out.y;
r = out.r;

r0 = str2double(get_param('lab4/Subsystem', 'r0'));
R  = str2double(get_param('lab4/Subsystem', 'R'));

for i = 1:length(x)
    xi = x(i);
    yi = y(i);
    ri = r(i);

    m2_x = 0;
    m2_y = -(2*r0 - ri);

    clf;
    hold on;

    plot(xi, yi, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
    plot([0, xi], [0, yi], 'b', 'LineWidth', 2);

    plot(m2_x, m2_y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    plot([0, m2_x], [0, m2_y], 'r', 'LineWidth', 2);

    rectangle('Position', [-R, -R, 2*R, 2*R], 'Curvature', [1, 1], 'EdgeColor', 'k', 'LineWidth', 2);
    
    hold off;
    axis equal;
    axis([-8, 8, -8, 8]);
    drawnow;
    pause(0.01);
end
