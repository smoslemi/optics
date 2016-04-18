set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= '2chAddDropFiler';
outputFile =load('2chAddDropFilter.1-DC.2d_dat');
mFile =load('2chAddDropFilter.1-DC.2d_dat');
Ref1=0.1;
TH1=0.7;
Right1= 0.15;
Left1= 0.2;

basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/filter/';

[nr,nc]=size(mFile);
for i=1:nr
    for j=2:nc
        mFile(i,j)=10^(mFile(i,j)/20);
    end
end


x=outputFile(:,1);

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
x23InDB=outputFile(:,20);
x24InDB=outputFile(:,21);
x23OutDB=outputFile(:,22);
x24OutDB=outputFile(:,23);

N31InDB=outputFile(:,24);
N32InDB=outputFile(:,25);
N33InDB=outputFile(:,26);
N34InDB=outputFile(:,27);
N31OutDB=outputFile(:,28);
N32OutDB=outputFile(:,29);
N33OutDB=outputFile(:,30);
N34OutDB=outputFile(:,31);
x33InDB=outputFile(:,32);
x34InDB=outputFile(:,33);
x33OutDB=outputFile(:,34);
x34OutDB=outputFile(:,35);
x42InDB=outputFile(:,36);
x43InDB=outputFile(:,37);
x44InDB=outputFile(:,38);
x42OutDB=outputFile(:,39);
x43OutDB=outputFile(:,40);
x44OutDB=outputFile(:,41);


% Real vlues
N11In=mFile(:,2);
N12In=mFile(:,3);
N13In=mFile(:,4);
N14In=mFile(:,5);
N11Out=mFile(:,6);
N12Out=mFile(:,7);
N13Out=mFile(:,8);
N14Out=mFile(:,9);
x14In=mFile(:,10);
x14Out=mFile(:,11);
N21In=mFile(:,12);
N22In=mFile(:,13);
N23In=mFile(:,14);
N24In=mFile(:,15);
N21Out=mFile(:,16);
N22Out=mFile(:,17);
N23Out=mFile(:,18);
N24Out=mFile(:,19);
x23In=mFile(:,20);
x24In=mFile(:,21);
x23Out=mFile(:,22);
x24Out=mFile(:,23);

N31In=mFile(:,24);
N32In=mFile(:,25);
N33In=mFile(:,26);
N34In=mFile(:,27);
N31Out=mFile(:,28);
N32Out=mFile(:,29);
N33Out=mFile(:,30);
N34Out=mFile(:,31);
x33In=mFile(:,32);
x34In=mFile(:,33);
x33Out=mFile(:,34);
x34Out=mFile(:,35);
x42In=mFile(:,36);
x43In=mFile(:,37);
x44In=mFile(:,38);
x42Out=mFile(:,39);
x43Out=mFile(:,40);
x44Out=mFile(:,41);



figure('name','Circuit 1 (2 rings) DB values, Ring1','numbertitle','off');
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
plot(x,N14InDB);
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
plot(x,N14OutDB);
legend('N14OutDB');


figure('name','Circuit 1 (2 rings) DB values, wx1 Cross','numbertitle','off');

subplot(1,2,1);
plot(x,x14InDB);
legend('x14InDB');

subplot(1,2,2);
plot(x,x14OutDB);
legend('x14OutDB');


figure('name','Circuit 1 (2 rings) DB values, Ring2','numbertitle','off');
subplot(4,2,1);
plot(x,N21InDB);
legend('N21InDB');
subplot(4,2,3);
plot(x,N22InDB);
legend('N22InDB');
subplot(4,2,5);
plot(x,N23InDB);
legend('N23InDB');
subplot(4,2,7);
plot(x,N24InDB);
legend('N24InDB');

subplot(4,2,2);
plot(x,N21OutDB);
legend('N21OutDB');
subplot(4,2,4);
plot(x,N22OutDB);
legend('N22OutDB');
subplot(4,2,6);
plot(x,N23OutDB);
legend('N23OutDB');
subplot(4,2,8);
plot(x,N24OutDB);
legend('N24OutDB');


figure('name','Circuit 1 (2 rings) DB values, wx2 Cross','numbertitle','off');


subplot(2,2,1);
plot(x,x23InDB);
legend('x24InDB');
subplot(2,2,3);
plot(x,x24InDB);
legend('x24InDB')

subplot(2,2,2);
plot(x,x23OutDB);
legend('x23OutDB');
subplot(2,2,4);
plot(x,x24OutDB);
legend('x24OutDB');





figure('name','Circuit 2 (1 ring) DB values, Ring3','numbertitle','off');
subplot(4,2,1);
plot(x,N31InDB);
legend('N31InDB');
subplot(4,2,3);
plot(x,N32InDB);
legend('N32InDB');
subplot(4,2,5);
plot(x,N33InDB);
legend('N33InDB');
subplot(4,2,7);
plot(x,N34InDB);
legend('N34InDB');

subplot(4,2,2);
plot(x,N31OutDB);
legend('N31OutDB');
subplot(4,2,4);
plot(x,N32OutDB);
legend('N32OutDB');
subplot(4,2,6);
plot(x,N33OutDB);
legend('N33OutDB');
subplot(4,2,8);
plot(x,N34OutDB);
legend('N34OutDB');


figure('name','Circuit 2 (1 ring) DB values, wx3 Cross','numbertitle','off');

subplot(2,2,1);
plot(x,x33InDB);
legend('x33InDB');

