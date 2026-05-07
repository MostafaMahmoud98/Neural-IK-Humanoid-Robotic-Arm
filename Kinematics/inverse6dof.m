L(1) = Link('d', 90, 'a', 0, 'alpha', -pi/2, 'qlim', [-90 90]*pi/180);
L(2) = Link('d', 6.29, 'a', 260, 'alpha', pi/2, 'qlim', [-90 45]*pi/180);
L(3) = Link('d', -1.3, 'a', 0, 'alpha', -pi/2, 'qlim', [0 110]*pi/180);
L(4) = Link('d', 172, 'a', 0, 'alpha', pi/2, 'qlim', [-90 90]*pi/180);
L(5) = Link('d', -1.65, 'a', 50, 'alpha', -pi/2, 'qlim', [0 180]*pi/180);
L(6) = Link('d', 0, 'a', 110, 'alpha', 0, 'qlim', [-90 90]*pi/180);

Arm = SerialLink(L, 'name', 'Humanoid Arm');


T=SE3(400,200,100)*SE3.Rz(90);
pos = Arm.ikine(Ts1, [0 0 0 0 0], 'mask', [1 1 1 1 1 1], 'ikineopts', 'm');
Arm.teach(pos);
th1=q(1)*180/pi;
th2=q(2)*180/pi;
th3=q(3)*180/pi;
th4=q(4)*180/pi;
th5=q(5)*180/pi;
th6=q(6)*180/pi;