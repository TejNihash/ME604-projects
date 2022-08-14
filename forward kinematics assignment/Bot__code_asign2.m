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

%intialize the  link

bot.fkine([1 1 1 1 1 1 ]);

%get forward kinematics of end effector
%hai