L(1) = Link('d', 90, 'a', 0, 'alpha', -pi/2, 'qlim', [-90 90]*pi/180);
L(2) = Link('d', 6.29, 'a', 260, 'alpha', pi/2, 'qlim', [-90 45]*pi/180);
L(3) = Link('d', -1.3, 'a', 0, 'alpha', -pi/2, 'qlim', [0 110]*pi/180);
L(4) = Link('d', 172, 'a', 0, 'alpha', pi/2, 'qlim', [-90 90]*pi/180);
L(5) = Link('d', -1.65, 'a', 50, 'alpha', -pi/2, 'qlim', [0 180]*pi/180);
L(6) = Link('d', 0, 'a', 110, 'alpha', 0, 'qlim', [-90 90]*pi/180);

Arm = SerialLink(L, 'name', 'Humanoid Arm');

targetPose = SE3(400, 200, 100) * SE3.Rz(deg2rad(90));
initialGuess = zeros(1, 6);

q = Arm.ikine(targetPose, initialGuess, 'mask', [1 1 1 1 1 1]);
Arm.teach(q);

jointAnglesDeg = q * 180/pi;
th1 = jointAnglesDeg(1);
th2 = jointAnglesDeg(2);
th3 = jointAnglesDeg(3);
th4 = jointAnglesDeg(4);
th5 = jointAnglesDeg(5);
th6 = jointAnglesDeg(6);

disp('Joint angles (degrees):');
disp(jointAnglesDeg);
