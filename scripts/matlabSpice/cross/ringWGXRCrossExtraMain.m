set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= 'ringWGXRCross';
outputFile =load('ringWGXRCross.1-DC.2d_dat');
Ref1=0.1;
TH1=0.7;
Right1= 0.15;
Left1= 0.2;

base2= 'ringWGXRCrossIdeal';
outputFileIdeal = load('ringWGXRCrossIdeal.1-DC.2d_dat');
Ref2=0.0;
TH2=1.0;
Right2= 0.0;
Left2= 0.0;

base3= 'ringWGXRCrossTH';
outputFileTH = load('ringWGXRCrossTH.1-DC.2d_dat');
Ref3=0.0;
TH3=0.7;
Right3= 0.0;
Left3= 0.0;

base4= 'ringWGXRCrossRef';
outputFileRef = load('ringWGXRCrossRef.1-DC.2d_dat');
Ref4=0.1;
TH4=0.7;
Right4= 0.0;
Left4= 0.0;

base5= 'ringWGXRCrossRefRight';
outputFileRefRight = load('ringWGXRCrossRefRight.1-DC.2d_dat');
Ref5=0.1;
TH5=0.7;
Right5= 0.15;
Left5= 0.0;

base6= 'ringWGXRCrossRight';
outputFileRight = load('ringWGXRCrossRight.1-DC.2d_dat');
Ref6=0.0;
TH6=0.7;
Right6= 0.3;
Left6= 0.0;


base7= 'ringWGXRCrossLeft';
outputFileLeft = load('ringWGXRCrossLeft.1-DC.2d_dat');
Ref7=0.0;
TH7=0.7;
Right7= 0.0;
Left7= 0.2;

basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/cross/';




x=outputFile(:,1);

% TH circuit
N61InTH=10.^(outputFileTH(:,2)./20);
N62InTH=10.^(outputFileTH(:,3)./20);
N63InTH=10.^(outputFileTH(:,4)./20);
N64InTH=10.^(outputFileTH(:,5)./20);
N61OutTH=10.^(outputFileTH(:,6)./20);
N62OutTH=10.^(outputFileTH(:,7)./20);
N63OutTH=10.^(outputFileTH(:,8)./20);
N64OutTH=10.^(outputFileTH(:,9)./20);
x71InTH=10.^(outputFileTH(:,10)./20);
x72InTH=10.^(outputFileTH(:,11)./20);
x73InTH=10.^(outputFileTH(:,12)./20);
x74InTH=10.^(outputFileTH(:,13)./20);
x71OutTH=10.^(outputFileTH(:,14)./20);
x72OutTH=10.^(outputFileTH(:,15)./20);
x73OutTH=10.^(outputFileTH(:,16)./20);
x74OutTH=10.^(outputFileTH(:,17)./20);
w3eInTH=10.^(outputFileTH(:,18)./20);
w4nInTH=10.^(outputFileTH(:,19)./20);
w3eOutTH=10.^(outputFileTH(:,20)./20);
w4nOutTH=10.^(outputFileTH(:,21)./20);



% Mag and Phi from dataSet
N61InTHMag=outputFileTH(:,22);
N61InTHPhi=outputFileTH(:,23);
N62InTHMag=outputFileTH(:,24);
N62InTHPhi=outputFileTH(:,25);
N63InTHMag=outputFileTH(:,26);
N63InTHPhi=outputFileTH(:,27);
N64InTHMag=outputFileTH(:,28);
N64InTHPhi=outputFileTH(:,29);
N61OutTHMag=outputFileTH(:,30);
N61OutTHPhi=outputFileTH(:,31);
N62OutTHMag=outputFileTH(:,32);
N62OutTHPhi=outputFileTH(:,33);
N63OutTHMag=outputFileTH(:,34);
N63OutTHPhi=outputFileTH(:,35);
N64OutTHMag=outputFileTH(:,36);
N64OutTHPhi=outputFileTH(:,37);

x71InTHMag=outputFileTH(:,38);
x71InTHPhi=outputFileTH(:,39);
x72InTHMag=outputFileTH(:,40);
x72InTHPhi=outputFileTH(:,41);
x73InTHMag=outputFileTH(:,42);
x73InTHPhi=outputFileTH(:,43);
x74InTHMag=outputFileTH(:,44);
x74InTHPhi=outputFileTH(:,45);
x71OutTHMag=outputFileTH(:,46);
x71OutTHPhi=outputFileTH(:,47);
x72OutTHMag=outputFileTH(:,48);
x72OutTHPhi=outputFileTH(:,49);
x73OutTHMag=outputFileTH(:,50);
x73OutTHPhi=outputFileTH(:,51);
x74OutTHMag=outputFileTH(:,52);
x74OutTHPhi=outputFileTH(:,53);

w3eInTHMag=outputFileTH(:,54);
w3eInTHPhi=outputFileTH(:,55);
w4nInTHMag=outputFileTH(:,56);
w4nInTHPhi=outputFileTH(:,57);
w3eOutTHMag=outputFileTH(:,58);
w3eOutTHPhi=outputFileTH(:,59);
w4nOutTHMag=outputFileTH(:,60);
w4nOutTHPhi=outputFileTH(:,61);

% Convert to Real/Imag
% TH cir.
N61InTHEr= N61InTHMag.*cos(N61InTHPhi);
N61InTHEi= N61InTHMag.*sin(N61InTHPhi);

