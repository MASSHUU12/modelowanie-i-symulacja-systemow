clc
close all
clear

load("data2.mat")
load("data1.mat")

% x'' = a11*x' + a12*y' + a13*x + a14*y
% y'' = a21*x' + a22*y' + a23*x + a24*y

% X = [data2(:, 1)'; data2(:, 2)'];
% Z = [data2(:, 3), data2(:, 4), data2(:, 5), data2(:, 6)]';

% Rs = X*Z';
% Ps = Z*Z';
% A1 = Rs*inv(Ps);

% A = [a11 a12 a13 a14;
% a21 a22 a23 a24];

% x2_d = data1(:, 1);
% y2_d = data1(:, 2);

% x'' = a11*x' + a12*y' + a13*x + a14*y
% x2_p = A1(1, 1)*data1(:, 3) + A1(1, 2)*data1(:, 4) + A1(1, 3)*data1(:, 5) + A1(1, 4)*data1(:, 6);

% y'' = a21*x' + a22*y' + a23*x + a24*y
% y2_p = A1(2, 1)*data1(:, 3) + A1(2, 2)*data1(:, 4) + A1(2, 3)*data1(:, 5) + A1(2, 4)*data1(:, 6);

% mse_x = mean((x2_p - x2_d).^2);
% mse_y = mean((y2_p - y2_d).^2);
% mse_total = (mse_x + mse_y)/2;

% ================================================
% x'' = a11*x' + a12*y' + a13*x + a14*y + a15*x'.^2 + a16*y'.^2 
% + a17*x.^2 + a18*y.^2
% y'' = a21*x' + a22*y' + a23*x + a24*y + a25*x'.^2 + a26*y'.^2 
% + a17*x.^2 + a28*y.^2

X = [data2(:, 1)'; data2(:, 2)'];
Z = [data2(:, 3), data2(:, 4), data2(:, 5), data2(:, 6), ...
    data2(:, 3).^2, data2(:, 4).^2, data2(:, 5).^2, data2(:, 6).^2]';

Rs = X*Z';
Ps = Z*Z';
A1 = Rs*inv(Ps);

x2_d = data1(:, 1);
y2_d = data1(:, 2);

x2_p = A1(1, 1)*data1(:, 3) + A1(1, 2)*data1(:, 4) ...
    + A1(1, 3)*data1(:, 5) + A1(1, 4)*data1(:, 6) ...
    + A1(1, 5)*data1(:, 3).^2 + A1(1, 6)*data1(:, 4).^2 ...
    + A1(1, 7)*data1(:, 5).^2 + A1(1, 8)*data1(:, 6).^2;
y2_p = A1(2, 1)*data1(:, 3) + A1(2, 2)*data1(:, 4) ...
    + A1(2, 3)*data1(:, 5) + A1(2, 4)*data1(:, 6) ...
    + A1(2, 5)*data1(:, 3).^2 + A1(2, 6)*data1(:, 4).^2 ...
    + A1(2, 7)*data1(:, 5).^2 + A1(2, 8)*data1(:, 6).^2;

mse_x = mean((x2_p - x2_d).^2)
mse_y = mean((y2_p - y2_d).^2)
mse_total = (mse_x + mse_y)/2

% ===========================================
h = 2^-8;
t = 500;
T = h:h:t;

x1 = data1(1, 5);
x1p = data1(1, 3);

y1 = data1(1, 6);
y1p = data1(1, 4);

x1pp = A1(1, 1)*x1p + A1(1, 2)*y1p + A1(1, 3)*x1 + A1(1, 4)*y1;
y1pp = A1(2, 1)*x1p + A1(2, 2)*y1p + A1(2, 3)*x1 + A1(2, 4)*y1;

for i = h:h:t
    x1(end+1) = x1(end)+x1p(end)*h;
    y1(end+1) = y1(end)+y1p(end)*h;

    x1p(end+1) = x1p(end)+x1pp(end)*h;
    y1p(end+1) = y1p(end)+y1pp(end)*h;

    x1pp(end+1) = A1(1, 1)*x1p(end) + A1(1, 2)*y1p(end) + A1(1, 3)*x1(end) + A1(1, 4)*y1(end);
    y1pp(end+1) = A1(2, 1)*x1p(end)+ A1(2, 2)*y1p(end) + A1(2, 3)*x1(end) + A1(2, 4)*y1(end);
end

figure;
plot(x1, y1);
figure;
plot(data1(:, 5), data1(:, 6));
