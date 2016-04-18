set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= '8chAddDropFiler';
outputFile =load('8chAddDropFilter.1-DC.2d_dat');
Ref1=0.1;
TH1=0.9;
Right1= 0.1;
Left1= 0.1;

basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/filter/';




x=outputFile(:,1);

% main circuit
N11In=10.^(outputFile(:,2)./20);
N12In=10.^(outputFile(:,3)./20);
N13In=10.^(outputFile(:,4)./20);
N14In=10.^(outputFile(:,5)./20);
N11Out=10.^(outputFile(:,6)./20);
N12Out=10.^(outputFile(:,7)./20);
N13Out=10.^(outputFile(:,8)./20);
N14Out=10.^(outputFile(:,9)./20);

x14In=10.^(outputFile(:,10)./20);
x14Out=10.^(outputFile(:,11)./20);

N21In=10.^(outputFile(:,12)./20);
N22In=10.^(outputFile(:,13)./20);
N23In=10.^(outputFile(:,14)./20);
N24In=10.^(outputFile(:,15)./20);
N21Out=10.^(outputFile(:,16)./20);
N22Out=10.^(outputFile(:,17)./20);
N23Out=10.^(outputFile(:,18)./20);
N24Out=10.^(outputFile(:,19)./20);

x23In=10.^(outputFile(:,20)./20);
x24In=10.^(outputFile(:,21)./20);
x23Out=10.^(outputFile(:,22)./20);
x24Out=10.^(outputFile(:,23)./20);


% db vlues
N11InDB=outputFile(:,2);
N12InDB=outputFile(:,3);
N13InDB=outputFile(:,4);
N14InDB=outputFile(:,5);
N11OutDB=outputFile(:,6);
N12OutDB=outputFile(:,7);
N13OutDB=outputFile(:,8);
N14OutDB=outputFile(:,9);
x14InDB=outputFile(:,10);
x14OutDB=outputFile(:,11);
N21InDB=outputFile(:,12);
N22InDB=outputFile(:,13);
N23InDB=outputFile(:,14);
N24InDB=outputFile(:,15);
N21OutDB=outputFile(:,16);
N22OutDB=outputFile(:,17);
N23OutDB=outputFile(:,18);
N24OutDB=outputFile(:,19);
x24InDB=outputFile(:,20);
x24OutDB=outputFile(:,21);


N31InDB=outputFile(:,22);
N32InDB=outputFile(:,23);
N33InDB=outputFile(:,24);
N34InDB=outputFile(:,25);
N31OutDB=outputFile(:,26);
N32OutDB=outputFile(:,27);
N33OutDB=outputFile(:,28);
N34OutDB=outputFile(:,29);
x34InDB=outputFile(:,30);
x34OutDB=outputFile(:,31);
N41InDB=outputFile(:,32);
N42InDB=outputFile(:,33);
N43InDB=outputFile(:,34);
N44InDB=outputFile(:,35);
N41OutDB=outputFile(:,36);
N42OutDB=outputFile(:,37);
N43OutDB=outputFile(:,38);
N44OutDB=outputFile(:,39);
x44InDB=outputFile(:,40);
x44OutDB=outputFile(:,41);

N51InDB=outputFile(:,42);
N52InDB=outputFile(:,43);
N53InDB=outputFile(:,44);
N54InDB=outputFile(:,45);
N51OutDB=outputFile(:,46);
N52OutDB=outputFile(:,47);
N53OutDB=outputFile(:,48);
N54OutDB=outputFile(:,49);
x54InDB=outputFile(:,50);
x54OutDB=outputFile(:,51);
N61InDB=outputFile(:,52);
N62InDB=outputFile(:,53);
N63InDB=outputFile(:,54);
N6nDB=outputFile(:,55);
N61OutDB=outputFile(:,56);
N62OutDB=outputFile(:,57);
N63OutDB=outputFile(:,58);
N64OutDB=outputFile(:,59);
x64InDB=outputFile(:,60);
x64OutDB=outputFile(:,61);

