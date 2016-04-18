set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= '2chAddDropWGFiler';
outputFile =load('2chAddDropWGFilter.1-DC.2d_dat');
mFile =load('2chAddDropWGFilter.1-DC.2d_dat');
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
x14nInDB=outputFile(:,10);
x14nOutDB=outputFile(:,11);
N21InDB=outputFile(:,12);
N22InDB=outputFile(:,13);
N23InDB=outputFile(:,14);
N24InDB=outputFile(:,15);
N21OutDB=outputFile(:,16);
N22OutDB=outputFile(:,17);
N23OutDB=outputFile(:,18);
N24OutDB=outputFile(:,19);
x23eInDB=outputFile(:,20);
x24nInDB=outputFile(:,21);
x23eOutDB=outputFile(:,22);
x24nOutDB=outputFile(:,23);

N31InDB=outputFile(:,24);
N32InDB=outputFile(:,25);
N33InDB=outputFile(:,26);
N34InDB=outputFile(:,27);
N31OutDB=outputFile(:,28);
N32OutDB=outputFile(:,29);
N33OutDB=outputFile(:,30);
N34OutDB=outputFile(:,31);
x33eInDB=outputFile(:,32);
x34nInDB=outputFile(:,33);
x33eOutDB=outputFile(:,34);
x34nOutDB=outputFile(:,35);
x42sInDB=outputFile(:,36);
x43eInDB=outputFile(:,37);
x44nInDB=outputFile(:,38);
x42sOutDB=outputFile(:,39);
x43eOutDB=outputFile(:,40);
x44nOutDB=outputFile(:,41);

N41InDB=outputFile(:,42);
N42InDB=outputFile(:,43);
N43InDB=outputFile(:,44);
N44InDB=outputFile(:,45);
N41OutDB=outputFile(:,46);
N42OutDB=outputFile(:,47);
N43OutDB=outputFile(:,48);
N44OutDB=outputFile(:,49);

N51InDB=outputFile(:,50);
N52InDB=outputFile(:,51);
N53InDB=outputFile(:,52);
N54InDB=outputFile(:,53);
N51OutDB=outputFile(:,54);
N52OutDB=outputFile(:,55);
N53OutDB=outputFile(:,56);
N54OutDB=outputFile(:,57);

N61InDB=outputFile(:,58);
N62InDB=outputFile(:,59);
N63InDB=outputFile(:,60);
N64InDB=outputFile(:,61);
N61OutDB=outputFile(:,62);
N62OutDB=outputFile(:,63);
N63OutDB=outputFile(:,64);
N64OutDB=outputFile(:,65);

x53eInDB=outputFile(:,66);
x54nInDB=outputFile(:,67);
x53eOutDB=outputFile(:,68);
x54nOutDB=outputFile(:,69);
x62sInDB=outputFile(:,70);
x63eInDB=outputFile(:,71);
x64nInDB=outputFile(:,72);
x62sOutDB=outputFile(:,73);
x63eOutDB=outputFile(:,74);
x64nOutDB=outputFile(:,75);


N71InDB=outputFile(:,76);
N72InDB=outputFile(:,77);
N73InDB=outputFile(:,78);
N74InDB=outputFile(:,79);
N71OutDB=outputFile(:,80);
N72OutDB=outputFile(:,81);
N73OutDB=outputFile(:,82);
N74OutDB=outputFile(:,83);

N81InDB=outputFile(:,84);
N82InDB=outputFile(:,85);
N83InDB=outputFile(:,86);
N84InDB=outputFile(:,87);
N81OutDB=outputFile(:,88);
N82OutDB=outputFile(:,89);
N83OutDB=outputFile(:,90);
N84OutDB=outputFile(:,91);

N91InDB=outputFile(:,92);
N92InDB=outputFile(:,93);
N93InDB=outputFile(:,94);
N94InDB=outputFile(:,95);
N91OutDB=outputFile(:,96);
N92OutDB=outputFile(:,97);
N93OutDB=outputFile(:,98);
N94OutDB=outputFile(:,99);

s11InDB=outputFile(:,100);
s12InDB=outputFile(:,101);
s13InDB=outputFile(:,102);
s14InDB=outputFile(:,103);
s11OutDB=outputFile(:,104);
s12OutDB=outputFile(:,105);
s13OutDB=outputFile(:,106);
s14OutDB=outputFile(:,107);


