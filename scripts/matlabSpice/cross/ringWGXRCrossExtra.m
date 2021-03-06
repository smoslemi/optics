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
Left1= 0.4;

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





% Right circuit
N61InRight=10.^(outputFileRight(:,2)./20);
N62InRight=10.^(outputFileRight(:,3)./20);
N63InRight=10.^(outputFileRight(:,4)./20);
N64InRight=10.^(outputFileRight(:,5)./20);
N61OutRight=10.^(outputFileRight(:,6)./20);
N62OutRight=10.^(outputFileRight(:,7)./20);
N63OutRight=10.^(outputFileRight(:,8)./20);
N64OutRight=10.^(outputFileRight(:,9)./20);
x71InRight=10.^(outputFileRight(:,10)./20);
x72InRight=10.^(outputFileRight(:,11)./20);
x73InRight=10.^(outputFileRight(:,12)./20);
x74InRight=10.^(outputFileRight(:,13)./20);
x71OutRight=10.^(outputFileRight(:,14)./20);
x72OutRight=10.^(outputFileRight(:,15)./20);
x73OutRight=10.^(outputFileRight(:,16)./20);
x74OutRight=10.^(outputFileRight(:,17)./20);
w3eInRight=10.^(outputFileRight(:,18)./20);
w4nInRight=10.^(outputFileRight(:,19)./20);
w3eOutRight=10.^(outputFileRight(:,20)./20);
w4nOutRight=10.^(outputFileRight(:,21)./20);


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


% % Build Transfer functions
% fWG1_Right_Mag = N63OutRightMag.*(x71InRightMag.^(-1));
% fWG1_Right_PhiF = x71InRightPhi - N63OutRightPhi;  
% fWG1_Right_PhiR = x71OutRightPhi - N63InRightPhi; 
% 
% fWG2_Right_PhiF = x72InRightPhi - N64OutRightPhi; 
% fWG2_Right_PhiR = x72OutRightPhi - N64InRightPhi;


% Mag and Phase factors of waveguide transfer function
fWG1_Right_Mag = N63OutRightMag.*(x71InRightMag.^(-1)); 
fWG1_Right_PhiF = x71InRightPhi - N63OutRightPhi;  
fWG1_Right_PhiR = x71OutRightPhi - N63InRightPhi;
fWG3_Right_PhiF = w3eOutRightPhi- x73OutRightPhi;



figure('name','Circuit Right, Waveguide1,3 Phase shifts','numbertitle','off');
subplot(3,1,1);
plot(x,N63OutRightPhi,':r',x,x71InRightPhi,'-.g',x,N63InRightPhi,'--b',x,x71OutRightPhi,':m');
legend('N63OutRightPhi','x71InRightPhi','N63InRightPhi', 'x71OutRightPhi','Location','eastoutside');
title('Circuit Right, wg1, phase shifts');
subplot(3,1,2);
plot(x,x73OutRightPhi,':r',x,w3eOutRightPhi,'-.g',x,x73InRightPhi,'--b',x,w3eInRightPhi,':m');
legend('x73OutRightPhi','w3eInRightPhi','x73InRightPhi', 'w3eOutRightPhi','Location','eastoutside');
title('Circuit Right, wg3, phase shifts');
subplot(3,1,3);
plot(x,fWG1_Right_PhiF,':r', x,fWG3_Right_PhiF,'--g');
legend('wg1 PHASE shift transer function','wg3 PHASE shift transer function');
title('Circuit Right, wg1,wg3 PHASE shift transer function');

x73OutRightPhi_theo = N63OutRightPhi + fWG1_TH_PhiF;
w3eOutRightPhi-(fWG1_TH_PhiF+x73OutRightPhi_theo);

figure('name','Circuit TH vs Right, Waveguides Phase shifts','numbertitle','off');
%plot(x,fWG1_TH_PhiF+x73OutRightPhi,':r',x,w3eOutRightPhi,'--g');
plot(x,fWG1_TH_PhiF,':r',x, fWG1_Right_PhiF,'--g',x,fWG1_TH_PhiF+x73OutRightPhi_theo,'-.k',x,w3eOutRightPhi,':b',x,w3eOutRightPhi-(fWG1_TH_PhiF+x73OutRightPhi_theo),'--y');
legend(',fWG1-TH-PhiF','fWG1-Right-PhiF', 'theo out', 'sim out','diff');