N71InDB=outputFile(:,62);
N72InDB=outputFile(:,63);
N73InDB=outputFile(:,64);
N74InDB=outputFile(:,65);
N71OutDB=outputFile(:,66);
N72OutDB=outputFile(:,67);
N73OutDB=outputFile(:,68);
N74OutDB=outputFile(:,69);
x74InDB=outputFile(:,70);
x74OutDB=outputFile(:,71);
N81InDB=outputFile(:,72);
N82InDB=outputFile(:,73);
N83InDB=outputFile(:,74);
N84InDB=outputFile(:,75);
N81OutDB=outputFile(:,76);
N82OutDB=outputFile(:,77);
N83OutDB=outputFile(:,78);
N84OutDB=outputFile(:,79);
x83InDB=outputFile(:,80);
x84InDB=outputFile(:,81);
x83OutDB=outputFile(:,82);
x84OutDB=outputFile(:,83);



figure('name','Circuit Main DB values, Ring1','numbertitle','off');
subplot(4,2,1);
plot(x,N11InDB);
legend('N11InDB');
subplot(4,2,3);
plot(x,N12InDB);
legend('N12InDB');
subplot(4,2,5);
plot(x,N13InDB);
legend('N13InDB');
subplot(4,2,7);
plot(x,N13InDB);
legend('N14InDB');