% Real vlues
N11In=mFile(:,2);
N12In=mFile(:,3);
N13In=mFile(:,4);
N14In=mFile(:,5);
N11Out=mFile(:,6);
N12Out=mFile(:,7);
N13Out=mFile(:,8);
N14Out=mFile(:,9);
x14nIn=mFile(:,10);
x14nOut=mFile(:,11);
N21In=mFile(:,12);
N22In=mFile(:,13);
N23In=mFile(:,14);
N24In=mFile(:,15);
N21Out=mFile(:,16);
N22Out=mFile(:,17);
N23Out=mFile(:,18);
N24Out=mFile(:,19);
x23eIn=mFile(:,20);
x24nIn=mFile(:,21);
x23eOut=mFile(:,22);
x24nOut=mFile(:,23);

N31In=mFile(:,24);
N32In=mFile(:,25);
N33In=mFile(:,26);
N34In=mFile(:,27);
N31Out=mFile(:,28);
N32Out=mFile(:,29);
N33Out=mFile(:,30);
N34Out=mFile(:,31);
x33eIn=mFile(:,32);
x34nIn=mFile(:,33);
x33eOut=mFile(:,34);
x34nOut=mFile(:,35);
x42sIn=mFile(:,36);
x43eIn=mFile(:,37);
x44nIn=mFile(:,38);
x42sOut=mFile(:,39);
x43eOut=mFile(:,40);
x44nOut=mFile(:,41);



% figure('name','Circuit 1 (2 rings) DB values, Ring1','numbertitle','off');
% subplot(4,2,1);
% plot(x,N11InDB);
% legend('N11InDB');
% subplot(4,2,3);
% plot(x,N12InDB);
% legend('N12InDB');
% subplot(4,2,5);
% plot(x,N13InDB);
% legend('N13InDB');
% subplot(4,2,7);
% plot(x,N14InDB);
% legend('N14InDB');
% 
% subplot(4,2,2);
% plot(x,N11OutDB);
% legend('N11OutDB');
% subplot(4,2,4);
% plot(x,N12OutDB);
% legend('N12OutDB');
% subplot(4,2,6);
% plot(x,N13OutDB);
% legend('N13OutDB');
% subplot(4,2,8);
% plot(x,N14OutDB);
% legend('N14OutDB');
% 
% 
% figure('name','Circuit 1 (2 rings) DB values, wx1 Cross','numbertitle','off');
% 
% subplot(1,2,1);
% plot(x,x14nInDB);
% legend('x14nInDB');
% 
% subplot(1,2,2);
% plot(x,x14nOutDB);
% legend('x14nOutDB');
% 
% 
% figure('name','Circuit 1 (2 rings) DB values, Ring2','numbertitle','off');
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
% plot(x,N24InDB);
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
% plot(x,N24OutDB);
% legend('N24OutDB');
% 
% 
% figure('name','Circuit 1 (2 rings) DB values, wx2 Cross','numbertitle','off');
% 
% 
% subplot(2,2,1);
% plot(x,x23eInDB);
% legend('x23eInDB');
% subplot(2,2,3);
% plot(x,x24nInDB);
% legend('x24nInDB')
% 
% subplot(2,2,2);
% plot(x,x23eOutDB);
% legend('x23eOutDB');
% subplot(2,2,4);
% plot(x,x24nOutDB);
% legend('x24nOutDB');
% 
% 
% 
% 
% 
% figure('name','Circuit 2 (1 ring) DB values, Ring3','numbertitle','off');
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
% plot(x,N34InDB);
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
% plot(x,N34OutDB);
% legend('N34OutDB');
% 
% 
% figure('name','Circuit 2 (1 ring) DB values, wx3 Cross','numbertitle','off');
% 
% subplot(2,2,1);
% plot(x,x33eInDB);
% legend('x33eInDB');
% 
% subplot(2,2,2);
% plot(x,x33eOutDB);
% legend('x33eOutDB');
% 
% subplot(2,2,3);
% plot(x,x34nInDB);
% legend('x34nInDB');
% 
% subplot(2,2,4);
% plot(x,x34nOutDB);
% legend('x34nOutDB');
% 
% 
% figure('name','Circuit 2 (1 ring) DB values, wx4 Cross','numbertitle','off');
% 
% subplot(3,2,1);
% plot(x,x42sInDB);
% legend('x42sInDB');
% 
% subplot(3,2,2);
% plot(x,x42sOutDB);
% legend('x42sOutDB');
% 
% subplot(3,2,3);
% plot(x,x43eInDB);
% legend('x43eInDB');
% 
% subplot(3,2,4);
% plot(x,x43eOutDB);
% legend('x43eOutDB');
% 
% subplot(3,2,5);
% plot(x,x44nInDB);
% legend('x44nInDB');
% 
% subplot(3,2,6);
% plot(x,x44nOutDB);
% legend('x44nOutDB');
% 



