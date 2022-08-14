Bot_code_asign2.m- code to get final transformation matrix after making 
 		links and assigning DH parameters.



L1 = Link('d', 486.5, 'a', 150, 'alpha', pi/2);
L2 = Link('d', 0, 'a', 700, 'alpha', 0);
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2);
L4 = Link('d', 600, 'a', 0, 'alpha', -pi/2);
L5 = Link('d', 0, 'a', 0, 'alpha', -pi/2);
L6 = Link('d', 65, 'a', 0, 'alpha', 0);

%define links

L2.offset=pi/2;
L5.offset=pi;
%define  offsets for 2 links

bot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'IR robot');

%intialize and make the  manipulator using those links

bot.fkine([0 0 0 0 0 0 ]);

%get forward kinematics of end effector

_____________________________________________________________________

function_1_transformation_code.m - matlab code to make a function and 
				give 6 variables to it to get transformation matrix for IRB 1600-8/4.5 robot.


format short;



Getmevals(1,1,1,1,1,1)

%declared thing that give output


function f=Getmevals(te1,te2,te3,te4,te5,te6)
%function definition

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
%declared varibles which are parameter for IRB 1600-8/4.5 


        t65 = [cos(sym(te6)) -sin(sym(te6))*cos(sym(al6)) sin(sym(te6))*sin(sym(al6)) a6*cos(sym(te6));sin(sym(te6)) cos(sym(te6))*cos(sym(al6)) -cos(sym(te6))*sin(sym(al6)) a6*sin(sym(te6));0 sin(sym(al6)) cos(sym(al6)) d6 ;0 0 0 1];
        t54 = [cos(sym(te5+pi)) -sin(sym(te5+pi))*cos(sym(al5)) sin(sym(te5+pi))*sin(sym(al5)) a5*cos(sym(te5+pi));sin(sym(te5+pi)) cos(sym(te5+pi))*cos(sym(al5)) -cos(sym(te5+pi))*sin(sym(al5)) a5*sin(sym(te5+pi));0 sin(sym(al5)) cos(sym(al5)) d5 ;0 0 0 1];
        t43 = [cos(sym(te4)) -sin(sym(te4))*cos(sym(al4)) sin(sym(te4))*sin(sym(al4)) a4*cos(sym(te4));sin(sym(te4)) cos(sym(te4))*cos(sym(al4)) -cos(sym(te4))*sin(sym(al4)) a4*sin(sym(te4));0 sin(sym(al4)) cos(sym(al4)) d4 ;0 0 0 1];
        t32 = [cos(sym(te3)) -sin(sym(te3))*cos(sym(al3)) sin(sym(te3))*sin(sym(al3)) a3*cos(sym(te3));sin(sym(te3)) cos(sym(te3))*cos(sym(al3)) -cos(sym(te3))*sin(sym(al3)) a3*sin(sym(te3));0 sin(sym(al3)) cos(sym(al3)) d3 ;0 0 0 1];
        t21 = [cos(sym(te2+pi/2)) -sin(sym(te2+pi/2))*cos(sym(al2)) sin(sym(te2+pi/2))*sin(sym(al2)) a2*cos(sym(te2+pi/2));sin(sym(te2+pi/2)) cos(sym(te2+pi/2))*cos(sym(al2)) -cos(sym(te2+pi/2))*sin(sym(al2)) a2*sin(sym(te2+pi/2));0 sin(sym(al2)) cos(sym(al2)) d2 ;0 0 0 1];
        t10 = [cos(te1) -sin(sym(te1))*cos(sym(al1)) sin(sym(te1))*sin(sym(al1)) a1*cos(sym(te1));sin(sym(te1)) cos(sym(te1))*cos(sym(al1)) -cos(sym(te1))*sin(sym(al1)) a1*sin(sym(te1));0 sin(sym(al1)) cos(sym(al1)) d1 ;0 0 0 1];


% we just made transformation matrices between two consecutive frames
        f=t10*t21*t32*t43*t54*t65;

        %function returns the final T60 transformation from end effector
        %frame to base frame.






end        


 