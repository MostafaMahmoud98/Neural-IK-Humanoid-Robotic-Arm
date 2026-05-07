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
plot3(X ,Y ,Z ,'.' , 'MarkerSize' , 8, 'MarkerFaceColor',[0 0 1])
hold on
grid

POSITION=[];
THETA=[];
N=7;
theta1 =linspace(-45,90,N)*pi/180;  %{first link}
theta2 =linspace(-45,90,N)*pi/180;  %{Second link}
theta3 =linspace(-90,40,N)*pi/180;  %{third link}
theta4 =linspace(-90,90,N)*pi/180;  %{third link}
theta5 =linspace(-45,45,N)*pi/180;  %{third link}
theta6 =linspace(-90,90,N)*pi/180;  %{third link}



for i=1:length(theta1)
    q1 = theta1(i);        %{indexing each angle of first link}
    for j=1:length(theta2)     
        q2 = theta2(j);  %{indexing each angle of Second link}
        for k=1:length(theta3) 
            q3 = theta3(k);  %{indexing each angle of Second link}
             for m=1:length(theta4) 
            q4 = theta4(m);  %{indexing each angle of Second link}
             for n=1:length(theta5) 
            q5 = theta5(n);  %{indexing each angle of Second link}
             for o=1:length(theta6) 
            q6 = theta6(o);  %{indexing each angle of Second link}
   
    th = [q1 q2 q3 q4 q5 q6];
   
    T=Arm.fkine(th);
    
    X=T.t(1);   Y=T.t(2);   Z=T.t(3);
    pos=[X Y Z];
    POSITION=[POSITION;pos];
    THETA=[THETA;th];


    RPY= tr2rpy(T,'arm');
    ROLL=RPY(1,1)*180/pi;
    PITCH=RPY(1,2)*180/pi;
    YAW=RPY(1,3)*180/pi;

plot3(X ,Y ,Z ,'.' , 'MarkerSize' , 8, 'color',[0 0 1])

% Arm.teach(pos)

                      end
                  end
             end
        end
    end
end
POSITION=POSITION*.001;
xlabel('X[mm]');
ylabel('Y[mm]');
zlabel('Z[mm]');
title('Arm Workspace');

% [X,Y,Z] = meshgrid(-800:800);
% V = X.*exp(-X.^2-Y.^2-Z.^2);
% xslice = 0;   
% yslice = [];
% zslice = [];
% slice(X,Y,Z,V,xslice,yslice,zslice,'nearest')