subplot(4,2,2);
plot(x,N11OutDB);
legend('N11OutDB');
subplot(4,2,4);
plot(x,N12OutDB);
legend('N12OutDB');
subplot(4,2,6);
plot(x,N13OutDB);
legend('N13OutDB');
subplot(4,2,8);
plot(x,N13OutDB);
legend('N14OutDB');
% 
% 
% figure('name','Circuit Main DB values, wx1 Cross','numbertitle','off');
% 
% subplot(1,2,1);
% plot(x,x14InDB);
% legend('x14InDB');
% 
% subplot(1,2,2);
% plot(x,x14OutDB);
% legend('x14OutDB');
% 
% 
% figure('name','Circuit Main DB values, Ring2','numbertitle','off');
% subplot(4,2,1);
% plot(x,N21InDB);
% legend('N21InDB');
% subplot(4,2,3);
% plot(x,N22InDB);
% legend('N22InDB');
% subplot(4,2,5);
% plot(x,N23InDB);
% legend('N23InDB');
% subplot(4,2,7);
% plot(x,N23InDB);
% legend('N24InDB');
% 
% subplot(4,2,2);
% plot(x,N21OutDB);
% legend('N21OutDB');
% subplot(4,2,4);
% plot(x,N22OutDB);
% legend('N22OutDB');
% subplot(4,2,6);
% plot(x,N23OutDB);
% legend('N23OutDB');
% subplot(4,2,8);
% plot(x,N23OutDB);
% legend('N24OutDB');
% 
% 
% figure('name','Circuit Main DB values, wx2 Cross','numbertitle','off');
% 
% 
% subplot(1,2,1);
% plot(x,x24InDB);
% legend('x24InDB');
% 
% 
% subplot(1,2,2);
% plot(x,x24OutDB);
% legend('x24OutDB');
% 
% 
% 
% 
% 
% figure('name','Circuit Main DB values, Ring3','numbertitle','off');
% subplot(4,2,1);
% plot(x,N31InDB);
% legend('N31InDB');
% subplot(4,2,3);
% plot(x,N32InDB);
% legend('N32InDB');
% subplot(4,2,5);
% plot(x,N33InDB);
% legend('N33InDB');
% subplot(4,2,7);
% plot(x,N33InDB);
% legend('N34InDB');
% 
% subplot(4,2,2);
% plot(x,N31OutDB);
% legend('N31OutDB');
% subplot(4,2,4);
% plot(x,N32OutDB);
% legend('N32OutDB');
% subplot(4,2,6);
% plot(x,N33OutDB);
% legend('N33OutDB');
% subplot(4,2,8);
% plot(x,N33OutDB);
% legend('N34OutDB');
% 
% 
% figure('name','Circuit Main DB values, wx3 Cross','numbertitle','off');
% 
% subplot(1,2,1);
% plot(x,x34InDB);
% legend('x34InDB');
% 
% subplot(1,2,2);
% plot(x,x34OutDB);
% legend('x34OutDB');
% 
% figure('name','Circuit Main DB values, Ring4','numbertitle','off');
% subplot(4,2,1);
% plot(x,N41InDB);
% legend('N41InDB');
% subplot(4,2,3);
% plot(x,N42InDB);
% legend('N42InDB');
% subplot(4,2,5);
% plot(x,N43InDB);
% legend('N43InDB');
% subplot(4,2,7);
% plot(x,N43InDB);
% legend('N44InDB');
% 
% subplot(4,2,2);
% plot(x,N41OutDB);
% legend('N41OutDB');
% subplot(4,2,4);
% plot(x,N42OutDB);
% legend('N42OutDB');
% subplot(4,2,6);
% plot(x,N43OutDB);
% legend('N43OutDB');
% subplot(4,2,8);
% plot(x,N43OutDB);
% legend('N44OutDB');
% 
% 
% figure('name','Circuit Main DB values, wx4 Cross','numbertitle','off');
% 
% subplot(1,2,1);
% plot(x,x44InDB);
% legend('x44InDB');
% 
% subplot(1,2,2);
% plot(x,x44OutDB);
% legend('x44OutDB');
% 
% 
% figure('name','Circuit Main DB values, Ring5','numbertitle','off');
% subplot(4,2,1);
% plot(x,N51InDB);
% legend('N51InDB');
% subplot(4,2,3);
% plot(x,N52InDB);
% legend('N52InDB');
% subplot(4,2,5);
% plot(x,N53InDB);
% legend('N53InDB');
% subplot(4,2,7);
% plot(x,N53InDB);
% legend('N54InDB');
% 
% subplot(4,2,2);
% plot(x,N51OutDB);
% legend('N51OutDB');
% subplot(4,2,4);
% plot(x,N52OutDB);
% legend('N52OutDB');
% subplot(4,2,6);
% plot(x,N53OutDB);
% legend('N53OutDB');
% subplot(4,2,8);
% plot(x,N53OutDB);
% legend('N54OutDB');
% 
% 
% figure('name','Circuit Main DB values, wx5 Cross','numbertitle','off');
% 
% subplot(1,2,1);
% plot(x,x54InDB);
% legend('x54InDB');
% 
% subplot(1,2,2);
% plot(x,x54OutDB);
% legend('x54OutDB');
% 
% 
% figure('name','Circuit Main DB values, Ring6','numbertitle','off');
% subplot(4,2,1);
% plot(x,N61InDB);
% legend('N61InDB');
% subplot(4,2,3);
% plot(x,N62InDB);
% legend('N62InDB');
% subplot(4,2,5);
% plot(x,N63InDB);
% legend('N63InDB');
% subplot(4,2,7);
% plot(x,N63InDB);
% legend('N64InDB');
% 
% subplot(4,2,2);
% plot(x,N61OutDB);
% legend('N61OutDB');
% subplot(4,2,4);
% plot(x,N62OutDB);
% legend('N62OutDB');
% subplot(4,2,6);
% plot(x,N63OutDB);
% legend('N63OutDB');
% subplot(4,2,8);
% plot(x,N63OutDB);
% legend('N64OutDB');
% 
% 
% figure('name','Circuit Main DB values, wx6 Cross','numbertitle','off');
% 
% subplot(1,2,1);
% plot(x,x64InDB);
% legend('x64InDB');
% 
% subplot(1,2,2);
% plot(x,x64OutDB);
% legend('x64OutDB');
% 
% 
% figure('name','Circuit Main DB values, Ring7','numbertitle','off');
% subplot(4,2,1);
% plot(x,N71InDB);
% legend('N71InDB');
% subplot(4,2,3);
% plot(x,N72InDB);
% legend('N72InDB');
% subplot(4,2,5);
% plot(x,N73InDB);
% legend('N73InDB');
% subplot(4,2,7);
% plot(x,N73InDB);
% legend('N74InDB');
% 
% subplot(4,2,2);
% plot(x,N71OutDB);
% legend('N71OutDB');
% subplot(4,2,4);
% plot(x,N72OutDB);
% legend('N72OutDB');
% subplot(4,2,6);
% plot(x,N73OutDB);
% legend('N73OutDB');
% subplot(4,2,8);
% plot(x,N73OutDB);
% legend('N74OutDB');
% 
% 
% figure('name','Circuit Main DB values, wx7 Cross','numbertitle','off');
% 
% subplot(1,2,1);
% plot(x,x74InDB);
% legend('x74InDB');
% 
% subplot(1,2,2);
% plot(x,x74OutDB);
% legend('x74OutDB');
% 
% 
figure('name','Circuit Main DB values, Ring8','numbertitle','off');
subplot(4,2,1);
plot(x,N81InDB);
legend('N81InDB');
subplot(4,2,3);
plot(x,N82InDB);
legend('N82InDB');
subplot(4,2,5);
plot(x,N83InDB);
legend('N83InDB');
subplot(4,2,7);
plot(x,N83InDB);
legend('N84InDB');

