set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= 'ringWGXR2CrossLittle';
outputFile =load('ringWGXRCrossLittle.1-DC.2d_dat');
Ref1=0.1;
TH1=0.9;
Right1= 0.1;
Left1= 0.1;

;basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/cross/';




x=outputFile(:,1);

% main circuit
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


% db vlues
N61InDB=outputFile(:,2);
N62InDB=outputFile(:,3);
N63InDB=outputFile(:,4);
N64InDB=outputFile(:,5);
N61OutDB=outputFile(:,6);
N62OutDB=outputFile(:,7);
N63OutDB=outputFile(:,8);
N64OutDB=outputFile(:,9);
x71InDB=outputFile(:,10);
x72InDB=outputFile(:,11);
x73InDB=outputFile(:,12);
x74InDB=outputFile(:,13);
x71OutDB=outputFile(:,14);
x72OutDB=outputFile(:,15);
x73OutDB=outputFile(:,16);
x74OutDB=outputFile(:,17);
w3eInDB=outputFile(:,18);
w4nInDB=outputFile(:,19);
w3eOutDB=outputFile(:,20);
w4nOutDB=outputFile(:,21);


figure('name','Circuit Main DB values, Ring','numbertitle','off');
subplot(4,2,1);
plot(x,N61InDB);
legend('N61InDB');
subplot(4,2,3);
plot(x,N62InDB);
legend('N62InDB');
subplot(4,2,5);
plot(x,N63InDB);
legend('N63InDB');
subplot(4,2,7);
plot(x,N63InDB);
legend('N64InDB');

subplot(4,2,2);
plot(x,N61OutDB);
legend('N61OutDB');
subplot(4,2,4);
plot(x,N62OutDB);
legend('N62OutDB');
subplot(4,2,6);
plot(x,N63OutDB);
legend('N63OutDB');
subplot(4,2,8);
plot(x,N63OutDB);
legend('N64OutDB');


figure('name','Circuit Main DB values, WG and CROSS','numbertitle','off');
subplot(4,2,1);
plot(x,x71InDB);
legend('x71InDB');
subplot(4,2,3);
plot(x,x72InDB);
legend('x72InDB');
subplot(4,2,5);
plot(x,x73InDB);
legend('x73InDB');
subplot(4,2,7);
plot(x,x74InDB);
legend('x74InDB');

subplot(4,2,2);
plot(x,x71OutDB);
legend('x71OutDB');
subplot(4,2,4);
plot(x,x72OutDB);
legend('x72OutDB');
subplot(4,2,6);
plot(x,x73OutDB);
legend('x73OutDB');
subplot(4,2,8);
plot(x,x74OutDB);
legend('x74OutDB');


figure('name','Circuit Main DB values, Ring Drop and cross Outs','numbertitle','off');
%subplot(4,2,3);
plot(x,N62InDB,x,x73OutDB,x,x74OutDB);
legend('N62InDB','x73OutDB','x74OutDB');