N62InTHEr= N62InTHMag.*cos(N62InTHPhi);
N62InTHEi= N62InTHMag.*sin(N62InTHPhi);

N63OutTHEr= N63OutTHMag.*cos(N63OutTHPhi);
N63OutTHEi= N63OutTHMag.*sin(N63OutTHPhi);

% Build the transer functions
% Power
fTH_TH=N63OutTH.*(N61InTH.^(-1));   % Input-Through Power transfer function for TH cir.
fDrop_TH=N62InTH.*(N61InTH.^(-1));   % Input-Drop Power transferfunction for TH cir.
% Mag/Phase
fTH_TH_Mag=N63OutTHMag.*(N61InTHMag.^(-1));   % Input-Through Mag transfer function for TH cir.
fTH_TH_Phi=N63OutTHPhi-N61InTHPhi;   % Input-Through Phase transfer function for TH cir.
% Through has a phase shift of almost 0 degree;

fDrop_TH_Mag=N62InTHMag.*(N61InTHMag.^(-1));   % Input-Drop Mag transfer function for TH cir.
fDrop_TH_Phi=N62InTHPhi-N61InTHPhi;   % Input-Drop Phi transfer function for TH cir.
% Drop has a phase shift of almost 90 degree at non-resonance lambda;
% Drop has a phase shift of almost 0 degree at  resonance lambda;

% Mag and Phase factors of waveguide transfer function
fWG1_TH_Mag = N63OutTHMag.*(x71InTHMag.^(-1)); 
fWG1_TH_PhiF = x71InTHPhi - N63OutTHPhi;
% PosVal= fWG1_TH_PhiF >0 ;
% fWG1_TH_PhiF(PosVal) = -2*pi - fWG1_TH_PhiF ;


fWG1_TH_PhiR = x71OutTHPhi - N63InTHPhi;
fWG3_TH_PhiF = w3eOutTHPhi- x73OutTHPhi;


figure('name','Circuit TH, Waveguide1,3 Phase shifts','numbertitle','off');
subplot(3,2,1);
plot(x,N63OutTHPhi,':r',x,x71InTHPhi,'-.g');
legend('N63OutTHPhi','x71InTHPhi','Location','eastoutside');
title('Circuit TH, wg1 F-dir, phase shifts');
subplot(3,2,2);
plot(x,N63InTHPhi,':r',x,x71OutTHPhi,'--g');
legend('x71OutTHPhi','Location','eastoutside');
title('Circuit TH, wg1 R-dir phase shifts');

subplot(3,2,3);
plot(x,x73OutTHPhi,':r',x,w3eOutTHPhi,'-.g');
legend('x73OutTHPhi','w3eInTHPhi','Location','eastoutside');
title('Circuit TH, wg3f-dir, phase shifts');
subplot(3,2,4);
plot(x,x73InTHPhi,':r',x,w3eInTHPhi,'--g');
legend('x73InTHPhi', 'w3eOutTHPhi','Location','eastoutside');
title('Circuit TH, wg3 R-dir, phase shifts');

subplot(3,2,[5,6]);
plot(x,fWG1_TH_PhiF,':r', x,fWG3_TH_PhiF,'--g');
legend('wg1 PHASE shift transer function','wg3 PHASE shift transer function');
title('Circuit TH, wg1,wg3 PHASE shift transer function');

% Expected

N1TH=N61InTH;
N2TH=N62InTH;

% N2TH = Drop(N61IN)
N2THMag = fDrop_TH_Mag.*N61InTHMag;
N2THPhi = fDrop_TH_Phi + N61InTHPhi ;
N3TH=TH3.*N63OutTH;