figure('name','Compare DB values, Drop ports','numbertitle','off');
subplot(1,2,1)
plot(x,N12InDB,'r',x,x14nOutDB,'g',x,x24nOutDB,'b');
legend('N12InDB','x14nOutDB','x24nOutDB');
title('Cir1, 2 rings, (Th=0.98 R=L=0.01 Ref=0.0) (Non=NoWG=1.6532) ');
subplot(1,2,2)
plot(x,N32InDB,'r',x,x34nOutDB,'g',x,x44nOutDB,'b');
legend('N32InDB','x34nOutDB','x44nOutDB');
title('Cir2, 1 ring, (Th=0.98 R=L=0.01 Ref=0.0) (Non=NoWG=1.6532) ');




figure('name','Circuit 3 (3 rings in series) DB values, Ring4,5,6','numbertitle','off');
subplot(4,2,1);
plot(x,N41InDB,x,N51InDB,x,N61InDB);
legend('N41InDB','N51InDB','N61InDB');
subplot(4,2,3);
plot(x,N42InDB,x,N52InDB,x,N62InDB);
legend('N42InDB','N52InDB','N62InDB');
subplot(4,2,5);
plot(x,N43InDB,x,N53InDB,x,N63InDB);
legend('N43InDB','N53InDB','N63InDB');
subplot(4,2,7);
plot(x,N44InDB,x,N54InDB,x,N64InDB);
legend('N44InDB','N54InDB','N64InDB');

subplot(4,2,2);
plot(x,N41OutDB,x,N51OutDB,x,N61OutDB);
legend('N41OutDB','N51OutDB','N61OutDB');
subplot(4,2,4);
plot(x,N42OutDB,x,N52OutDB,x,N62OutDB);
legend('N42OutDB','N52OutDB','N62OutDB');
subplot(4,2,6);
plot(x,N43OutDB,x,N53OutDB,x,N63OutDB);
legend('N43OutDB','N53OutDB','N63OutDB');
subplot(4,2,8);
plot(x,N44OutDB,x,N54OutDB,x,N64OutDB);
legend('N44OutDB','N54OutDB','N64OutDB');


figure('name','Circuit 4 (3 rings in paraller) DB values, Ring7,8,9','numbertitle','off');
subplot(4,2,1);
plot(x,N71InDB,x,N81InDB,x,N91InDB);
legend('N71InDB','N81InDB','N91InDB');
subplot(4,2,3);
plot(x,N72InDB,x,N82InDB,x,N92InDB);
legend('N72InDB','N82InDB','N92InDB');
subplot(4,2,5);
plot(x,N73InDB,x,N83InDB,x,N93InDB);
legend('N73InDB','N83InDB','N93InDB');
subplot(4,2,7);
plot(x,N74InDB,x,N84InDB,x,N94InDB);
legend('N74InDB','N84InDB','N94InDB');

subplot(4,2,2);
plot(x,N71OutDB,x,N81OutDB,x,N91OutDB);
legend('N71OutDB','N81OutDB','N91OutDB');
subplot(4,2,4);
plot(x,N72OutDB,x,N82OutDB,x,N92OutDB);
legend('N72OutDB','N82OutDB','N92OutDB');
subplot(4,2,6);
plot(x,N73OutDB,x,N83OutDB,x,N93OutDB);
legend('N73OutDB','N83OutDB','N93OutDB');
subplot(4,2,8);
plot(x,N74OutDB,x,N84OutDB,x,N94OutDB);
legend('N74OutDB','N84OutDB','N94OutDB');



figure('name','Circuit 1 (2 rings) DB values, Ring1','numbertitle','off');
subplot(4,2,1);
plot(x,s11InDB);
legend('s11InDB');
subplot(4,2,3);
plot(x,s12InDB);
legend('s12InDB');
subplot(4,2,5);
plot(x,s13InDB);
legend('s13InDB');
subplot(4,2,7);
plot(x,s14InDB);
legend('s14InDB');

subplot(4,2,2);
plot(x,s11OutDB);
legend('s11OutDB');
subplot(4,2,4);
plot(x,s12OutDB);
legend('s12OutDB');
subplot(4,2,6);
plot(x,s13OutDB);
legend('s13OutDB');
subplot(4,2,8);
plot(x,s14OutDB);
legend('s14OutDB');