% 
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
% w3eInMag=outputFile(:,54);
% w3eInPhi=outputFile(:,55);
% w4nInMag=outputFile(:,56);
% w4nInPhi=outputFile(:,57);
% w3eOutMag=outputFile(:,58);
% w3eOutPhi=outputFile(:,59);
% w4nOutMag=outputFile(:,60);
% w4nOutPhi=outputFile(:,61);
% 
% 
% % Real Imag
% N64OutEr =N64OutMag.*cos(N64OutPhi);
% N64OutEi =N64OutMag.*sin(N64OutPhi);
% N64OutE = sqrt(N64OutEr.^2 + N64OutEi.^2 );
% 
% x71OutEr =x71OutMag.*cos(x71OutPhi);
% x71OutEi =x71OutMag.*sin(x71OutPhi);
% x71OutE = sqrt(x71OutEr.^2 + x71OutEi.^2 );
% 
% figure('name','Circuit Main, Waveguide1,3 Phase shifts','numbertitle','off');
% subplot(4,4,1);
% plot(x,N63OutPhi,':r',x,x71InPhi,'-.g');
% legend('N63OutPhi','x71InPhi','Location','eastoutside');
% title('Circuit Main, wg1 F-dir, phase shifts');
% subplot(4,4,2);
% plot(x,N63InPhi,':r',x,x71OutPhi,'--g');
% legend('N63InPhi','x71OutPhi','Location','eastoutside');
% title('Circuit Main, wg1 R-dir phase shifts');
% subplot(4,4,3);
% temp = x71InPhi-N63OutPhi;
% PosVal= temp >0 ;
% temp(PosVal) = -2*pi - temp(PosVal) ;
% plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg1 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');
% subplot(4,4,4);
% temp = N63InPhi-x71OutPhi;
% PosVal= temp >0 ;
% temp(PosVal) = -2*pi - temp(PosVal) ;
% plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg1 R-Dir fWG Mian, Sim','wg1 R-dir fWG TH');
% 
% subplot(4,4,5);
% plot(x,N64InPhi,':r',x,x72OutPhi,'-.g');
% legend('N64InPhi','x72OutPhi','Location','eastoutside');
% title('Circuit Main, wg2 f-dir, phase shifts');
% subplot(4,4,6);
% plot(x,N64OutPhi,':r',x,x72InPhi,'--g');
% legend('N64OutPhi', 'x72InPhi','Location','eastoutside');
% title('Circuit Main, wg2 R-dir, phase shifts');
% subplot(4,4,7);
% temp = N64InPhi-x72OutPhi;
% PosVal= temp >0 ;
% temp(PosVal) = -2*pi - temp(PosVal) ;
% plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg2 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');
% subplot(4,4,8);
% temp = x72InPhi-N64OutPhi;
% PosVal= temp >0 ;
% temp(PosVal) = -2*pi + temp(PosVal) ;
% plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg2 R-dir fWG Mian, Sim','wg1 R-dir fWG TH');
% 
% 
% subplot(4,4,9);
% plot(x,x73OutPhi,':r',x,w3eOutPhi,'-.g');
% legend('x73OutPhi','w3eInPhi','Location','eastoutside');
% title('Circuit Main, wg3 f-dir, phase shifts');
% subplot(4,4,10);
% plot(x,x73InPhi,':r',x,w3eInPhi,'--g');
% legend('x73InPhi', 'w3eOutPhi','Location','eastoutside');
% title('Circuit Main, wg3 R-dir, phase shifts');
% subplot(4,4,[11:12]);
% temp = w3eOutPhi-x73OutPhi;
% PosVal= temp >0 ;
% temp(PosVal) = -2*pi - temp(PosVal) ;
% plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg3 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');
% 
% subplot(4,4,13);
% plot(x,w4nOutPhi,':r',x,x74OutPhi,'-.g');
% legend('w4nOutPhi','x74OutPhi','Location','eastoutside');
% title('Circuit Main, wg4 f-dir, phase shifts');
% subplot(4,4,14);
% plot(x,w4nInPhi,':r',x,x74InPhi,'--g');
% legend('w4nInPhi', 'x74InPhi','Location','eastoutside');
% title('Circuit Main, wg4 R-dir, phase shifts');
% subplot(4,4,[15:16]);
% temp = w4nOutPhi-x74OutPhi;
% PosVal= temp >0 ;
% temp(PosVal) = -2*pi - temp(PosVal) ;
% plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg4 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');
% 
% 
% 
% 
% % Expected
% 
% % N63Out_p1 = TH(N61In); eq2
% N63Out_p1_Mag = fTH_TH_Mag.*N61InMag;
% N63Out_p1_Phi = fTH_TH_Phi+N61InPhi;
% 
% figure('name','Circuit Main, N63Out round 1','numbertitle','off');
% subplot(2,1,1);
% plot(x,N63Out_p1_Mag,':r',x,N63OutMag,'--g');
% legend('N63Out-p1-Mag','N63OutMag');
% subplot(2,1,2);
% plot(x,N63Out_p1_Phi,':r',x,N63OutPhi,'--g');
% legend('N63Out-p1-Phi','N63OutPhi');
% 
% % x71In_p1 = WG(N63out); eq3
% x71In_p1_Mag = N63Out_p1_Mag;
% x71In_p1_Phi = fWG1_TH_PhiF+N63Out_p1_Phi;
% figure('name','Circuit Main, x71In Ph','numbertitle','off');
% subplot(2,1,1)
% plot(x,x71In_p1_Mag,':r',x,x71InMag,'--g');
% legend('x71In-p1-Mag','x71InMag');
% subplot(2,1,2)
% plot(x,x71In_p1_Phi,':r',x,x71InPhi,'--g');
% legend('x71In-p1-Phi','x71InPhi');
% 
% % x71Out_p1 = Ref(x71In_p1); eq4
% x71Out_p1_Mag = Ref1.*x71In_p1_Mag;
% x71Out_p1_Phi = x71In_p1_Phi;
% figure('name','Circuit Main, x71Out round 1','numbertitle','off');
% subplot(2,1,1);
% plot(x,x71Out_p1_Mag,':r',x,x71OutMag,'--g');
% legend('x71Out-p1-Mag','x71OutMag');
% subplot(2,1,2);
% plot(x,x71Out_p1_Phi,':r',x,x71OutPhi,'--g');
% legend('x71Out-p1-Phi','x71OutPhi');
% 
% 
% % N63In_p1 = WG(x71Out_p1); eq5
% N63In_p1_Mag = x71Out_p1_Mag;
% N63In_p1_Phi = fTH_TH_Phi+x71Out_p1_Phi;
% figure('name','Circuit Main, N63In round 1','numbertitle','off');
% subplot(2,1,1);
% plot(x,N63In_p1_Mag,':r',x,N63InMag,'--g');
% legend('N63In-p1-Mag','N63InMag');
% subplot(2,1,2);
% plot(x,N63In_p1_Phi,':r',x,N63InPhi,'--g');
% legend('N63In-p1-Phi','N63InPhi');
% 
% 
% % N64Out_p1 = Drop(N63In); eq7
% N64Out_p1_Mag = fDrop_TH_Mag.*N63InMag;
% N64Out_p1_Phi = fDrop_TH_Phi+N63InPhi;
% figure('name','Circuit Main, N64Out ','numbertitle','off');
% subplot(2,1,1);
% plot(x,N64Out_p1_Mag,':r',x,N64OutMag,'--g');
% legend('N64Out-p1-Mag','N64OutMag');
% subplot(2,1,2);
% plot(x,N64Out_p1_Phi,':r',x,N64OutPhi,'--g');
% legend('N64Out-p1-Phi','N64OutPhi');
% 
% % x72In_p1 = WG(N64out); eq8
% x72In_p1_Mag = N64Out_p1_Mag;
% x72In_p1_Phi = fWG1_TH_PhiF+N64Out_p1_Phi;
% figure('name','Circuit Main, x72In Phase round 1','numbertitle','off');
% plot(x,x72In_p1_Phi,':r',x,x72InPhi,'--g');
% legend('x72In-p1-Phi','x72InPhi');
% 
% % x71Out_p2 = Left(x72In_p1); eq10
% x71Out_p2_Mag = Left1.*x72In_p1_Mag;
% x71Out_p2_Phi = x72In_p1_Phi;
% 
% % x71Out_p3 = % x71Out_p1 + x71Out_p2; eq22 
% 
% x71Out_p3= x71Out_p1_Mag.*exp(x71Out_p1_Phi.*1i) + x71Out_p2_Mag.*exp(x71Out_p2_Phi.*1i);
% 
% x71Out_p3_Phi= angle(x71Out_p3);
% x71Out_p3_Mag= abs(x71Out_p3);
% 
% figure('name','Circuit Main, x71Out (p3) Phase round 2','numbertitle','off');
% subplot(2,1,1);
% plot(x,x71Out_p3_Mag,':r',x,x71OutMag,'--g');
% legend('x71Out-p3-Mag','x71OutMag');
% subplot(2,1,2);
% plot(x,x71Out_p3_Phi,':r',x,x71OutPhi,'--g');
% legend('x71Out-p3-Phi','x71OutPhi');
% 
% 
% % N63In = WG(x71Out) ; eq5 eq21
% N63In_p2_Mag = x71Out_p3_Mag;
% N63In_p2_Phi = fWG1_TH_PhiF+x71Out_p3_Phi;
% 
% %%%%%%%%%%%%%%%%%%%%%%%%% START N63In %%%%%%%%%%%%%%%%%%%%%%%%%%
% figure('name','Circuit Main, N63In','numbertitle','off');
% subplot(2,1,1);
% plot(x,N63In_p2_Mag,':r',x,N63InMag,'--g');
% legend('N63In-p2-Mag','N63InMag');
% subplot(2,1,2);
% plot(x,N63In_p2_Phi,':r',x,N63InPhi,'--g');
% legend('N63In-p2-Phi','N63InPhi');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%% End N63In %%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % N6IOut = TH(N63In); eq6
% N61Out_p1_Mag = fTH_TH_Mag.*N63In_p2_Mag;
% N61Out_p1_Phi = fTH_TH_Phi+N63In_p2_Phi;
% 
% figure('name','Circuit Main, N61Out','numbertitle','off');
% subplot(2,1,1);
% plot(x,N61Out_p1_Mag,':r',x,N61OutMag,'--g');
% legend('N61Out-p1-Mag','N61OutMag');
% subplot(2,1,2);
% plot(x,N61Out_p1_Phi,':r',x,N61OutPhi,'--g');
% legend('N61Out-p1-Phi','N61OutPhi');
% 
% % x72Out_p1 = Right*x71In_p ; eq12
% x72Out_p1_Mag = Right1.*x71In_p1_Mag;
% x72Out_p1_Phi = x71In_p1_Phi;
% 
% %N64In_p = WG(x72Out-p1) ;eq 13
% N64In_p1_Mag = x72Out_p1_Mag;
% N64In_p1_Phi = fWG1_TH_PhiF+x72Out_p1_Phi;
% 
% figure('name','Circuit Main, N64In','numbertitle','off');
% subplot(2,1,1);
% plot(x,N64In_p1_Mag,':r',x,N64InMag,'--g');
% legend('N64In_p_Mag','N64InMag');
% subplot(2,1,2);
% plot(x,N64In_p1_Phi,':r',x,N64InPhi,'--g');
% legend('N64In-p-Phi','N64InPhi');
% 
% 
% % N63Out_p2 = Drop(N64In); eq15
% N63Out_p2_Mag = fDrop_TH_Mag.*N64In_p1_Mag;
% N63Out_p2_Phi = fDrop_TH_Phi+N64In_p1_Phi;
% 
% % N63Out_p3 = N63Out_p1 + N63Out_p2 ;eq27
% N63Out_p3 = N63Out_p1_Mag.*exp(N63Out_p1_Phi.*1i) + N63Out_p2_Mag.*exp(N63Out_p2_Phi.*1i);
% N63Out_p3_Phi= angle(N63Out_p3);
% N63Out_p3_Mag= abs(N63Out_p3);
% 
% figure('name','Circuit Main, N63Out','numbertitle','off');
% subplot(2,1,1);
% plot(x,N63Out_p3_Mag,':r',x,N63OutMag,'--g');
% legend('N64In_p_Mag','N63OutMag');
% subplot(2,1,2);
% plot(x,N63Out_p3_Phi,':r',x,N63OutPhi,'--g');
% legend('N63Out-p3-Phi','N63OutPhi');
% 
% % N62In_p1 = fDrop(N61In); eq 18
% N62In_p1_Mag = fDrop_TH_Mag.*N61InMag;
% N62In_p1_Phi = fDrop_TH_Phi+N61InPhi;
% 
% % N62In_p2 = fTH(N64In_p); eq 14
% N62In_p2_Mag = fTH_TH_Mag.*N64In_p1_Mag;
% N62In_p2_Phi = fTH_TH_Phi+N64In_p1_Phi;
% 
% % N62In_p3 = N62In_p1 + N62In_p2 ;eq26
% N62In_p3 = N62In_p1_Mag.*exp(N62In_p1_Phi.*1i) + N62In_p2_Mag.*exp(N62In_p2_Phi.*1i);
% N62In_p3_Phi= angle(N62In_p3);
% N62In_p3_Mag= abs(N62In_p3);
% 
% figure('name','Circuit Main, N62In round final','numbertitle','off');
% subplot(2,1,1);
% plot(x,N62In_p3_Mag,':r',x,N62InMag,'--g');
% legend('N62In-p3-Mag','N62InMag');
% subplot(2,1,2);
% plot(x,N62In_p3_Phi,'-.k',x,N62InPhi,'--y');
% legend('N62In-p3-Phi','N62InPhi');
% 
% % x73Out_p1 = TH*x71In ; eq16
% x73Out_p1_Mag = TH1.*x71In_p1_Mag;
% x73Out_p1_Phi = x71In_p1_Phi;
% 
% % x73Out_p2 = Right*x72in ; eq9
% x73Out_p2_Mag = Right1.*x72In_p1_Mag;
% x73Out_p2_Phi = x72In_p1_Phi;
% 
% % x73Out = % x73Out_p1 + x73Out_p2 ; eq24
% x73Out_p3 = x73Out_p1_Mag.*exp(x73Out_p1_Phi.*1i) + x73Out_p2_Mag.*exp(x73Out_p2_Phi.*1i);
% x73Out_p3_Phi= angle(x73Out_p3);
% x73Out_p3_Mag= abs(x73Out_p3);
% 
% figure('name','Circuit Main, x73Out','numbertitle','off');
% subplot(2,1,1);
% plot(x,x73Out_p3_Mag,':r',x,x73OutMag,':g');
% legend('x73Out-p3-Mag','x73OutMag');
% subplot(2,1,2);
% plot(x,x73Out_p3_Phi,':r',x,x73OutPhi,':g');
% legend('x73Out-p3-Phi','x73OutPhi');
% 
% % x74Out_p1 = Left*x71In ; eq17
% x74Out_p1_Mag = Left1.*x71In_p1_Mag;
% x74Out_p1_Phi = x71In_p1_Phi;
% 
% 
% % x74Out_p2 = TH*x72in ; eq11
% x74Out_p2_Mag = TH1.*x72In_p1_Mag;
% x74Out_p2_Phi = x72In_p1_Phi;
% 
% % x74Out = % x74Out_p1 + x74Out_p2 ; eq25
% x74Out_p3 = x74Out_p1_Mag.*exp(x74Out_p1_Phi.*1i) + x74Out_p2_Mag.*exp(x74Out_p2_Phi.*1i);
% x74Out_p3_Phi= angle(x74Out_p3);
% x74Out_p3_Mag= abs(x74Out_p3);
% 
% figure('name','Circuit Main, x74Out','numbertitle','off');
% subplot(2,1,1);
% plot(x,x74Out_p3_Mag,':r',x,x74OutMag,'--g');
% legend('x74Out-p3-Mag','x74OutMag');
% subplot(2,1,2);
% plot(x,x74Out_p3_Phi,':r',x,x74OutPhi,'--g');
% legend('x74Out-p3-Phi','x74OutPhi');
% 
% % w3eout = WG(x73Out); eq 20
% w3eOut_Mag = x73Out_p3_Mag;
% w3eOut_Phi = fWG1_TH_PhiF + x73Out_p3_Phi;
% 
% 
% figure('name','Circuit Main, w3eOut','numbertitle','off');
% subplot(2,1,1);
% plot(x,w3eOut_Mag,':r',x,w3eOutMag,'--g');
% legend('w3eOut-Mag','w3eOutMag');
% subplot(2,1,2);
% plot(x,w3eOut_Phi,':r',x,w3eOutPhi,'--g');
% legend('w3eOut-Phi','w3eOutPhi');
% 
% % w4nout = WG(x74Out); eq 21
% w4nOut_Mag = x74Out_p3_Mag;
% w4nOut_Phi = fWG1_TH_PhiF + x74Out_p3_Phi;
% 
% 
% figure('name','Circuit Main, w4nOut','numbertitle','off');
% subplot(2,1,1);
% plot(x,w4nOut_Mag,':r',x,w4nOutMag,'--g');
% legend('w4nOut-Mag','w4nOutMag');
% subplot(2,1,2);
% plot(x,w4nOut_Phi,':r',x,w4nOutPhi,'--g');
% legend('w4nOut-Phi','w4nOutPhi');
% 