figure('name','WG Cross phase shifts','numbertitle','off');
subplot(4,3,1)
plot(x,N63OutRightPhi,':r',x,x71InRightPhi,'--g',x,x71OutRightPhi,'-.b');
legend('N63OutRightPhi','x71InRightPhi','x71OutRightPhi');
subplot(4,3,2)
plot(x,N63OutRightMag,':r',x,x71InRightMag,'--g',x,x71OutRightMag,'-.b');
legend('N63OutRightMag','x71InRightMag','x71OutRightMag');
subplot(4,3,3)
plot(x,x71InRightPhi,':r',x,x73OutRightPhi,'--g',x,x73InRightPhi,'-.b');
legend('x71InRightPhi','x73OutRightPhi','x73InRightPhi');
subplot(4,3,4)
plot(x,x71InRightMag,':r',x,x73OutRightMag,'--g',x,x73InRightMag,'-.b');
legend('x71InRightMag','x73OutRightMag','x73InRightMag');
subplot(4,3,5)
plot(x,x73OutRightPhi,':r',x,w3eOutRightPhi,'--g',x,w3eInRightPhi,'-.b');
legend('x73OutRightPhi','w3eOutRightPhi','w3eInRightPhi');
subplot(4,3,6)
plot(x,x73OutRightMag,':r',x,w3eOutRightMag,'--g',x,w3eInRightMag,'-.b');
legend('x73OutRightMag','w3eOutRightMag','w3eInRightMag');
subplot(4,3,7);
plot(x,N63OutRight,':r',x,x71InRight,'--g',x,x73OutRight,'-.b');
legend('N63OutRight','x71InRight','x73OutRight');
subplot(4,3,8);
plot(x,N63OutTH,':r',x,x71InTH,'--g',x,x73OutTH,'-.b');
legend('N63OutTH','x71InTH','x73OutTH');
subplot(4,3,9)
plot(x,N63OutTHPhi,':r',x,x71InTHPhi,'--g',x,x71OutTHPhi,'-.b');
legend('N63OutTHPhi','x71InTHPhi','x71OutTHPhi');
subplot(4,3,10)
plot(x,N63OutTHMag,':r',x,x71InTHMag,'--g',x,x71OutTHMag,'-.b');
legend('N63OutTHMag','x71InTHMag','x71OutTHMag');
subplot(4,3,11)
plot(x,x71InTHPhi,':r',x,x73OutTHPhi,'--g',x,x73InTHPhi,'-.b');
legend('x71InTHPhi','x73OutTHPhi','x73InTHPhi');
subplot(4,3,12)
plot(x,x71InTHMag,':r',x,x73OutTHMag,'--g',x,x73InTHMag,'-.b');
legend('x71InTHMag','x73OutTHMag','x73InTHMag');



% figure('name','Circuit Right, Waveguide  Phase shifts','numbertitle','off');
% subplot(2,2,1);
% plot(x,N63OutRightPhi,':r',x,x71InRightPhi,'-.g',x,N63InRightPhi,'--b',x,x71OutRightPhi,':m');
% legend('N63OutRightPhi','x71InRightPhi','N63InRightPhi', 'x71OutRightPhi','Location','eastoutside');
% title('Circuit Right, wg1, phase shift');
% subplot(2,2,3);
% plot(x,fWG1_Right_PhiF,':r',x,-fWG1_Right_PhiR,'--g');
% legend('wg1 PHASE shift, Fw','wg1 PHASE shift, Rev');
% 
% subplot(2,2,2);
% plot(x,N64OutRightPhi,':r',x,x72InRightPhi,'-.g',x,N64InRightPhi,'--b',x,x72OutRightPhi,':m');
% legend('N64OutRightPhi','x72InRightPhi','N64InRightPhi', 'x72OutRightPhi','Location','eastoutside');
% title('Circuit Right, wg2, phase shift');
% subplot(2,2,4);
% plot(x,fWG2_Right_PhiF,':r',x,-fWG2_Right_PhiR,'--g');
% legend('wg2 PHASE shift, Fw','wg2 PHASE shift, Rev');



