L(1)= Link('d', 90 , 'a', 0, 'alpha', -pi/2);
L(2)= Link('d', 0, 'a', 260, 'alpha', pi/2);
L(3)= Link('d', 0 , 'a', 0, 'alpha', -pi/2);
L(4)= Link('d', 194.5 , 'a', 0, 'alpha', pi/2);
L(5)= Link('d', 0 , 'a', 50, 'alpha', -pi/2);
L(6)= Link('d', 0 , 'a',110, 'alpha', 0);
Arm= SerialLink(L, 'name', 'Humanoid Arm');
q=[0 0 0 0 0 0];
Arm.teach(q);