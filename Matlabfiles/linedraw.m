L(1)= Link('d', 90 , 'a', 0, 'alpha', -pi/2);
L(2)= Link('d', 0, 'a', 260, 'alpha', pi/2);
L(3)= Link('d', 0 , 'a', 0, 'alpha', -pi/2);
L(4)= Link('d', 194.5 , 'a', 0, 'alpha', pi/2);
L(5)= Link('d', 0 , 'a', 50, 'alpha', -pi/2);
L(6)= Link('d', 0 , 'a',110, 'alpha', 0);
Arm= SerialLink(L, 'name', 'Humanoid Arm');

T1 = SE3(350,250,100)*SE3.Rz(90);       % initial end effector pose
T2 = SE3(350,250,300)*SE3.Rz(90);    % final end effector pose
t =(0: 0.05: 12);
time = t';

TT = T1.ctraj(T2,length(t));
qs = Arm.ikine(TT, [0 0 0 0 0], 'mask', [1 1 1 1 1 1]);

path=transl(TT);
plot3(path(:,1),path(:,2),path(:,3))

th1=qs(:,1)*180/pi;
th2=qs(:,2)*180/pi;
th3=qs(:,3)*180/pi;
th4=qs(:,4)*180/pi;
th5=qs(:,5)*180/pi;
th6=qs(:,6)*180/pi;

Arm.plot(qs)

M1=th1+90;
M2=th2+90;
M3=th3+90;
M4=th4;
M5=th5;
M6=th6+90;
data=[M1 M2 M3 M4 M5 M6];
Ts=0.02;