% % Convert to Real/Imag
% % Right cir.
% N62InRightEr= N62InRightMag.*cos(N62InRightPhi);
% N62InRightEi= N62InRightMag.*sin(N62InRightPhi);
% 
% N64InRightEr= N64InRightMag.*cos(N64InRightPhi);
% N64InRightEi= N64InRightMag.*sin(N64InRightPhi);
% 
% N63OutRightEr= N63OutRightMag.*cos(N63OutRightPhi);
% N63OutRightEi= N63OutRightMag.*sin(N63OutRightPhi);
% 
% 
% 
% % Expected 1
% % N64InRight will have 2 components.
%  % 1- Out of resonase signals will go through the wg and appear at N62In (N64InRight_fTH)
%  % 2- Resonase signals will go through the ring (the Drop filter) and show up at N63Out (N64InRight_fDrop)
% 
%  
% % ====> % Calculation components of N62IN = 
%             % (1) Drop of Ring with N61In as input (N62InTH) + 
%             % (2) Th of Ring with N64In as input (N64InRight_fTH)
% 
% % Theo1: Not cosidering phase shift, just working with powers transfer function of (fTH_TH)
% N64InRight_fTH= fTH_TH.* N64InRight; %Th of Ring 6 with N64In as input
% N62InRight_theo1= N62InTH + N64InRight_fTH; 
% 
% % Theo2: Working with transfer function of power (fTH_TH) and Real/Imag
% % Still not accurate enough
% N62InRightEr_theo2= N62InTHEr + fTH_TH.*N64InRightEr;
% N62InRightEi_theo2= N62InTHEi + fTH_TH.*N64InRightEi;
% N62InRight_theo2 = sqrt(N62InRightEr_theo2.^2 + N62InRightEi_theo2.^2);
% 
% %N62InRightEr_theo2= N62InTHEr + (fTH_TH.^0.5).*N64InRightEr;
% %N62InRightEi_theo2= N62InTHEi + (fTH_TH.^0.5).*N64InRightEi;
% %N62InRight_theo2 = sqrt(N62InRightEr_theo3.^2 + N62InRightEi_theo3.^2);
% 
% % Theo3: working with Mag/Phase and seperate transfer functions for Mag/Phase
% % GOOD Match, accurate
% N64InRight_fTH_Mag = fTH_TH_Mag.*N64InRightMag;
% N64InRight_fTH_Phi = fTH_TH_Phi+N64InRightPhi;
%  % Convert to Real/Imag
% N64InRight_fTH_Er= N64InRight_fTH_Mag.*cos(N64InRight_fTH_Phi);
% N64InRight_fTH_Ei= N64InRight_fTH_Mag.*sin(N64InRight_fTH_Phi);
% % Add up
% N62InRightEr_theo3= N62InTHEr + N64InRight_fTH_Er;
% N62InRightEi_theo3= N62InTHEi + N64InRight_fTH_Ei;
% N62InRight_theo3 = sqrt(N62InRightEr_theo3.^2 + N62InRightEi_theo3.^2);
% 
% 
% 
% % ====> % Calculation components of N63Out= 
%             % (1) Th of Ring with N61In as input (N62InTH) + 
%             % (2) Drop of Ring with N64In as input N64InRight_fDrop
% % Theo1: Not cosidering phase shift, just working with powers.
% N64InRight_fDrop= fDrop_TH.* N64InRight; %Dro of Ring 6 with N64In as input
% N63OutRight_theo1= N63OutTH + N64InRight_fDrop; 
% 
% % Theo2: Working with transfer function of power (fDrop_TH) and Real/Imag
% % Still not accurate enough
% N63OutRightEr_theo2= N63OutTHEr + fDrop_TH.*N64InRightEr;
% N63OutRightEi_theo2= N63OutTHEi + fDrop_TH.*N64InRightEi;
% N63OutRight_theo2 = sqrt(N63OutRightEr_theo2.^2 + N63OutRightEi_theo2.^2);
% 
% % Theo3: working with Mag/Phase and seperate transfer functions for Mag/Phase
% % GOOD Match, accurate
% N64InRight_fDrop_Mag = fDrop_TH_Mag.*N64InRightMag;
% N64InRight_fDrop_Phi = fDrop_TH_Phi+N64InRightPhi;
% 
% % Convert to Real/Imag
% N64InRight_fDrop_Er= N64InRight_fDrop_Mag.*cos(N64InRight_fDrop_Phi);
% N64InRight_fDrop_Ei= N64InRight_fDrop_Mag.*sin(N64InRight_fDrop_Phi);
% % Add up
% N63OutRightEr_theo3= N63OutTHEr + N64InRight_fDrop_Er;
% N63OutRightEi_theo3= N63OutTHEi + N64InRight_fDrop_Ei;
% N63OutRight_theo3 = sqrt(N63OutRightEr_theo3.^2 + N63OutRightEi_theo3.^2);
% 
% 
% % Expected
% N1Right=N61InRight;
% N2Right=N62InRight_theo3;
% N3Right=TH3.*N63OutRight_theo3;
% N4Right= 0;
% 
% % % Plot of Right cir.
% % figure('name','Circuit Right, 4 ports','numbertitle','off');
% % subplot(2,2,1);
% % plot(x,N61InRight,':r',x,N1Right,'--g');
% % legend('Sim','Theory','Location','eastoutside');
% % title('Circuit Right, 4 ports, N61In');
% % subplot(2,2,2);
% % plot(x,N62InRight,':r',x,N2Right,'--g',x,N62InRight_theo1,'-.b');
% % legend('Sim','Theory', 'Thoery without Phase shift','Location','eastoutside');
% % title('Circuit Right, 4 ports, N62In');
% % subplot(2,2,3);
% % plot(x,w3eOutRight,':r',x,N3Right,'--g',x,N63OutRight_theo1,'-.b');
% % legend('Sim','Theory', 'Thoery without Phase shift','Location','eastoutside');
% % title('Circuit Right, 4 ports, w3eOut');
% % subplot(2,2,4);
% % plot(x,w4nOutRight,':r',x,N4Right,'--g');
% % legend('Sim','Theory','Location','eastoutside');
% % title('Circuit Right, 4 ports, w4nOut');
% % 
% % 
% % figure('name','Circuit Right, Drop(In dir.)','numbertitle','off');
% % plot(x,N62InRight,':r',x,N62InRight_theo1,':g',x,N62InRight_theo2,'-.b',x,N62InRight_theo3,'--y');
% % legend('Sim','theo1','theo2','theo3','Location','eastoutside');
% % title('Circuit Right, Drop(In dir.)');
% % 
% % figure('name','Circuit Right, Th(Out dir.)','numbertitle','off');
% % plot(x,N63OutRight,':r',x,N63OutRight_theo1,':g',x,N63OutRight_theo2,'-.b',x,N63OutRight_theo3,'--y');
% % legend('Sim','theo1','theo2','theo3','Location','eastoutside');
% % title('Circuit Right, Th(Out dir.)');
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % main circuit
% N61In=10.^(outputFile(:,2)./20);
% N62In=10.^(outputFile(:,3)./20);
% N63In=10.^(outputFile(:,4)./20);
% N64In=10.^(outputFile(:,5)./20);
% N61Out=10.^(outputFile(:,6)./20);
% N62Out=10.^(outputFile(:,7)./20);
% N63Out=10.^(outputFile(:,8)./20);
% N64Out=10.^(outputFile(:,9)./20);
% w3eOut=10.^(outputFile(:,20)./20);
% w4nOut=10.^(outputFile(:,21)./20);
% 
% 
% % Mag and Phi from dataSet
% N61InMag=outputFile(:,22);
% N61InPhi=outputFile(:,23);
% N62InMag=outputFile(:,24);
% N62InPhi=outputFile(:,25);
% N63InMag=outputFile(:,26);
% N63InPhi=outputFile(:,27);
% N64InMag=outputFile(:,28);
% N64InPhi=outputFile(:,29);
% N61OutMag=outputFile(:,30);
% N61OutPhi=outputFile(:,31);
% N62OutMag=outputFile(:,32);
% N62OutPhi=outputFile(:,33);
% N63OutMag=outputFile(:,34);
% N63OutPhi=outputFile(:,35);
% N64OutMag=outputFile(:,36);
% N64OutPhi=outputFile(:,37);
% 
% x71InMag=outputFile(:,38);
% x71InPhi=outputFile(:,39);
% x72InMag=outputFile(:,40);
% x72InPhi=outputFile(:,41);
% x73InMag=outputFile(:,42);
% x73InPhi=outputFile(:,43);
% x74InMag=outputFile(:,44);
% x74InPhi=outputFile(:,45);
% x71OutMag=outputFile(:,46);
% x71OutPhi=outputFile(:,47);
% x72OutMag=outputFile(:,48);
% x72OutPhi=outputFile(:,49);
% x73OutMag=outputFile(:,50);
% x73OutPhi=outputFile(:,51);
% x74OutMag=outputFile(:,52);
% x74OutPhi=outputFile(:,53);
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