% %%%%%%%% REAL VALUES %%%%%%%%
% 
% figure('name','Circuit 1 (2 rings)  values, Ring1','numbertitle','off');
% subplot(4,2,1);
% plot(x,N11In);
% legend('N11In');
% subplot(4,2,3);
% plot(x,N12In);
% legend('N12In');
% subplot(4,2,5);
% plot(x,N13In);
% legend('N13In');
% subplot(4,2,7);
% plot(x,N14In);
% legend('N14In');
% 
% subplot(4,2,2);
% plot(x,N11Out);
% legend('N11Out');
% subplot(4,2,4);
% plot(x,N12Out);
% legend('N12Out');
% subplot(4,2,6);
% plot(x,N13Out);
% legend('N13Out');
% subplot(4,2,8);
% plot(x,N14Out);
% legend('N14Out');
% 
% 
% figure('name','Circuit 1 (2 rings)  values, wx1 Cross','numbertitle','off');
% 
% subplot(1,2,1);
% plot(x,x14nIn);
% legend('x14nIn');
% 
% subplot(1,2,2);
% plot(x,x14nOut);
% legend('x14nOut');
% 
% 
% figure('name','Circuit 1 (2 rings)  values, Ring2','numbertitle','off');
% subplot(4,2,1);
% plot(x,N21In);
% legend('N21In');
% subplot(4,2,3);
% plot(x,N22In);
% legend('N22In');
% subplot(4,2,5);
% plot(x,N23In);
% legend('N23In');
% subplot(4,2,7);
% plot(x,N24In);
% legend('N24In');
% 
% subplot(4,2,2);
% plot(x,N21Out);
% legend('N21Out');
% subplot(4,2,4);
% plot(x,N22Out);
% legend('N22Out');
% subplot(4,2,6);
% plot(x,N23Out);
% legend('N23Out');
% subplot(4,2,8);
% plot(x,N24Out);
% legend('N24Out');
% 
% 
% figure('name','Circuit 1 (2 rings)  values, wx2 Cross','numbertitle','off');
% 
% 
% subplot(2,2,1);
% plot(x,x23eIn);
% legend('x23eIn');
% subplot(2,2,3);
% plot(x,x24nIn);
% legend('x24In')
% 
% subplot(2,2,2);
% plot(x,x23eOut);
% legend('x23eOut');
% subplot(2,2,4);
% plot(x,x24nOut);
% legend('x24nOut');
% 
% 
% 
% 
% 
% figure('name','Circuit 2 (1 ring)  values, Ring3','numbertitle','off');
% subplot(4,2,1);
% plot(x,N31In);
% legend('N31In');
% subplot(4,2,3);
% plot(x,N32In);
% legend('N32In');
% subplot(4,2,5);
% plot(x,N33In);
% legend('N33In');
% subplot(4,2,7);
% plot(x,N34In);
% legend('N34In');
% 
% subplot(4,2,2);
% plot(x,N31Out);
% legend('N31Out');
% subplot(4,2,4);
% plot(x,N32Out);
% legend('N32Out');
% subplot(4,2,6);
% plot(x,N33Out);
% legend('N33Out');
% subplot(4,2,8);
% plot(x,N34Out);
% legend('N34Out');
% 
% 
% figure('name','Circuit 2 (1 ring)  values, wx3 Cross','numbertitle','off');
% 
% subplot(2,2,1);
% plot(x,x33eIn);
% legend('x33eIn');
% 
% subplot(2,2,2);
% plot(x,x33eOut);
% legend('x33eOut');
% 
% subplot(2,2,3);
% plot(x,x34nIn);
% legend('x34nIn');
% 
% subplot(2,2,4);
% plot(x,x34nOut);
% legend('x34nOut');
% 
% 
% 
% figure('name','Circuit 2 (1 ring)  values, wx4 Cross','numbertitle','off');
% 
% subplot(3,2,1);
% plot(x,x42sIn);
% legend('x42sIn');
% 
% subplot(3,2,2);
% plot(x,x42sOut);
% legend('x42sOut');
% 
% subplot(3,2,3);
% plot(x,x43eIn);
% legend('x43eIn');
% 
% subplot(3,2,4);
% plot(x,x43eOut);
% legend('x43eOut');
% 
% subplot(3,2,5);
% plot(x,x44nIn);
% legend('x44nIn');
% 
% subplot(3,2,6);
% plot(x,x44nOut);
% legend('x44nOut');
% 
% 
% 
% 
% figure('name','Compare  values, Drop ports','numbertitle','off');
% subplot(1,2,1)
% plot(x,N12In,'r',x,x24nOut,'g');
% legend('N12In','x24nOut');
% title('Cir1, 2 rings');
% subplot(1,2,2)
% plot(x,N32In,'r',x,x44nOut,'g');
% legend('N32In','x24nOut');
% title('Cir2, 1 ring');




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
