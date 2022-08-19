clear all;
format short;




% the end effector position we want I gave


%declared thing that give output 
function [tet1,tet2,tet3,tet4,tet5,tet6] = function_2(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p)
syms te1 te2 te3 te4 te5 te6

%te1 = -20.991;
%te2= 0.0263455582;
%te3 = 0.35566458;


a1=0.150;
al1=pi/2;
d1=0.4865;

a2=0.700;
al2 = 0;
d2=0;

a3=0;
al3=pi/2;
d3=0;

a4=0;
al4=-pi/2;
d4=0.600;

a5=0;
al5=-pi/2;
d5 = 0;

a6=0;
al6=0;
d6 =0.065;

%declared varibles
        t65 = [cos(te6) -sin(te6)*cos(al6) sin(te6)*sin(al6) a6*cos(te6);sin(te6) cos(te6)*cos(al6) -cos(te6)*sin(al6) a6*sin(te6);0 sin(al6) cos(al6) d6 ;0 0 0 1];
        t54 = [cos(te5+pi) -sin(te5+pi)*cos(al5) sin(te5+pi)*sin(al5) a5*cos(te5+pi);sin(te5+pi) cos(te5+pi)*cos(al5) -cos(te5+pi)*sin(al5) a5*sin(te5+pi);0 sin(al5) cos(al5) d5 ;0 0 0 1];
        t43 = [cos(te4) -sin(te4)*cos(al4) sin(te4)*sin(al4) a4*cos(te4);sin(te4) cos(te4)*cos(al4) -cos(te4)*sin(al4) a4*sin(te4);0 sin(al4) cos(al4) d4 ;0 0 0 1];
        t32 = [cos(te3) -sin(te3)*cos(al3) sin(te3)*sin(al3) a3*cos(te3);sin(te3) cos(te3)*cos(al3) -cos(te3)*sin(al3) a3*sin(te3);0 sin(al3) cos(al3) d3 ;0 0 0 1];
        t21 = [cos(te2+pi/2) -sin(te2+pi/2)*cos(al2) sin(te2+pi/2)*sin(al2) a2*cos(te2+pi/2);sin(te2+pi/2) cos(te2+pi/2)*cos(al2) -cos(te2+pi/2)*sin(al2) a2*sin(te2+pi/2);0 sin(al2) cos(al2) d2 ;0 0 0 1];
        t10 = [cos(te1) -sin(te1)*cos(al1) sin(te1)*sin(al1) a1*cos(te1);sin(te1) cos(te1)*cos(al1) -cos(te1)*sin(al1) a1*sin(te1);0 sin(al1) cos(al1) d1 ;0 0 0 1];
% we just made transformation matrices between two consecutive frames


        A30 =vpa(t10*t21*t32,3);
        hc = vpa(A30*[0; 0 ;d4; 1],3);

        Oc_d=vpa(hc(1:3,1),3);
        Oc = vpa([d;h;l] - [a b c;e f g; i j k]*[0 ;0; d6],3);
        
        
        eqn = Oc_d==Oc;

        soln= solve(eqn);


        tet1 = vpa(soln.te1,3)
        tet2= vpa(soln.te2,3)
        tet3 = vpa(soln.te3,3)

        % we got te1,2,3 . Now find te4,5,6
        
        % we now need to get r30 from a30 using tet instead of te in a30.
        t32 = [cos(tet3) -sin(tet3)*cos(al3) sin(tet3)*sin(al3) a3*cos(tet3);sin(tet3) cos(tet3)*cos(al3) -cos(tet3)*sin(al3) a3*sin(tet3);0 sin(al3) cos(al3) d3 ;0 0 0 1];
        t21 = [cos(tet2+pi/2) -sin(tet2+pi/2)*cos(al2) sin(tet2+pi/2)*sin(al2) a2*cos(tet2+pi/2);sin(tet2+pi/2) cos(tet2+pi/2)*cos(al2) -cos(tet2+pi/2)*sin(al2) a2*sin(tet2+pi/2);0 sin(al2) cos(al2) d2 ;0 0 0 1];
        t10 = [cos(tet1) -sin(tet1)*cos(al1) sin(tet1)*sin(al1) a1*cos(tet1);sin(tet1) cos(tet1)*cos(al1) -cos(tet1)*sin(al1) a1*sin(tet1);0 sin(al1) cos(al1) d1 ;0 0 0 1];       





        T30 =t10*t21*t32;
        A63 = t43*t54*t65;
        

        R30 =T30(1:3,1:3);
        R60 = [a b c;e f g; i j k];
        R63 = vpa(transpose(R30)*R60,3);

         
        eqn5 = te5==acos(R63(3,3));
       
        tet5 = vpa(solve(eqn5),3)

        eqn4= te4 == atan(R63(2,3)/R63(1,3));

        tet4=vpa(solve(eqn4),3)

        



        

        eqn6 = te6==asin(R63(3,2)/sin(tet5));

        tet6 = vpa(solve(eqn6),3)
        
        %eqn = [trans_matrix(1,1)== a ,trans_matrix(1,2)==b]
        %func=vpasolve(eqn);

        %function returns the final T60 transformation from end effector
        %frame to base frame.
        

end

