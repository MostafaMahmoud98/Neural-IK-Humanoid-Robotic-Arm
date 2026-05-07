L(1)= Link('d', 0.4313 , 'a', 39.85, 'alpha', pi/2);
L(2)= Link('d', 80.41, 'a', 262.9, 'alpha', 0);
L(3)= Link('d', -5 , 'a', 0, 'alpha', -pi/2);
L(4)= Link('d', 198.2 , 'a', 0, 'alpha', pi/2);
L(5)= Link('d', 9.86 , 'a', 53, 'alpha', -pi/2);
L(6)= Link('d', 0 , 'a',60, 'alpha', 0);
Arm= SerialLink(L, 'name', 'Inmoov');
q0=[0,0,0,0,0,0];
T=Arm.fkine(q0);

X=T.t(1);   Y=T.t(2);   Z=T.t(3);
plot3(X ,Y ,Z ,'.' , 'MarkerSize' , 8, 'color',[0 0 1])
hold on
grid

POSITION=[];
THETA=[];
ROTATION=[];

samples = 1000;

for i = 2:samples
   
    q1 = ((135)*rand()-45)*pi/180;
    q2 = ((135)*rand()-45)*pi/180;
    q3 = ((130)*rand()-90)*pi/180;
    q4 = ((180)*rand()-90)*pi/180;
    q5 = ((90)*rand()-45)*pi/180;
    q6 = ((180)*rand()-90)*pi/180;

    th = [q1 q2 q3 q4 q5 q6];

    T=Arm.fkine(th);
    
    RPY= tr2rpy(T,'arm');
    ROLL=RPY(1,1)*180/pi;
    PITCH=RPY(1,2)*180/pi;
    YAW=RPY(1,3)*180/pi;

    ROT=[ROLL PITCH YAW];
   
    X=T.t(1);   Y=T.t(2);   Z=T.t(3);
    pos=[X Y Z];
    
    POSITION=[POSITION;pos];
    THETA=[THETA;th*180/pi];
    ROTATION=[ROTATION;ROT];
plot3(X ,Y ,Z ,'.' , 'MarkerSize' , 8, 'color',[0 0 1])




end
POSITION=POSITION*.001;
xlabel('X[mm]');
ylabel('Y[mm]');
zlabel('Z[mm]');
title('Arm Workspace');
hold on
