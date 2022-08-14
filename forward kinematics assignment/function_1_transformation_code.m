




Getmevals(1,1,1,1,1,1)
%declared thing that give output 
function f=Getmevals(te1,te2,te3,te4,te5,te6)
a1=150;
al1=pi/2;
d1=486.5;

a2=700;
al2 = 0;
d2=0;

a3=0;
al3=pi/2;
d3=0;

a4=0;
al4=-pi/2;
d4=600;

a5=0;
al5=-pi/2;
d5 = 0;

a6=0;
al6=0;
d6 =65;
%declared varibles
        t65 = [cos(te6) -sin(te6)*cos(al6) sin(te6)*sin(al6) a6*cos(te6);sin(te6) cos(te6)*cos(al6) -cos(te6)*sin(al6) a6*sin(te6);0 sin(al6) cos(al6) d6 ;0 0 0 1];
        t54 = [cos(te5+pi) -sin(te5+pi)*cos(al5) sin(te5+pi)*sin(al5) a5*cos(te5+pi);sin(te5+pi) cos(te5+pi)*cos(al5) -cos(te5+pi)*sin(al5) a5*sin(te5+pi);0 sin(al5) cos(al5) d5 ;0 0 0 1];
        t43 = [cos(te4) -sin(te4)*cos(al4) sin(te4)*sin(al4) a4*cos(te4);sin(te4) cos(te4)*cos(al4) -cos(te4)*sin(al4) a4*sin(te4);0 sin(al4) cos(al4) d4 ;0 0 0 1];
        t32 = [cos(te3) -sin(te3)*cos(al3) sin(te3)*sin(al3) a3*cos(te3);sin(te3) cos(te3)*cos(al3) -cos(te3)*sin(al3) a3*sin(te3);0 sin(al3) cos(al3) d3 ;0 0 0 1];
        t21 = [cos(te2+pi/2) -sin(te2+pi/2)*cos(al2) sin(te2+pi/2)*sin(al2) a2*cos(te2+pi/2);sin(te2+pi/2) cos(te2+pi/2)*cos(al2) -cos(te2+pi/2)*sin(al2) a2*sin(te2+pi/2);0 sin(al2) cos(al2) d2 ;0 0 0 1];
        t10 = [cos(te1) -sin(te1)*cos(al1) sin(te1)*sin(al1) a1*cos(te1);sin(te1) cos(te1)*cos(al1) -cos(te1)*sin(al1) a1*sin(te1);0 sin(al1) cos(al1) d1 ;0 0 0 1];
% we just made transformation matrices between two consecutive frames
        f=t10*t21*t32*t43*t54*t65;

        %function returns the final T60 transformation from end effector
        %frame to base frame.






end        