subplot(4,2,2);
plot(x,N81OutDB);
legend('N81OutDB');
subplot(4,2,4);
plot(x,N82OutDB);
legend('N82OutDB');
subplot(4,2,6);
plot(x,N83OutDB);
legend('N83OutDB');
subplot(4,2,8);
plot(x,N83OutDB);
legend('N84OutDB');
% 
% 
% figure('name','Circuit Main DB values, wx8 Cross','numbertitle','off');
% 
% subplot(2,2,1);
% plot(x,x83InDB);
% legend('x83InDB');
% subplot(2,2,2);
% plot(x,x83OutDB);
% legend('x83OuttDB');
% subplot(2,2,3);
% plot(x,x84InDB);
% legend('x84InDB');
% subplot(2,2,4);
% plot(x,x84OutDB);
% legend('x84OutDB');

figure('name','Circuit Main DB values, TH ports','numbertitle','off');

plot(x,N13OutDB,'r',x,N23OutDB,'g',x,N33OutDB,'b',x,N43OutDB,'y',x,N53OutDB,'m',x,N63OutDB,'c',x,N73OutDB,'k',x,N83OutDB,':r');
legend('N12OutDB','N22OutDB','N32OutDB','N42OutDB','N52OutDB','N62OutDB','N72OutDB','N82OutDB');

figure('name','Circuit Main DB values, Drop ports','numbertitle','off');

plot(x,N12InDB,'r',x,N22InDB,'g',x,N32InDB,'b',x,N42InDB,'y',x,N52InDB,'m',x,N62InDB,'c',x,N72InDB,'k',x,N82InDB,':r');
legend('N12InDB','N22InDB','N32InDB','N42InDB','N52InDB','N62InDB','N72InDB','N82InDB');