% N3TH = WG3(xTH(WG1(TH(N61IN))))
    % WG3=WG1 (fWG3_TH_MagF(=1 no loss), fWG3_TH_PhiF
    % xTH= TH3 =(O.7)
    % TH (fTH_TH_Mag, fTH_TH_Phi) 

% N3THMag = TH3.* N63OutTHMag;
% N3THPhi =  N63OutTHPhi + 2.*fWG3_TH_PhiF;
N3THMag = TH3.* (fTH_TH_Mag.*N61InTHMag);
N3THPhi = fTH_TH_Phi + N61InTHPhi + 2.*fWG3_TH_PhiF;
N4TH= 0;


% Plot of TH circuit
% Create figure
fig1=figure('name','Circuit TH, 4 ports','numbertitle','off');
title({'Circuit TH, 4 ports'});
subplot(3,2,1,'Parent',fig1);
plot(x,N61InTH,':r',x,N1TH,'--g');
legend('Sim','Theory','Location','eastoutside');
title('Circuit TH, 4 ports, N61In');

subplot(3,2,2,'Parent',fig1);
plot(x,N62InTHMag,':r',x,N2THMag,'--g');
legend('Sim','Theory','Location','eastoutside');
title('Circuit TH, 4 ports, N62In, Mag');
subplot(3,2,3,'Parent',fig1);
plot(x,N62InTHPhi,':r',x,N2THPhi,'--g');
legend('Sim','Theory','Location','eastoutside');
title('Circuit TH, 4 ports, N62In, Phi');


subplot(3,2,4,'Parent',fig1);
plot(x,w3eOutTHMag,':r',x,N3THMag,'--g');
legend('Sim','Theory','Location','eastoutside');
title('Circuit TH, 4 ports, Mag w3eOut');

subplot(3,2,5,'Parent',fig1);
plot(x,w3eOutTHPhi,':r',x,N3THPhi,'--g');
legend('Sim','Theory','Location','eastoutside');
title('Circuit TH, 4 ports, Phase w3eOut');

%odd nummber of plots in subplot format
subplot(3,2,6,'Parent',fig1);
plot(x,w4nOutTH,':r',x,N4TH,'--g');
legend('Sim','Theory','Location','eastoutside');
title('Circuit TH, 4 ports, w4nOut');


figure('name','Circuit TH, Transfer functions','numbertitle','off');
subplot(2,2,1);
plot(x,fTH_TH_Mag,':r',x,fDrop_TH_Mag,'--g');
legend('TH Mag','Drop Mag','Location','eastoutside');
title('Circuit TH, Transfer functions, Mag');
subplot(2,2,3);
plot(x,fTH_TH_Phi,':r',x,fDrop_TH_Phi,'--g');
legend('TH Phi','Drop Phi','Location','eastoutside');
title('Circuit TH, Transfer functions, Phi');
subplot(2,2,2);
plot(x,fWG1_TH_Mag,':r');
legend('WG Mag','Location','eastoutside');
title('Waveguide, Transfer functions, Mag');
subplot(2,2,4);
plot(x,fWG1_TH_PhiF,':r');
legend('WG1 Phase F', 'Location','eastoutside');
title('Waveguide, Transfer functions, Phi');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 



% main circuit
% Right circuit
% Mag and Phi from dataSet
N61InRightMag=outputFileRight(:,22);
N61InRightPhi=outputFileRight(:,23);
N62InRightMag=outputFileRight(:,24);
N62InRightPhi=outputFileRight(:,25);
N63InRightMag=outputFileRight(:,26);
N63InRightPhi=outputFileRight(:,27);
N64InRightMag=outputFileRight(:,28);
N64InRightPhi=outputFileRight(:,29);
N61OutRightMag=outputFileRight(:,30);
N61OutRightPhi=outputFileRight(:,31);
N62OutRightMag=outputFileRight(:,32);
N62OutRightPhi=outputFileRight(:,33);
N63OutRightMag=outputFileRight(:,34);
N63OutRightPhi=outputFileRight(:,35);
N64OutRightMag=outputFileRight(:,36);
N64OutRightPhi=outputFileRight(:,37);

x71InRightMag=outputFileRight(:,38);
x71InRightPhi=outputFileRight(:,39);
x72InRightMag=outputFileRight(:,40);
x72InRightPhi=outputFileRight(:,41);
x73InRightMag=outputFileRight(:,42);
x73InRightPhi=outputFileRight(:,43);
x74InRightMag=outputFileRight(:,44);
x74InRightPhi=outputFileRight(:,45);
x71OutRightMag=outputFileRight(:,46);
x71OutRightPhi=outputFileRight(:,47);
x72OutRightMag=outputFileRight(:,48);
x72OutRightPhi=outputFileRight(:,49);
x73OutRightMag=outputFileRight(:,50);
x73OutRightPhi=outputFileRight(:,51);
x74OutRightMag=outputFileRight(:,52);
x74OutRightPhi=outputFileRight(:,53);

w3eInRightMag=outputFileRight(:,54);
w3eInRightPhi=outputFileRight(:,55);
w4nInRightMag=outputFileRight(:,56);
w4nInRightPhi=outputFileRight(:,57);
w3eOutRightMag=outputFileRight(:,58);
w3eOutRightPhi=outputFileRight(:,59);
w4nOutRightMag=outputFileRight(:,60);
w4nOutRightPhi=outputFileRight(:,61);

% End of Right Circuit data extraction

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% main circuit
% TH circuit
N61In=10.^(outputFile(:,2)./20);
N62In=10.^(outputFile(:,3)./20);
N63In=10.^(outputFile(:,4)./20);
N64In=10.^(outputFile(:,5)./20);
N61Out=10.^(outputFile(:,6)./20);
N62Out=10.^(outputFile(:,7)./20);
N63Out=10.^(outputFile(:,8)./20);
N64Out=10.^(outputFile(:,9)./20);
x71In=10.^(outputFile(:,10)./20);
x72In=10.^(outputFile(:,11)./20);
x73In=10.^(outputFile(:,12)./20);
x74In=10.^(outputFile(:,13)./20);
x71Out=10.^(outputFile(:,14)./20);
x72Out=10.^(outputFile(:,15)./20);
x73Out=10.^(outputFile(:,16)./20);
x74Out=10.^(outputFile(:,17)./20);
w3eIn=10.^(outputFile(:,18)./20);
w4nIn=10.^(outputFile(:,19)./20);
w3eOut=10.^(outputFile(:,20)./20);
w4nOut=10.^(outputFile(:,21)./20);



% Mag and Phi from dataSet
N61InMag=outputFile(:,22);
N61InPhi=outputFile(:,23);
N62InMag=outputFile(:,24);
N62InPhi=outputFile(:,25);
N63InMag=outputFile(:,26);
N63InPhi=outputFile(:,27);
N64InMag=outputFile(:,28);
N64InPhi=outputFile(:,29);
N61OutMag=outputFile(:,30);
N61OutPhi=outputFile(:,31);
N62OutMag=outputFile(:,32);
N62OutPhi=outputFile(:,33);
N63OutMag=outputFile(:,34);
N63OutPhi=outputFile(:,35);
N64OutMag=outputFile(:,36);
N64OutPhi=outputFile(:,37);

x71InMag=outputFile(:,38);
x71InPhi=outputFile(:,39);
x72InMag=outputFile(:,40);
x72InPhi=outputFile(:,41);
x73InMag=outputFile(:,42);
x73InPhi=outputFile(:,43);
x74InMag=outputFile(:,44);
x74InPhi=outputFile(:,45);
x71OutMag=outputFile(:,46);
x71OutPhi=outputFile(:,47);
x72OutMag=outputFile(:,48);
x72OutPhi=outputFile(:,49);
x73OutMag=outputFile(:,50);
x73OutPhi=outputFile(:,51);
x74OutMag=outputFile(:,52);
x74OutPhi=outputFile(:,53);

w3eInMag=outputFile(:,54);
w3eInPhi=outputFile(:,55);
w4nInMag=outputFile(:,56);
w4nInPhi=outputFile(:,57);
w3eOutMag=outputFile(:,58);
w3eOutPhi=outputFile(:,59);
w4nOutMag=outputFile(:,60);
w4nOutPhi=outputFile(:,61);


% Real Imag
N64OutEr =N64OutMag.*cos(N64OutPhi);
N64OutEi =N64OutMag.*sin(N64OutPhi);
N64OutE = sqrt(N64OutEr.^2 + N64OutEi.^2 );

x71OutEr =x71OutMag.*cos(x71OutPhi);
x71OutEi =x71OutMag.*sin(x71OutPhi);
x71OutE = sqrt(x71OutEr.^2 + x71OutEi.^2 );

figure('name','Circuit Main, Waveguide1,3 Phase shifts','numbertitle','off');
subplot(4,4,1);
plot(x,N63OutPhi,':r',x,x71InPhi,'-.g');
legend('N63OutPhi','x71InPhi','Location','eastoutside');
title('Circuit Main, wg1 F-dir, phase shifts');
subplot(4,4,2);
plot(x,N63InPhi,':r',x,x71OutPhi,'--g');
legend('N63InPhi','x71OutPhi','Location','eastoutside');
title('Circuit Main, wg1 R-dir phase shifts');
subplot(4,4,3);
temp = x71InPhi-N63OutPhi;
PosVal= temp >0 ;
temp(PosVal) = -2*pi - temp(PosVal) ;
plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
legend('wg1 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');
subplot(4,4,4);
temp = N63InPhi-x71OutPhi;
PosVal= temp >0 ;
temp(PosVal) = -2*pi - temp(PosVal) ;
plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
legend('wg1 R-Dir fWG Mian, Sim','wg1 R-dir fWG TH');

subplot(4,4,5);
plot(x,N64InPhi,':r',x,x72OutPhi,'-.g');
legend('N64InPhi','x72OutPhi','Location','eastoutside');
title('Circuit Main, wg2 f-dir, phase shifts');
subplot(4,4,6);
plot(x,N64OutPhi,':r',x,x72InPhi,'--g');
legend('N64OutPhi', 'x72InPhi','Location','eastoutside');
title('Circuit Main, wg2 R-dir, phase shifts');
subplot(4,4,7);
temp = N64InPhi-x72OutPhi;
PosVal= temp >0 ;
temp(PosVal) = -2*pi - temp(PosVal) ;
plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
legend('wg2 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');
subplot(4,4,8);
temp = x72InPhi-N64OutPhi;
PosVal= temp >0 ;
temp(PosVal) = -2*pi + temp(PosVal) ;
plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
legend('wg2 R-dir fWG Mian, Sim','wg1 R-dir fWG TH');


subplot(4,4,9);
plot(x,x73OutPhi,':r',x,w3eOutPhi,'-.g');
legend('x73OutPhi','w3eInPhi','Location','eastoutside');
title('Circuit Main, wg3 f-dir, phase shifts');
subplot(4,4,10);
plot(x,x73InPhi,':r',x,w3eInPhi,'--g');
legend('x73InPhi', 'w3eOutPhi','Location','eastoutside');
title('Circuit Main, wg3 R-dir, phase shifts');
subplot(4,4,[11:12]);
temp = w3eOutPhi-x73OutPhi;
PosVal= temp >0 ;
temp(PosVal) = -2*pi - temp(PosVal) ;
plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
legend('wg3 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');

subplot(4,4,13);
plot(x,w4nOutPhi,':r',x,x74OutPhi,'-.g');
legend('w4nOutPhi','x74OutPhi','Location','eastoutside');
title('Circuit Main, wg4 f-dir, phase shifts');
subplot(4,4,14);
plot(x,w4nInPhi,':r',x,x74InPhi,'--g');
legend('w4nInPhi', 'x74InPhi','Location','eastoutside');
title('Circuit Main, wg4 R-dir, phase shifts');
subplot(4,4,[15:16]);
temp = w4nOutPhi-x74OutPhi;
PosVal= temp >0 ;
temp(PosVal) = -2*pi - temp(PosVal) ;
plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
legend('wg4 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');




% Expected

% N63Out_p1 = TH(N61In); eq2
N63Out_p1_Mag = fTH_TH_Mag.*N61InMag;
N63Out_p1_Phi = fTH_TH_Phi+N61InPhi;

figure('name','Circuit Main, N63Out round 1','numbertitle','off');
subplot(2,1,1);
plot(x,N63Out_p1_Mag,':r',x,N63OutMag,'--g');
legend('N63Out-p1-Mag','N63OutMag');
subplot(2,1,2);
plot(x,N63Out_p1_Phi,':r',x,N63OutPhi,'--g');
legend('N63Out-p1-Phi','N63OutPhi');

% x71In_p1 = WG(N63out); eq3
x71In_p1_Mag = N63Out_p1_Mag;
x71In_p1_Phi = fWG1_TH_PhiF+N63Out_p1_Phi;
figure('name','Circuit Main, x71In Ph','numbertitle','off');
subplot(2,1,1)
plot(x,x71In_p1_Mag,':r',x,x71InMag,'--g');
legend('x71In-p1-Mag','x71InMag');
subplot(2,1,2)
plot(x,x71In_p1_Phi,':r',x,x71InPhi,'--g');
legend('x71In-p1-Phi','x71InPhi');

% x71Out_p1 = Ref(x71In_p1); eq4
x71Out_p1_Mag = Ref1.*x71In_p1_Mag;
x71Out_p1_Phi = x71In_p1_Phi;
figure('name','Circuit Main, x71Out round 1','numbertitle','off');
subplot(2,1,1);
plot(x,x71Out_p1_Mag,':r',x,x71OutMag,'--g');
legend('x71Out-p1-Mag','x71OutMag');
subplot(2,1,2);
plot(x,x71Out_p1_Phi,':r',x,x71OutPhi,'--g');
legend('x71Out-p1-Phi','x71OutPhi');


% N63In_p1 = WG(x71Out_p1); eq5
N63In_p1_Mag = x71Out_p1_Mag;
N63In_p1_Phi = fTH_TH_Phi+x71Out_p1_Phi;
figure('name','Circuit Main, N63In round 1','numbertitle','off');
subplot(2,1,1);
plot(x,N63In_p1_Mag,':r',x,N63InMag,'--g');
legend('N63In-p1-Mag','N63InMag');
subplot(2,1,2);
plot(x,N63In_p1_Phi,':r',x,N63InPhi,'--g');
legend('N63In-p1-Phi','N63InPhi');


% N64Out_p1 = Drop(N63In); eq7
N64Out_p1_Mag = fDrop_TH_Mag.*N63InMag;
N64Out_p1_Phi = fDrop_TH_Phi+N63InPhi;
figure('name','Circuit Main, N64Out ','numbertitle','off');
subplot(2,1,1);
plot(x,N64Out_p1_Mag,':r',x,N64OutMag,'--g');
legend('N64Out-p1-Mag','N64OutMag');
subplot(2,1,2);
plot(x,N64Out_p1_Phi,':r',x,N64OutPhi,'--g');
legend('N64Out-p1-Phi','N64OutPhi');

% x72In_p1 = WG(N64out); eq8
x72In_p1_Mag = N64Out_p1_Mag;
x72In_p1_Phi = fWG1_TH_PhiF+N64Out_p1_Phi;
figure('name','Circuit Main, x72In Phase round 1','numbertitle','off');
plot(x,x72In_p1_Phi,':r',x,x72InPhi,'--g');
legend('x72In-p1-Phi','x72InPhi');

% x71Out_p2 = Left(x72In_p1); eq10
x71Out_p2_Mag = Left1.*x72In_p1_Mag;
x71Out_p2_Phi = x72In_p1_Phi;

% x71Out_p3 = % x71Out_p1 + x71Out_p2; eq22 

x71Out_p3= x71Out_p1_Mag.*exp(x71Out_p1_Phi.*1i) + x71Out_p2_Mag.*exp(x71Out_p2_Phi.*1i);

x71Out_p3_Phi= angle(x71Out_p3);
x71Out_p3_Mag= abs(x71Out_p3);

figure('name','Circuit Main, x71Out (p3) Phase round 2','numbertitle','off');
subplot(2,1,1);
plot(x,x71Out_p3_Mag,':r',x,x71OutMag,'--g');
legend('x71Out-p3-Mag','x71OutMag');
subplot(2,1,2);
plot(x,x71Out_p3_Phi,':r',x,x71OutPhi,'--g');
legend('x71Out-p3-Phi','x71OutPhi');


% N63In = WG(x71Out) ; eq5 eq21
N63In_p2_Mag = x71Out_p3_Mag;
N63In_p2_Phi = fWG1_TH_PhiF+x71Out_p3_Phi;

%%%%%%%%%%%%%%%%%%%%%%%%% START N63In %%%%%%%%%%%%%%%%%%%%%%%%%%
figure('name','Circuit Main, N63In','numbertitle','off');
subplot(2,1,1);
plot(x,N63In_p2_Mag,':r',x,N63InMag,'--g');
legend('N63In-p2-Mag','N63InMag');
subplot(2,1,2);
plot(x,N63In_p2_Phi,':r',x,N63InPhi,'--g');
legend('N63In-p2-Phi','N63InPhi');

%%%%%%%%%%%%%%%%%%%%%%%%% End N63In %%%%%%%%%%%%%%%%%%%%%%%%%%

% N6IOut = TH(N63In); eq6
N61Out_p1_Mag = fTH_TH_Mag.*N63In_p2_Mag;
N61Out_p1_Phi = fTH_TH_Phi+N63In_p2_Phi;

figure('name','Circuit Main, N61Out','numbertitle','off');
subplot(2,1,1);
plot(x,N61Out_p1_Mag,':r',x,N61OutMag,'--g');
legend('N61Out-p1-Mag','N61OutMag');
subplot(2,1,2);
plot(x,N61Out_p1_Phi,':r',x,N61OutPhi,'--g');
legend('N61Out-p1-Phi','N61OutPhi');

% x72Out_p1 = Right*x71In_p ; eq12
x72Out_p1_Mag = Right1.*x71In_p1_Mag;
x72Out_p1_Phi = x71In_p1_Phi;

%N64In_p = WG(x72Out-p1) ;eq 13
N64In_p1_Mag = x72Out_p1_Mag;
N64In_p1_Phi = fWG1_TH_PhiF+x72Out_p1_Phi;

figure('name','Circuit Main, N64In','numbertitle','off');
subplot(2,1,1);
plot(x,N64In_p1_Mag,':r',x,N64InMag,'--g');
legend('N64In_p_Mag','N64InMag');
subplot(2,1,2);
plot(x,N64In_p1_Phi,':r',x,N64InPhi,'--g');
legend('N64In-p-Phi','N64InPhi');


% N63Out_p2 = Drop(N64In); eq15
N63Out_p2_Mag = fDrop_TH_Mag.*N64In_p1_Mag;
N63Out_p2_Phi = fDrop_TH_Phi+N64In_p1_Phi;

% N63Out_p3 = N63Out_p1 + N63Out_p2 ;eq27
N63Out_p3 = N63Out_p1_Mag.*exp(N63Out_p1_Phi.*1i) + N63Out_p2_Mag.*exp(N63Out_p2_Phi.*1i);
N63Out_p3_Phi= angle(N63Out_p3);
N63Out_p3_Mag= abs(N63Out_p3);

figure('name','Circuit Main, N63Out','numbertitle','off');
subplot(2,1,1);
plot(x,N63Out_p3_Mag,':r',x,N63OutMag,'--g');
legend('N64In_p_Mag','N63OutMag');
subplot(2,1,2);
plot(x,N63Out_p3_Phi,':r',x,N63OutPhi,'--g');
legend('N63Out-p3-Phi','N63OutPhi');

% N62In_p1 = fDrop(N61In); eq 18
N62In_p1_Mag = fDrop_TH_Mag.*N61InMag;
N62In_p1_Phi = fDrop_TH_Phi+N61InPhi;

% N62In_p2 = fTH(N64In_p); eq 14
N62In_p2_Mag = fTH_TH_Mag.*N64In_p1_Mag;
N62In_p2_Phi = fTH_TH_Phi+N64In_p1_Phi;

% N62In_p3 = N62In_p1 + N62In_p2 ;eq26
N62In_p3 = N62In_p1_Mag.*exp(N62In_p1_Phi.*1i) + N62In_p2_Mag.*exp(N62In_p2_Phi.*1i);
N62In_p3_Phi= angle(N62In_p3);
N62In_p3_Mag= abs(N62In_p3);

figure('name','Circuit Main, N62In round final','numbertitle','off');
subplot(2,1,1);
plot(x,N62In_p3_Mag,':r',x,N62InMag,'--g');
legend('N62In-p3-Mag','N62InMag');
subplot(2,1,2);
plot(x,N62In_p3_Phi,'-.k',x,N62InPhi,'--y');
legend('N62In-p3-Phi','N62InPhi');

% x73Out_p1 = TH*x71In ; eq16
x73Out_p1_Mag = TH1.*x71In_p1_Mag;
x73Out_p1_Phi = x71In_p1_Phi;

% x73Out_p2 = Right*x72in ; eq9
x73Out_p2_Mag = Right1.*x72In_p1_Mag;
x73Out_p2_Phi = x72In_p1_Phi;

% x73Out = % x73Out_p1 + x73Out_p2 ; eq24
x73Out_p3 = x73Out_p1_Mag.*exp(x73Out_p1_Phi.*1i) + x73Out_p2_Mag.*exp(x73Out_p2_Phi.*1i);
x73Out_p3_Phi= angle(x73Out_p3);
x73Out_p3_Mag= abs(x73Out_p3);

figure('name','Circuit Main, x73Out','numbertitle','off');
subplot(2,1,1);
plot(x,x73Out_p3_Mag,':r',x,x73OutMag,':g');
legend('x73Out-p3-Mag','x73OutMag');
subplot(2,1,2);
plot(x,x73Out_p3_Phi,':r',x,x73OutPhi,':g');
legend('x73Out-p3-Phi','x73OutPhi');

% x74Out_p1 = Left*x71In ; eq17
x74Out_p1_Mag = Left1.*x71In_p1_Mag;
x74Out_p1_Phi = x71In_p1_Phi;


% x74Out_p2 = TH*x72in ; eq11
x74Out_p2_Mag = TH1.*x72In_p1_Mag;
x74Out_p2_Phi = x72In_p1_Phi;

% x74Out = % x74Out_p1 + x74Out_p2 ; eq25
x74Out_p3 = x74Out_p1_Mag.*exp(x74Out_p1_Phi.*1i) + x74Out_p2_Mag.*exp(x74Out_p2_Phi.*1i);
x74Out_p3_Phi= angle(x74Out_p3);
x74Out_p3_Mag= abs(x74Out_p3);

figure('name','Circuit Main, x74Out','numbertitle','off');
subplot(2,1,1);
plot(x,x74Out_p3_Mag,':r',x,x74OutMag,'--g');
legend('x74Out-p3-Mag','x74OutMag');
subplot(2,1,2);
plot(x,x74Out_p3_Phi,':r',x,x74OutPhi,'--g');
legend('x74Out-p3-Phi','x74OutPhi');

% w3eout = WG(x73Out); eq 20
w3eOut_Mag = x73Out_p3_Mag;
w3eOut_Phi = fWG1_TH_PhiF + x73Out_p3_Phi;


figure('name','Circuit Main, w3eOut','numbertitle','off');
subplot(2,1,1);
plot(x,w3eOut_Mag,':r',x,w3eOutMag,'--g');
legend('w3eOut-Mag','w3eOutMag');
subplot(2,1,2);
plot(x,w3eOut_Phi,':r',x,w3eOutPhi,'--g');
legend('w3eOut-Phi','w3eOutPhi');

% w4nout = WG(x74Out); eq 21
w4nOut_Mag = x74Out_p3_Mag;
w4nOut_Phi = fWG1_TH_PhiF + x74Out_p3_Phi;


figure('name','Circuit Main, w4nOut','numbertitle','off');
subplot(2,1,1);
plot(x,w4nOut_Mag,':r',x,w4nOutMag,'--g');
legend('w4nOut-Mag','w4nOutMag');
subplot(2,1,2);
plot(x,w4nOut_Phi,':r',x,w4nOutPhi,'--g');
legend('w4nOut-Phi','w4nOutPhi');









%%%%%%%%%%%%%%%%%%%%%%%%% START x71OUT %%%%%%%%%%%%%%%%%%%%%%%%%%
% figure('name','Circuit Main, x71OUT','numbertitle','off');
% subplot(2,3,1);
% plot(x,x71Out_p_Er,':r',x,x71OutEr,'-g' );
% legend('Er x71Out Theory', 'Er x71Out Sim' );
% subplot(2,3,2);
% plot(x,x71Out_p_Ei,':r',x,x71OutEi,'-g' );
% legend('Ei x71Out Theory', 'Ei x71Out Sim' );
% 
% subplot(2,3,3);
% plot(x,x71Out_p1_E,':r',x,x71OutE,'-g' );
% legend('E x71Out P1T Theory', 'E x71Out Sim' );
% 
% subplot(2,3,4);
% plot(x,x71Out_p2_E,':r',x,x71OutE,'-g' );
% legend('E x71Out P2T Theory', 'E x71Out Sim' );
% 
% subplot(2,3,[5:6]);
% plot(x,x71Out_p_E,':r',x,x71OutE,'-g' );
% legend('E x71Out Theory', 'E x71Out Sim' );
%%%%%%%%%%%%%%%%%%%%%%%%% End x71OUT %%%%%%%%%%%%%%%%%%%%%%%%%%


% figure('name','Circuit Main, Waveguide 2 Rev','numbertitle','off');
% subplot(2,2,1);
% plot(x,N64OutPhi);
% legend('N64OutPhi' );
% subplot(2,2,3);
% plot(x,x72InPhi,x,fWG1_TH_PhiF+N64OutPhi,'-.b');
% legend('x72InPhi','theory');
% 
% subplot(2,2,2);
% plot(x,x72InPhi-N64OutPhi,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg2 R-dir fWG Mian, Sim','wg1 fWG Mian, Sim' );
% subplot(2,2,4);
% plot(x,N64OutMag,':r',x,x72InMag,'--g');
% legend('N64OutMag','x72InMag');

% subplot(3,2,[5,6]);
% plot(x,fWG1_TH_PhiF,':r', x,fWG3_TH_PhiF,'--g');
% legend('wg1 PHASE shift transer function','wg3 PHASE shift transer function');
% title('Circuit TH, wg1,wg3 PHASE shift transer function');




% 
% 
% %Build TRANSFER Functions
% fWG1_Mag = N63OutMag.*(x71InMag.^(-1));
% fWG1_PhiF = x71InPhi - N63OutPhi; 
% fWG1_PhiR = x71OutPhi - N63InPhi;
% 
% fWG2_PhiF = x72InPhi - N64OutPhi; 
% fWG2_PhiR = x72OutPhi - N64InPhi;
% 
% 
% 
% 
% figure('name','Circuit Main, Waveguide  Phase shifts','numbertitle','off');
% subplot(2,2,1);
% plot(x,N63OutPhi,':r',x,x71InPhi,'-.g',x,N63InPhi,'--b',x,x71OutPhi,':m');
% legend('N63OutPhi','x71InPhi','N63InPhi', 'x71OutPhi','Location','eastoutside');
% title('Circuit Main, wg1, phase shift');
% subplot(2,2,3);
% plot(x,fWG1_PhiF,':r',x,-fWG1_PhiR,'--g');
% legend('wg1 PHASE shift, Fw','wg1 PHASE shift, Rev');
% 
% subplot(2,2,2);
% plot(x,N64OutPhi,':r',x,x72InPhi,'-.g',x,N64InPhi,'--b',x,x72OutPhi,':m');
% legend('N64OutPhi','x72InPhi','N64InPhi', 'x72OutPhi','Location','eastoutside');
% title('Circuit Main, wg2, phase shift');
% subplot(2,2,4);
% plot(x,fWG2_PhiF,':r',x,-fWG2_PhiR,'--g');
% legend('wg2 PHASE shift, Fw','wg2 PHASE shift, Rev');
% 
% 
% % % Convert to Real/Imag
% % %  cir.
% % N61InEr= N61InMag.*cos(N61InPhi);
% % N61InEi= N61InMag.*sin(N61InPhi);
% % 
% % N62InEr= N62InMag.*cos(N62InPhi);
% % N62InEi= N62InMag.*sin(N62InPhi);
% % 
% % N63InEr= N63InMag.*cos(N63InPhi);
% % N63InEi= N63InMag.*sin(N63InPhi);
% % 
% % N64InEr= N64InMag.*cos(N64InPhi);
% % N64InEi= N64InMag.*sin(N64InPhi);
% % 
% % N61OutEr= N61OutMag.*cos(N61OutPhi);
% % N61OutEi= N61OutMag.*sin(N61OutPhi);
% % 
% % N62OutEr= N62OutMag.*cos(N62OutPhi);
% % N62OutEi= N62OutMag.*sin(N62OutPhi);
% % 
% % N63OutEr= N63OutMag.*cos(N63OutPhi);
% % N63OutEi= N63OutMag.*sin(N63OutPhi);
% % 
% % N64OutEr= N64OutMag.*cos(N64OutPhi);
% % N64OutEi= N64OutMag.*sin(N64OutPhi);
% % 
% % % Theo3: working with Mag/Phase and seperate transfer functions for Mag/Phase
% % % GOOD Match, accurate
% % 
% % N64InMag_1= Right1.*(fTH_TH_Mag.*N61InMag);
% % N64InPhi_1= fTH_TH_Phi+N61InPhi;
% % 
% % 
% % N64In_fDrop_Mag = fDrop_TH_Mag.*N64InMag;
% % N64In_fDrop_Phi = fDrop_TH_Phi+N64InPhi;
% % 
% % 
% % figure('name','Circuit main, Turn Right at Cross','numbertitle','off');
% % plot(x,N64InPhi,':r',x,N64InPhi_1,'--y');
% % legend('Sim','theo3','Location','eastoutside');
% % title('Circuit Right, phase shift, Turn Right at Cross');
% % 
% % %N63OutPhi - x71InPhi
% % figure('name','Circuit main, Phase shifts','numbertitle','off');
% % plot(x,N63OutPhi,':r',x,x71InPhi,'-.g',x,x72OutPhi,'--b');
% % legend('Sim N63OutPhi','x71inPhi','x72outPhi','Location','eastoutside');
% % title('Circuit Right, phase shift, Turn Right at Cross');
% % 
% % 
% % figure('name','Circuit TH, Main, Transfer functions','numbertitle','off');
% % subplot(2,1,1);
% % plot(x,fWG1_PhiF,':r', x,fWG1_PhiR,'--g', x,fWG1_PhiF+fWG1_PhiR, '-.b' );
% % legend('WG1 Phase F', 'WG1 Phase R','diff','Location','eastoutside');
% % title('Waveguide1, Main circuit, Transfer functions, Phase');
% % 
% % subplot(2,1,2);
% % plot(x,fWG1_TH_PhiF,':r', x,fWG1_TH_PhiR,'--g', x,fWG1_TH_PhiF+fWG1_TH_PhiR, '-.b' );
% % legend('WG1 Phase F', 'WG1 Phase R','diff','Location','eastoutside');
% % title('Waveguide1, TH circuit, Transfer functions, Phase');
% % 
% % % subplot(3,2,3);
% % % plot(x,fWG2_PhiF,':r', x,fWG2_PhiR,'--g', x,fWG2_PhiF+fWG2_PhiR, '-.b' );
% % % legend('WG2 Phase F', 'WG2 Phase R','diff','Location','eastoutside');
% % % title('Waveguide2, Transfer functions, Mag');
% % % 
% % % subplot(3,2,4);
% % % 
% % % subplot(3,2,5);
% % % plot(x,fWG1_PhiF,':r', x,fWG2_PhiF,'--g');
% % % legend('WG1 Phase F','WG1 Phase F','Location','eastoutside');
% % % title('Waveguide2,Waveguide1, Transfer functions compare, Mag');
% % % 
% % % subplot(3,2,6);
% % 
% % % Convert to Real/Imag
% % N64In_fDrop_Er= N64In_fDrop_Mag.*cos(N64In_fDrop_Phi);
% % N64In_fDrop_Ei= N64In_fDrop_Mag.*sin(N64In_fDrop_Phi);
% % % Add up
% % N63OutEr_theo3= N63OutTHEr + N64In_fDrop_Er;
% % N63OutEi_theo3= N63OutTHEi + N64In_fDrop_Ei;
% % N63Out_theo3 = sqrt(N63OutEr_theo3.^2 + N63OutEi_theo3.^2);
% % 
% % 
% % % figure('name','Circuit main, Th(Out dir.)','numbertitle','off');
% % % plot(x,N63OutRight,':r',x,N63OutRight_theo3,'--y');
% % % legend('Sim','theo3','Location','eastoutside');
% % % title('Circuit Right, Th(Out dir.)');
% % 
