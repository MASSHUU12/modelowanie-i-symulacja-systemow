clc
close all
clear

out = sim('lab5_model');

h1 = out.h1;
h1max = max(h1) + 1;
h2 = out.h2;
h2max = max(h2) + 1;

s1 = str2double(get_param('lab5_model/Subsystem', 's1'));
s2 = str2double(get_param('lab5_model/Subsystem', 's2'));

swy1 = str2double(get_param('lab5_model/Subsystem', 'swy1'));
swy2 = str2double(get_param('lab5_model/Subsystem', 'swy2'));

fi1 = str2double(get_param('lab5_model/Subsystem', 'fi1'));
fi2 = str2double(get_param('lab5_model/Subsystem', 'fi2'));

for i = 1:length(h1)
    h1i = h1(i);
    h2i = h2(i);

    clf;
    hold on;

    rectangle( ...
        'Position', [0, 0, s1, h1i], ...
        'FaceColor', [135/255, 205/255, 235/255], ...
        'EdgeColor', 'k', ...
        'LineWidth', 1 ...
    );

    if (h1i >= swy1)
    rectangle( ...
        'Position', [s1, 0, 1, swy1], ...
        'FaceColor', [135/255, 205/255, 235/255], ...
        'EdgeColor', 'k', ...
        'LineWidth', 1 ...
    );
    else
    rectangle( ...
        'Position', [s1, 0, 1, h1i], ...
        'FaceColor', [135/255, 205/255, 235/255], ...
        'EdgeColor', 'k', ...
        'LineWidth', 1 ...
    );
    end

    if (h2i >= swy2)
    rectangle( ...
        'Position', [s1+s2+1, 0, 1, swy2], ...
        'FaceColor', [135/255, 205/255, 235/255], ...
        'EdgeColor', 'k', ...
        'LineWidth', 1 ...
    );
    else
    rectangle( ...
        'Position', [s1+s2+1, 0, 1, h2i], ...
        'FaceColor', [135/255, 205/255, 235/255], ...
        'EdgeColor', 'k', ...
        'LineWidth', 1 ...
    );
    end

    rectangle( ...
        'Position', [s1+1, 0, s2, h2i], ...
        'FaceColor', [135/255, 205/255, 235/255], ...
        'EdgeColor', 'k', ...
        'LineWidth', 1 ...
    );

    hold off;
    axis equal;
    axis([-6, 6, -6, 6]);
    drawnow;
    pause(0.01);
end
