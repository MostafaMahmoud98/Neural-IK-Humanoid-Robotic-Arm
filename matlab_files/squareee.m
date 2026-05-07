R = 50;
H = 350;
N = 10;
center = [150, 320];
theta = linspace(0, 2*pi, N);
z = R*cos(theta) + center(1);
y = R*sin(theta) + center(2);
x = ones(1, length(z)) * H;
End = [x', y', z'];
path = [];
pos = [];

L(1) = Link('d', 90, 'a', 0, 'alpha', -pi/2);
L(2) = Link('d', 0, 'a', 260, 'alpha', pi/2);
L(3) = Link('d', 0, 'a', 0, 'alpha', -pi/2);
L(4) = Link('d', 194.5, 'a', 0, 'alpha', pi/2);
L(5) = Link('d', 0, 'a', 50, 'alpha', -pi/2);
L(6) = Link('d', 0, 'a', 110, 'alpha', 0);
Arm = SerialLink(L, 'name', 'Humanoid Arm');

A = [];
stylus = true;
zRotation = SE3.Rz(deg2rad(90));
figure;
hold on;

for i = 1:N-1
    xa1 = End(i, 1);
    ya1 = End(i, 2);
    za1 = End(i, 3);
    xf1 = End(i+1, 1);
    yf1 = End(i+1, 2);
    zf1 = End(i+1, 3);

    T11 = SE3(xa1, ya1, za1) * zRotation;      % Initial end-effector pose
    T12 = SE3(xf1, yf1, zf1) * zRotation;      % Final end-effector pose

    Ts1 = T11.ctraj(T12, 50);
    q1 = Arm.ikine(Ts1, zeros(1, 6), 'mask', [1 1 1 1 1 1]);

    p41 = transl(T11);
    p42 = transl(T12);

    xaLine = [p41(1), p42(1)];
    yLine = [p41(2), p42(2)];
    zLine = [p41(3), p42(3)];

    path = [path; transl(Ts1)];
    RPY = tr2rpy(Ts1, 'arm');
    pos = [pos; RPY];

    if stylus
        plot3(xaLine, yLine, zLine);
    end

    Arm.plot(q1);
    axis([-400 400 -400 600 -400 400]);
    A = [A; q1];
end

A = [A; A(1, :)];
th1 = A(:, 1) * 180/pi;
th2 = A(:, 2) * 180/pi;
th3 = A(:, 3) * 180/pi;
th4 = A(:, 4) * 180/pi;
th5 = A(:, 5) * 180/pi;
th6 = A(:, 6) * 180/pi;
t = 0:1:size(A, 1)-1;
time = t';

M1 = th1 + 90;
M2 = th2 + 90;
M3 = th3 + 90;
M4 = th4;
M5 = th5;
M6 = th6 + 90;
data = [M1 M2 M3 M4 M5 M6];
Ts = 0.02;