% 
% 
% 
% % Mag and Phi from dataSet
% N11InMag=outputFile(:,22);
% N11InPhi=outputFile(:,23);
% N12InMag=outputFile(:,24);
% N12InPhi=outputFile(:,25);
% N13InMag=outputFile(:,26);
% N13InPhi=outputFile(:,27);
% N14InMag=outputFile(:,28);
% N14InPhi=outputFile(:,29);
% N11OutMag=outputFile(:,30);
% N11OutPhi=outputFile(:,31);
% N12OutMag=outputFile(:,32);
% N12OutPhi=outputFile(:,33);
% N13OutMag=outputFile(:,34);
% N13OutPhi=outputFile(:,35);
% N14OutMag=outputFile(:,36);
% N14OutPhi=outputFile(:,37);
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
% N14OutEr =N14OutMag.*cos(N14OutPhi);
% N14OutEi =N14OutMag.*sin(N14OutPhi);
% N14OutE = sqrt(N14OutEr.^2 + N14OutEi.^2 );
% 
% x71OutEr =x71OutMag.*cos(x71OutPhi);
% x71OutEi =x71OutMag.*sin(x71OutPhi);
% x71OutE = sqrt(x71OutEr.^2 + x71OutEi.^2 );
% 
% figure('name','Circuit Main, Waveguide1,3 Phase shifts','numbertitle','off');
% subplot(4,4,1);
% plot(x,N13OutPhi,':r',x,x71InPhi,'-.g');
% legend('N13OutPhi','x71InPhi','Location','eastoutside');
% title('Circuit Main, wg1 F-dir, phase shifts');
% subplot(4,4,2);
% plot(x,N13InPhi,':r',x,x71OutPhi,'--g');
% legend('N13InPhi','x71OutPhi','Location','eastoutside');
% title('Circuit Main, wg1 R-dir phase shifts');
% subplot(4,4,3);
% temp = x71InPhi-N13OutPhi;
% PosVal= temp >0 ;
% temp(PosVal) = -2*pi - temp(PosVal) ;
% plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg1 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');
% subplot(4,4,4);
% temp = N13InPhi-x71OutPhi;
% PosVal= temp >0 ;
% temp(PosVal) = -2*pi - temp(PosVal) ;
% plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg1 R-Dir fWG Mian, Sim','wg1 R-dir fWG TH');
% 
% subplot(4,4,5);
% plot(x,N14InPhi,':r',x,x72OutPhi,'-.g');
% legend('N14InPhi','x72OutPhi','Location','eastoutside');
% title('Circuit Main, wg2 f-dir, phase shifts');
% subplot(4,4,6);
% plot(x,N14OutPhi,':r',x,x72InPhi,'--g');
% legend('N14OutPhi', 'x72InPhi','Location','eastoutside');
% title('Circuit Main, wg2 R-dir, phase shifts');
% subplot(4,4,7);
% temp = N14InPhi-x72OutPhi;
% PosVal= temp >0 ;
% temp(PosVal) = -2*pi - temp(PosVal) ;
% plot(x,temp,':r',x,fWG1_TH_PhiF,'--g');
% legend('wg2 F-dir fWG Mian, Sim','wg1 F-dir fWG TH');
% subplot(4,4,8);
% temp = x72InPhi-N14OutPhi;
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
% % N13Out_p1 = TH(N11In); eq2
% N13Out_p1_Mag = fTH_TH_Mag.*N11InMag;
% N13Out_p1_Phi = fTH_TH_Phi+N11InPhi;
% 
% figure('name','Circuit Main, N13Out round 1','numbertitle','off');
% subplot(2,1,1);
% plot(x,N13Out_p1_Mag,':r',x,N13OutMag,'--g');
% legend('N13Out-p1-Mag','N13OutMag');
% subplot(2,1,2);
% plot(x,N13Out_p1_Phi,':r',x,N13OutPhi,'--g');
% legend('N13Out-p1-Phi','N13OutPhi');
% 
% % x71In_p1 = WG(N13out); eq3
% x71In_p1_Mag = N13Out_p1_Mag;
% x71In_p1_Phi = fWG1_TH_PhiF+N13Out_p1_Phi;
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
% % N13In_p1 = WG(x71Out_p1); eq5
% N13In_p1_Mag = x71Out_p1_Mag;
% N13In_p1_Phi = fTH_TH_Phi+x71Out_p1_Phi;
% figure('name','Circuit Main, N13In round 1','numbertitle','off');
% subplot(2,1,1);
% plot(x,N13In_p1_Mag,':r',x,N13InMag,'--g');
% legend('N13In-p1-Mag','N13InMag');
% subplot(2,1,2);
% plot(x,N13In_p1_Phi,':r',x,N13InPhi,'--g');
% legend('N13In-p1-Phi','N13InPhi');
% 
% 
% % N14Out_p1 = Drop(N13In); eq7
% N14Out_p1_Mag = fDrop_TH_Mag.*N13InMag;
% N14Out_p1_Phi = fDrop_TH_Phi+N13InPhi;
% figure('name','Circuit Main, N14Out ','numbertitle','off');
% subplot(2,1,1);
% plot(x,N14Out_p1_Mag,':r',x,N14OutMag,'--g');
% legend('N14Out-p1-Mag','N14OutMag');
% subplot(2,1,2);
% plot(x,N14Out_p1_Phi,':r',x,N14OutPhi,'--g');
% legend('N14Out-p1-Phi','N14OutPhi');
% 
% % x72In_p1 = WG(N14out); eq8
% x72In_p1_Mag = N14Out_p1_Mag;
% x72In_p1_Phi = fWG1_TH_PhiF+N14Out_p1_Phi;
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
% % N13In = WG(x71Out) ; eq5 eq21
% N13In_p2_Mag = x71Out_p3_Mag;
% N13In_p2_Phi = fWG1_TH_PhiF+x71Out_p3_Phi;
% 
% %%%%%%%%%%%%%%%%%%%%%%%%% START N13In %%%%%%%%%%%%%%%%%%%%%%%%%%
% figure('name','Circuit Main, N13In','numbertitle','off');
% subplot(2,1,1);
% plot(x,N13In_p2_Mag,':r',x,N13InMag,'--g');
% legend('N13In-p2-Mag','N13InMag');
% subplot(2,1,2);
% plot(x,N13In_p2_Phi,':r',x,N13InPhi,'--g');
% legend('N13In-p2-Phi','N13InPhi');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%% End N13In %%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % N1IOut = TH(N13In); eq6
% N11Out_p1_Mag = fTH_TH_Mag.*N13In_p2_Mag;
% N11Out_p1_Phi = fTH_TH_Phi+N13In_p2_Phi;
% 
% figure('name','Circuit Main, N11Out','numbertitle','off');
% subplot(2,1,1);
% plot(x,N11Out_p1_Mag,':r',x,N11OutMag,'--g');
% legend('N11Out-p1-Mag','N11OutMag');
% subplot(2,1,2);
% plot(x,N11Out_p1_Phi,':r',x,N11OutPhi,'--g');
% legend('N11Out-p1-Phi','N11OutPhi');
% 
% % x72Out_p1 = Right*x71In_p ; eq12
% x72Out_p1_Mag = Right1.*x71In_p1_Mag;
% x72Out_p1_Phi = x71In_p1_Phi;
% 
% %N14In_p = WG(x72Out-p1) ;eq 13
% N14In_p1_Mag = x72Out_p1_Mag;
% N14In_p1_Phi = fWG1_TH_PhiF+x72Out_p1_Phi;
% 
% figure('name','Circuit Main, N14In','numbertitle','off');
% subplot(2,1,1);
% plot(x,N14In_p1_Mag,':r',x,N14InMag,'--g');
% legend('N14In_p_Mag','N14InMag');
% subplot(2,1,2);
% plot(x,N14In_p1_Phi,':r',x,N14InPhi,'--g');
% legend('N14In-p-Phi','N14InPhi');
% 
% 
% % N13Out_p2 = Drop(N14In); eq15
% N13Out_p2_Mag = fDrop_TH_Mag.*N14In_p1_Mag;
% N13Out_p2_Phi = fDrop_TH_Phi+N14In_p1_Phi;
% 
% % N13Out_p3 = N13Out_p1 + N13Out_p2 ;eq27
% N13Out_p3 = N13Out_p1_Mag.*exp(N13Out_p1_Phi.*1i) + N13Out_p2_Mag.*exp(N13Out_p2_Phi.*1i);
% N13Out_p3_Phi= angle(N13Out_p3);
% N13Out_p3_Mag= abs(N13Out_p3);
% 
% figure('name','Circuit Main, N13Out','numbertitle','off');
% subplot(2,1,1);
% plot(x,N13Out_p3_Mag,':r',x,N13OutMag,'--g');
% legend('N14In_p_Mag','N13OutMag');
% subplot(2,1,2);
% plot(x,N13Out_p3_Phi,':r',x,N13OutPhi,'--g');
% legend('N13Out-p3-Phi','N13OutPhi');
% 
% % N12In_p1 = fDrop(N11In); eq 18
% N12In_p1_Mag = fDrop_TH_Mag.*N11InMag;
% N12In_p1_Phi = fDrop_TH_Phi+N11InPhi;
% 
% % N12In_p2 = fTH(N14In_p); eq 14
% N12In_p2_Mag = fTH_TH_Mag.*N14In_p1_Mag;
% N12In_p2_Phi = fTH_TH_Phi+N14In_p1_Phi;
% 
% % N12In_p3 = N12In_p1 + N12In_p2 ;eq26
% N12In_p3 = N12In_p1_Mag.*exp(N12In_p1_Phi.*1i) + N12In_p2_Mag.*exp(N12In_p2_Phi.*1i);
% N12In_p3_Phi= angle(N12In_p3);
% N12In_p3_Mag= abs(N12In_p3);
% 
% figure('name','Circuit Main, N12In round final','numbertitle','off');
% subplot(2,1,1);
% plot(x,N12In_p3_Mag,':r',x,N12InMag,'--g');
% legend('N12In-p3-Mag','N12InMag');
% subplot(2,1,2);
% plot(x,N12In_p3_Phi,'-.k',x,N12InPhi,'--y');
% legend('N12In-p3-Phi','N12InPhi');
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