subplot(2,2,2);
plot(x,x33OutDB);
legend('x33OutDB');

subplot(2,2,3);
plot(x,x34InDB);
legend('x34InDB');

subplot(2,2,4);
plot(x,x34OutDB);
legend('x34OutDB');


figure('name','Circuit 2 (1 ring) DB values, wx4 Cross','numbertitle','off');

subplot(3,2,1);
plot(x,x42InDB);
legend('x42InDB');

subplot(3,2,2);
plot(x,x42OutDB);
legend('x42OutDB');

subplot(3,2,3);
plot(x,x43InDB);
legend('x43InDB');

subplot(3,2,4);
plot(x,x43OutDB);
legend('x43OutDB');

subplot(3,2,5);
plot(x,x44InDB);
legend('x44InDB');

subplot(3,2,6);
plot(x,x44OutDB);
legend('x44OutDB');




figure('name','Compare DB values, Drop ports','numbertitle','off');
subplot(1,2,1)
plot(x,N12InDB,'r',x,x24OutDB,'g');
legend('N12InDB','x42OutDB');
title('Cir1, 2 rings');
subplot(1,2,2)
plot(x,N32InDB,'r',x,x44OutDB,'g');
legend('N32InDB','x42OutDB');
title('Cir2, 1 ring');





%%%%%%%% REAL VALUES %%%%%%%%

figure('name','Circuit 1 (2 rings)  values, Ring1','numbertitle','off');
subplot(4,2,1);
plot(x,N11In);
legend('N11In');
subplot(4,2,3);
plot(x,N12In);
legend('N12In');
subplot(4,2,5);
plot(x,N13In);
legend('N13In');
subplot(4,2,7);
plot(x,N14In);
legend('N14In');

subplot(4,2,2);
plot(x,N11Out);
legend('N11Out');
subplot(4,2,4);
plot(x,N12Out);
legend('N12Out');
subplot(4,2,6);
plot(x,N13Out);
legend('N13Out');
subplot(4,2,8);
plot(x,N14Out);
legend('N14Out');


figure('name','Circuit 1 (2 rings)  values, wx1 Cross','numbertitle','off');

subplot(1,2,1);
plot(x,x14In);
legend('x14In');

subplot(1,2,2);
plot(x,x14Out);
legend('x14Out');


figure('name','Circuit 1 (2 rings)  values, Ring2','numbertitle','off');
subplot(4,2,1);
plot(x,N21In);
legend('N21In');
subplot(4,2,3);
plot(x,N22In);
legend('N22In');
subplot(4,2,5);
plot(x,N23In);
legend('N23In');
subplot(4,2,7);
plot(x,N24In);
legend('N24In');

subplot(4,2,2);
plot(x,N21Out);
legend('N21Out');
subplot(4,2,4);
plot(x,N22Out);
legend('N22Out');
subplot(4,2,6);
plot(x,N23Out);
legend('N23Out');
subplot(4,2,8);
plot(x,N24Out);
legend('N24Out');


figure('name','Circuit 1 (2 rings)  values, wx2 Cross','numbertitle','off');


subplot(2,2,1);
plot(x,x23In);
legend('x24In');
subplot(2,2,3);
plot(x,x24In);
legend('x24In')

subplot(2,2,2);
plot(x,x23Out);
legend('x23Out');
subplot(2,2,4);
plot(x,x24Out);
legend('x24Out');





figure('name','Circuit 2 (1 ring)  values, Ring3','numbertitle','off');
subplot(4,2,1);
plot(x,N31In);
legend('N31In');
subplot(4,2,3);
plot(x,N32In);
legend('N32In');
subplot(4,2,5);
plot(x,N33In);
legend('N33In');
subplot(4,2,7);
plot(x,N34In);
legend('N34In');

subplot(4,2,2);
plot(x,N31Out);
legend('N31Out');
subplot(4,2,4);
plot(x,N32Out);
legend('N32Out');
subplot(4,2,6);
plot(x,N33Out);
legend('N33Out');
subplot(4,2,8);
plot(x,N34Out);
legend('N34Out');


figure('name','Circuit 2 (1 ring)  values, wx3 Cross','numbertitle','off');

subplot(2,2,1);
plot(x,x33In);
legend('x33In');

subplot(2,2,2);
plot(x,x33Out);
legend('x33Out');

subplot(2,2,3);
plot(x,x34In);
legend('x34In');

subplot(2,2,4);
plot(x,x34Out);
legend('x34Out');



figure('name','Circuit 2 (1 ring)  values, wx4 Cross','numbertitle','off');

subplot(3,2,1);
plot(x,x42In);
legend('x42In');

subplot(3,2,2);
plot(x,x42Out);
legend('x42Out');

subplot(3,2,3);
plot(x,x43In);
legend('x43In');

subplot(3,2,4);
plot(x,x43Out);
legend('x43Out');

subplot(3,2,5);
plot(x,x44In);
legend('x44In');

subplot(3,2,6);
plot(x,x44Out);
legend('x44Out');




figure('name','Compare  values, Drop ports','numbertitle','off');
subplot(1,2,1)
plot(x,N12In,'r',x,x24Out,'g');
legend('N12In','x42Out');
title('Cir1, 2 rings');
subplot(1,2,2)
plot(x,N32In,'r',x,x44Out,'g');
legend('N32In','x42Out');
title('Cir2, 1 ring');




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
