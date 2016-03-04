set(0,'DefaultFigureWindowStyle','docked');
%set(0,'DefaultFigureWindowStyle','normal');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
%set(groot,'defaultAxesLineStyleOrder',['-' '--' '.' '-.']);
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'-.','--'});
%set(0,'DefaultAxesColorOrder',[2 7 0 0],'DefaultAxesLineStyleOrder','-|--|:|-.');
set(0,'DefaultLineMarkerSize',1);
%set(0,'defaultYGrid','Minor');
%set(0,'AxesYMinorGrid','on');
%set(0,'color','RED');
%set(0,'defaultXMinorGrid','on');
%set(0,'Grid','minor');
%set(0,'GridVisible','TRUE');
%GridVisible = TRUE;
%set(0,'YMinorGrid','on');

%set(gcf, 'position',[0 0 40 100]);


basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/cross/';
base = 'ringsCrossComb';
outputFile = strcat(base,'.0-DC.2d_dat');
basefile = strcat(base,'.sp');
baseFileFull = strcat(basePath,basefile);
dateStamp = datestr(now,'ddmmmyy_HHMM');
display(dateStamp);
snapshot = strcat('ringCross_', dateStamp);
display(snapshot);
% mkdir(snapshot);
snapshotFull=strcat('./',snapshot);
% cd(snapshotFull);
system(pwd);
%output = load('ringsCrossComb.0-DC.2d_dat');
output = load(outputFile);
outputFile;
%x=ringCross_0_DC(:,1);
%N11In=ringCross_0_DC(:,2);
x=output(:,1);

%Circuit 1, Ring1
N11In=output(:,2); % N11 in
N12In=output(:,3); % N12 in
N13In=output(:,4); % N13 in
N14In=output(:,5); % N14 in
N11Out=output(:,6); % N11 out
N12Out=output(:,7); % N12 out
N13Out=output(:,8); % N13 out
N14Out=output(:,9); % N14 out

N11In=10.^(N11In/20);
N12In=10.^(N12In/20);
N13In=10.^(N13In/20);
N14In=10.^(N14In/20);
N11Out=10.^(N11Out/20);
N12Out=10.^(N12Out/20);
N13Out=10.^(N13Out/20);
N14Out=10.^(N14Out/20);


%Circuit 2, x1
x11In=output(:,10); % x11 in
x12In=output(:,11); % x12 in 
x13In=output(:,12); % x13 in
x14In=output(:,13); % x14 in
x11Out=output(:,14); % x11 out
x12Out=output(:,15); % x11 out
x13Out=output(:,16);
x14Out=output(:,17);

x11In=10.^(x11In/20);
x12In=10.^(x12In/20);
x13In=10.^(x13In/20);
x14In=10.^(x14In/20);
x11Out=10.^(x11Out/20);
x12Out=10.^(x12Out/20);
x13Out=10.^(x13Out/20);
x14Out=10.^(x14Out/20);



% Theory formula

x12Out_TH = 0.15.*x11In;
x13Out_TH = 0.8.*x11In;
x14Out_TH = 0.4.*x11In;
x11Out_TH = 0.1.*x11In;




%Circuit 3, (Ring2, x2)
N21In=output(:,18);
N22In=output(:,19);
N23In=output(:,20);
N24In=output(:,21);
N21Out=output(:,22);
N22Out=output(:,23);
N23Out=output(:,24);
N24Out=output(:,25);
x21In=output(:,26);
x22In=output(:,27);
x23In=output(:,28);
x24In=output(:,29);
x21Out=output(:,30);
x22Out=output(:,31);
x23Out=output(:,32);
x24Out=output(:,33);


N21In=10.^(N21In/20);
N22In=10.^(N22In/20);
N23In=10.^(N23In/20);
N24In=10.^(N24In/20);
N21Out=10.^(N21Out/20);
N22Out=10.^(N22Out/20);
N23Out=10.^(N23Out/20);
N24Out=10.^(N24Out/20);
x21In=10.^(x21In/20);
x22In=10.^(x22In/20);
x23In=10.^(x23In/20);
x24In=10.^(x24In/20);
x21Out=10.^(x21Out/20);
x22Out=10.^(x22Out/20);
x23Out=10.^(x23Out/20);
x24Out=10.^(x24Out/20);


x21In_TH = N23Out;
x21Out_TH = 0.1.*x21In;

% N21In_TH = Input of Ring 2, CWSourse 
N21Out_TH = 0.1.*x21In_TH;


% N23Out is the through port of Ring2
N23In_TH = 0.1.*x21In_TH;

x22Out_TH=0.15.*x21In;
x22In_TH = 0; % (TBD ?)

% N22In_TH = Drop port of Ring 2 
N22Out_TH = 0 ; %(TBD ?)

x23In_TH = 0 ;%(TBD ?)
x23Out_TH=0.8.*x21In;

x24In_TH = 0 ; %(TBD ?)
x24Out_TH=0.4.*x21In;

% N24Out is the Add port of Ring2
N24In_TH = x22Out_TH;

%Circuit 4, (Ring3, x3, x4)
N31In=output(:,34);
N32In=output(:,35);
N33In=output(:,36);
N34In=output(:,37);
N31Out=output(:,38);
N32Out=output(:,39);
N33Out=output(:,40);
N34Out=output(:,41);
x31In=output(:,42);
x32In=output(:,43);
x33In=output(:,44);
x34In=output(:,45);
x31Out=output(:,46);
x32Out=output(:,47);
x33Out=output(:,48);
x34Out=output(:,49);
x41In=output(:,50);
x42In=output(:,51);
x43In=output(:,52);
x44In=output(:,53);
x41Out=output(:,54);
x42Out=output(:,55);
x43Out=output(:,56);
x44Out=output(:,57);

N31In=10.^(N31In/20);
N32In=10.^(N32In/20);
N33In=10.^(N33In/20);
N34In=10.^(N34In/20);
N31Out=10.^(N31Out/20);
N32Out=10.^(N32Out/20);
N33Out=10.^(N33Out/20);
N34Out=10.^(N34Out/20);
x31In=10.^(x31In/20);
x32In=10.^(x32In/20);
x33In=10.^(x33In/20);
x34In=10.^(x34In/20);
x31Out=10.^(x31Out/20);
x32Out=10.^(x32Out/20);
x33Out=10.^(x33Out/20);
x34Out=10.^(x34Out/20);
x41In=10.^(x41In/20);
x42In=10.^(x42In/20);
x43In=10.^(x43In/20);
x44In=10.^(x44In/20);
x41Out=10.^(x41Out/20);
x42Out=10.^(x42Out/20);
x43Out=10.^(x43Out/20);
x44Out=10.^(x44Out/20);




%Theory formulas

% N31In Input of Ring 3 from CWSource
% N32In Drop of Ring 3;
% N33Out Through of Ring 3
% N34Out Add of Ring 3 WITH CWSouce at port 1 and Drop of Ring 3 with Input at N33IN (because of reflection)
x31In_TH = N33Out ;
N32Out_TH = 0 ; % No signal
% x32In=output(:,43);
x34In_TH = 0 ; % No signal
x33Out_TH = 0.8 .* x31In_TH;
x41In_TH = x33Out_TH ;
x42In_TH = 0 ; % No signal
x43In_TH = 0 ; % No signal
x44In_TH = 0 ; % No signal
x41Out_TH = 0.1 .* x41In_TH;
x33In_TH = x41Out_TH ;
x32Out_TH = 0.15 .* x31In_TH + 0.4 .* x33In_TH;
x34Out_TH = 0.4 .* x31In_TH + 0.15 .* x33In_TH; 
x31Out_TH = 0.1.*x31In_TH + 0.8 .* x33In_TH;
N33In_TH = x31Out_TH;
N31Out_TH = N33In_TH ; % ThrougH of Ring 3 with Input at N33IN (because of reflection)
N34In_TH = x32Out_TH ;
x42Out_TH = 0.15 .* x41In_TH;
x43Out_TH = 0.8 .* x41In_TH;
x44Out_TH = 0.4 .* x41In_TH;




%Circuit 5, (Ring4, Ring5, x5, x6)
N41In=output(:,58);
N42In=output(:,59);
N43In=output(:,60);
N44In=output(:,61);
N41Out=output(:,62);
N42Out=output(:,63);
N43Out=output(:,64);
N44Out=output(:,64);
x51In=output(:,65);
x52In=output(:,66);
x53In=output(:,67);
x54In=output(:,68);
x51Out=output(:,69);
x52Out=output(:,70);
x53Out=output(:,71);
x54Out=output(:,72);
N51In=output(:,73);
N52In=output(:,74);
N53In=output(:,74);
N54In=output(:,76);
N51Out=output(:,77);
N52Out=output(:,78);
N53Out=output(:,79);
N54Out=output(:,80);
x61In=output(:,81);
x62In=output(:,82);
x63In=output(:,83);
x64In=output(:,84);
x61Out=output(:,85);
x62Out=output(:,86);
x63Out=output(:,87);
x64Out=output(:,88);



N41In=10.^(N41In/20);
N42In=10.^(N42In/20);
N43In=10.^(N43In/20);
N44In=10.^(N44In/20);
N41Out=10.^(N41Out/20);
N42Out=10.^(N42Out/20);
N43Out=10.^(N43Out/20);
N44Out=10.^(N44Out/20);
x51In=10.^(x51In/20);
x52In=10.^(x52In/20);
x53In=10.^(x53In/20);
x54In=10.^(x54In/20);
x51Out=10.^(x51Out/20);
x52Out=10.^(x52Out/20);
x53Out=10.^(x53Out/20);
x54Out=10.^(x54Out/20);

N51In=10.^(N51In/20);
N52In=10.^(N52In/20);
N53In=10.^(N53In/20);
N54In=10.^(N54In/20);
N51Out=10.^(N51Out/20);
N52Out=10.^(N52Out/20);
N53Out=10.^(N53Out/20);
N54Out=10.^(N54Out/20);
x61In=10.^(x61In/20);
x62In=10.^(x62In/20);
x63In=10.^(x63In/20);
x64In=10.^(x64In/20);
x61Out=10.^(x61Out/20);
x62Out=10.^(x62Out/20);
x63Out=10.^(x63Out/20);
x64Out=10.^(x64Out/20);



%Theory formulas

% N41In Input of Ring 4 from CWSource
% N42In Drop of Ring 4;
% N43Out Through of Ring 4
% N44Out Add of Ring 4 WITH CWSouce at port 1 and Drop of Ring 4 with Input at N43IN (because of reflection)
x51In_TH = N43Out ;
N42Out_TH = 0 ; % No signal
% x32In=output(:,43);
x54In_TH = 0 ; % No signal
x53Out_TH = 0.8 .* x51In_TH;
x61In_TH = N53Out ;
x62In_TH = 0 ; % No signal
x63In_TH = 0 ; % No signal
x64In_TH = 0 ; % No signal
x61Out_TH = 0.1 .* x61In_TH;
x53In_TH = N51Out ;
x52Out_TH = 0.15 .* x51In_TH + 0.4 .* x53In_TH;
x54Out_TH = 0.4 .* x51In_TH + 0.15 .* x53In_TH; 
x51Out_TH = 0.1.*x51In_TH + 0.8 .* x53In_TH;
N43In_TH = x51Out_TH;
N41Out_TH = N43In_TH ; % ThrougH of Ring 3 with Input at N33IN (because of reflection)
N44In_TH = x52Out_TH ;
x62Out_TH = 0.15 .* x61In_TH;
x63Out_TH = 0.8 .* x61In_TH;
x64Out_TH = 0.4 .* x61In_TH;

%figure;

%%Circuit 1
% figure('name','Circuit 1, Ring 1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,N11In);
% subplot(4,2,3);
% plot(x,N12In);
% subplot(4,2,5);
% plot(x,N13In);
% subplot(4,2,7);
% plot(x,N14In);
% subplot(4,2,2);
% plot(x,N11Out);
% subplot(4,2,4);
% plot(x,N12Out);
% subplot(4,2,6);
% plot(x,N13Out);
% subplot(4,2,8);
% plot(x,N14Out);
% 
% 
% %Circuit 2
% figure('name','Circuit 2, xcross 1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,x11In);
% subplot(4,2,3);
% plot(x,x12In);
% subplot(4,2,5);
% plot(x,x13In);
% subplot(4,2,7);
% plot(x,x14In);
% subplot(4,2,2);
% plot(x,x11Out,x,x11Out_TH);
% legend('x11Out','x11Out-TH');
% subplot(4,2,4);
% plot(x,x12Out,x,x12Out_TH);
% legend('x12Out','x12Out-TH');
% subplot(4,2,6);
% plot(x,x13Out,x,x13Out_TH);
% legend('x13Out','x13Out-TH');
% subplot(4,2,8);
% plot(x,x14Out,x,x14Out_TH);
% legend('x14Out','x14Out-TH');
% 
% %Circuit 3
% figure('name','Circuit 3, Ring 2 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,N21In);
% subplot(4,2,3);
% plot(x,N22In);
% subplot(4,2,5);
% plot(x,N23In,x,N23In_TH);
% legend('N23In','N23In-TH');
% subplot(4,2,7);
% plot(x,N24In,x,N24In_TH);
% legend('N24In','N24In-TH');
% subplot(4,2,2);
% plot(x,N21Out,x,N21Out_TH);
% legend('N21Out','N21Out-TH');
% subplot(4,2,4);
% plot(x,N22Out,x,N22Out_TH);
% legend('N22Out','N22Out-TH');
% subplot(4,2,6);
% plot(x,N23Out);
% subplot(4,2,8);
% plot(x,N24Out);
% 
% figure('name','Circuit 3, xcross 2 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,x21In,x,x21In_TH);
% legend('x21In','x21In-TH');
% subplot(4,2,3);
% plot(x,x22In);
% legend('x22In');
% subplot(4,2,5);
% plot(x,x23In);
% legend('x23In');
% subplot(4,2,7);
% plot(x,x24In);
% legend('x24In');
% subplot(4,2,2);
% plot(x,x21Out,x,x21Out_TH);
% legend('x21Out','x21Out-TH');
% subplot(4,2,4);
% plot(x,x22Out,x,x22Out_TH);
% legend('x22Out','x22Out-TH');
% subplot(4,2,6);
% plot(x,x23Out,x,x23Out_TH);
% legend('x23Out','x23Out-TH');
% subplot(4,2,8);
% plot(x,x24Out,x,x24Out_TH);
% legend('x24Out','x24Out-TH');
% 
% %Compare Ring2 and Ring1
% 
% figure('name','Ring2 VS Ring1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,N21In,x,N11In);
% legend('Ring2','Ring1');
% grid on;
% grid minor;
% subplot(4,2,3);
% plot(x,N22In,x,N12In);
% legend('Ring2','Ring1');
% subplot(4,2,5);
% plot(x,N23In,x,N13In);
% legend('Ring2','Ring1');
% subplot(4,2,7);
% plot(x,N24In,x,N14In);
% legend('Ring2','Ring1');
% subplot(4,2,2);
% plot(x,N21Out,x,N11Out);
% legend('Ring2','Ring1');
% subplot(4,2,4);
% plot(x,N22Out,x,N12Out);
% legend('Ring2','Ring1');
% subplot(4,2,6);
% plot(x,N23Out,x,N13Out);
% legend('Ring2','Ring1');
% subplot(4,2,8);
% plot(x,N24Out,x,N14Out);
% legend('Ring2','Ring1');
% 
% figure('name','Xcross2 VS XCcross1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,x21In,x,x11In);
% legend('Xcross2','Xcross1');
% subplot(4,2,3);
% plot(x,x22In,x,x12In);
% legend('Xcross2','Xcross1');
% subplot(4,2,5);
% plot(x,x23In,x,x13In);
% legend('Xcross2','Xcross1');
% subplot(4,2,7);
% plot(x,x24In,x,x14In);
% legend('Xcross2','Xcross1');
% subplot(4,2,2);
% plot(x,x21Out,x,x11Out);
% legend('Xcross2','Xcross1');
% subplot(4,2,4);
% plot(x,x22Out,x,x12Out);
% legend('Xcross2','Xcross1');
% subplot(4,2,6);
% plot(x,x23Out,x,x13Out);
% legend('Xcross2','Xcross1');
% subplot(4,2,8);
% plot(x,x24Out,x,x14Out);
% legend('Xcross2','Xcross1');
% 
% % %Circuit 4
% figure('name','Circuit 4, Ring 3 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,N31In);
% subplot(4,2,3);
% plot(x,N32In);
% subplot(4,2,5);
% plot(x,N33In,x,N33In_TH);
% legend('N33In','N33In_TH');
% subplot(4,2,7);
% plot(x,N34In,x,N34In_TH);
% legend('N34In','N34In_TH');
% subplot(4,2,2);
% plot(x,N31Out,x,N31Out_TH);
% legend('N31Out','N31Out_TH');
% subplot(4,2,4);
% plot(x,N32Out,x,N32Out_TH);
% legend('N32Out','N32Out_TH');
% subplot(4,2,6);
% plot(x,N33Out);
% subplot(4,2,8);
% plot(x,N34Out);
% 
% figure('name','Circuit 4, xcross 3 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,x31In,x,x31In_TH);
% legend('x31In','x31In-TH');
% subplot(4,2,3);
% plot(x,x32In);
% subplot(4,2,5);
% plot(x,x33In,x,x33In_TH);
% legend('x33In','x33In-TH');
% subplot(4,2,7);
% plot(x,x34In,x,x34In_TH);
% legend('x34In','x34In-TH');
% subplot(4,2,2);
% plot(x,x31Out,x,x31Out_TH);
% legend('x31Out','x31Out-TH');
% subplot(4,2,4);
% plot(x,x32Out,x,x32Out_TH);
% legend('x32Out','x32Out-TH');
% subplot(4,2,6);
% plot(x,x33Out,x,x33Out_TH);
% legend('x33Out','x33Out-TH');
% subplot(4,2,8);
% plot(x,x34Out,x,x34Out_TH);
% legend('x34Out','x34Out-TH');
% 
% figure('name','Circuit 4, xcross 4 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,x41In,x,x41In_TH);
% legend('x41OIn','x41In-TH');
% subplot(4,2,3);
% plot(x,x42In,x,x42In_TH);
% legend('x42OIn','x42In-TH');
% subplot(4,2,5);
% plot(x,x43In,x,x43In_TH);
% legend('x43OIn','x43In-TH');
% subplot(4,2,7);
% plot(x,x44In,x,x44In_TH);
% legend('x44OIn','x44In-TH');
% subplot(4,2,2);
% plot(x,x41Out,x,x41Out_TH);
% legend('x41Out','x41Out-TH');
% subplot(4,2,4);
% plot(x,x42Out,x,x42Out_TH);
% legend('x42Out','x42Out-TH');
% subplot(4,2,6);
% plot(x,x43Out,x,x43Out_TH);
% legend('x43Out','x43Out-TH');
% subplot(4,2,8);
% plot(x,x44Out,x,x44Out_TH);
% legend('x44Out','x44Out-TH');
% 
% %Compare Ring3 and Ring1
% 
% figure('name','Ring3 VS Ring1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,N31In,x,N11In);
% legend('Ring3','Ring1'); 
% subplot(4,2,3);
% plot(x,N32In,x,N12In);
% legend('Ring3','Ring1');
% subplot(4,2,5);
% plot(x,N33In,x,N13In);
% legend('Ring3','Ring1');
% subplot(4,2,7);
% plot(x,N34In,x,N14In);
% legend('Ring3','Ring1');
% subplot(4,2,2);
% plot(x,N31Out,x,N11Out);
% legend('Ring3','Ring1');
% subplot(4,2,4);
% plot(x,N32Out,x,N12Out);
% legend('Ring3','Ring1');
% subplot(4,2,6);
% plot(x,N33Out,x,N13Out);
% legend('Ring3','Ring1');
% subplot(4,2,8);
% plot(x,N34Out,x,N14Out);
% legend('Ring3','Ring1');
% 
% figure('name','Xcross3 VS XCcross1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,x31In,x,x11In);
% legend('Xcross3','Xcross1');
% subplot(4,2,3);
% plot(x,x32In,x,x12In);
% legend('Xcross3','Xcross1');
% subplot(4,2,5);
% plot(x,x33In,x,x13In);
% legend('Xcross3','Xcross1');
% subplot(4,2,7);
% plot(x,x34In,x,x14In);
% legend('Xcross3','Xcross1');
% subplot(4,2,2);
% plot(x,x31Out,x,x11Out);
% legend('Xcross3','Xcross1');
% subplot(4,2,4);
% plot(x,x32Out,x,x12Out);
% legend('Xcross3','Xcross1');
% subplot(4,2,6);
% plot(x,x33Out,x,x13Out);
% legend('Xcross3','Xcross1');
% subplot(4,2,8);
% plot(x,x34Out,x,x14Out);
% legend('Xcross3','Xcross1');
% 
% 
% figure('name','Xcross4 VS XCcross1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,x41In,x,x11In);
% legend('Xcross4','Xcross1');
% subplot(4,2,3);
% plot(x,x42In,x,x12In);
% legend('Xcross4','Xcross1');
% subplot(4,2,5);
% plot(x,x43In,x,x13In);
% legend('Xcross4','Xcross1');
% subplot(4,2,7);
% plot(x,x44In,x,x14In);
% legend('Xcross4','Xcross1');
% subplot(4,2,2);
% plot(x,x41Out,x,x11Out);
% legend('Xcross4','Xcross1');
% subplot(4,2,4);
% plot(x,x42Out,x,x12Out);
% legend('Xcross4','Xcross1');
% subplot(4,2,6);
% plot(x,x43Out,x,x13Out);
% legend('Xcross4','Xcross1');
% subplot(4,2,8);
% plot(x,x44Out,x,x14Out);
% legend('Xcross4','Xcross1');


%Circuit 5
figure('name','Circuit 5, Ring 4 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N41In);
subplot(4,2,3);
plot(x,N42In);
subplot(4,2,5);
plot(x,N43In,x,N43In_TH);
legend('N43In','N43In-TH');
subplot(4,2,7);
plot(x,N44In,x,N44In_TH);
legend('N44In','N44In-TH');
subplot(4,2,2);
plot(x,N41Out,x,N41Out_TH);
legend('N41Out','N41Out-TH');
subplot(4,2,4);
plot(x,N42Out,x,N42Out_TH);
legend('N42Out','N42Out-TH');
subplot(4,2,6);
plot(x,N43Out);
subplot(4,2,8);
plot(x,N44Out);

figure('name','Circuit 5, xcross 5 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x51In,x,x51In_TH);
legend('x51In','x51In-TH');
subplot(4,2,3);
plot(x,x52In);
subplot(4,2,5);
plot(x,x53In,x,x53In_TH);
legend('x53In','x53In-TH');
subplot(4,2,7);
plot(x,x54In,x,x54In_TH);
legend('x54In','x54In-TH');
subplot(4,2,2);
plot(x,x51Out,x,x51Out_TH);
legend('x51Out','x51Out-TH');
subplot(4,2,4);
plot(x,x52Out,x,x52Out_TH);
legend('x52Out','x52Out-TH');
subplot(4,2,6);
plot(x,x53Out,x,x53Out_TH);
legend('x53Out','x53Out-TH');
subplot(4,2,8);
plot(x,x54Out,x,x54Out_TH);
legend('x54Out','x54Out-TH');


figure('name','Circuit 5, Ring 5 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N51In);
subplot(4,2,3);
plot(x,N52In);
subplot(4,2,5);
plot(x,N53In);
subplot(4,2,7);
plot(x,N54In);
subplot(4,2,2);
plot(x,N51Out);
subplot(4,2,4);
plot(x,N52Out);
subplot(4,2,6);
plot(x,N53Out);
subplot(4,2,8);
plot(x,N54Out);

figure('name','Circuit 5, xcross 6 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x61In,x,x61In_TH);
subplot(4,2,3);
plot(x,x62In,x,x62In_TH);
subplot(4,2,5);
plot(x,x63In,x,x63In_TH);
subplot(4,2,7);
plot(x,x64In,x,x64In_TH);
subplot(4,2,2);
plot(x,x61Out,x,x61Out_TH);
subplot(4,2,4);
plot(x,x62Out,x,x62Out_TH);
subplot(4,2,6);
plot(x,x63Out,x,x63Out_TH);
subplot(4,2,8);
plot(x,x64Out,x,x64Out_TH);
% 
% 
% 
% figure('name','Ring4 VS Ring1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,N41In,x,N11In);
% legend('Ring4','Ring1'); 
% subplot(4,2,3);
% plot(x,N42In,x,N12In);
% legend('Ring4','Ring1');
% subplot(4,2,5);
% plot(x,N43In,x,N13In);
% legend('Ring4','Ring1');
% subplot(4,2,7);
% plot(x,N44In,x,N14In);
% legend('Ring4','Ring1');
% subplot(4,2,2);
% plot(x,N41Out,x,N11Out);
% legend('Ring4','Ring1');
% subplot(4,2,4);
% plot(x,N42Out,x,N12Out);
% legend('Ring4','Ring1');
% subplot(4,2,6);
% plot(x,N43Out,x,N13Out);
% legend('Ring4','Ring1');
% subplot(4,2,8);
% plot(x,N44Out,x,N14Out);
% legend('Ring4','Ring1');
% 
% figure('name','Xcross5 VS XCcross1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,x51In,x,x11In);
% legend('Xcross5','Xcross1');
% subplot(4,2,3);
% plot(x,x52In,x,x12In);
% legend('Xcross5','Xcross1');
% subplot(4,2,5);
% plot(x,x53In,x,x13In);
% legend('Xcross5','Xcross1');
% subplot(4,2,7);
% plot(x,x54In,x,x14In);
% legend('Xcross5','Xcross1');
% subplot(4,2,2);
% plot(x,x51Out,x,x11Out);
% legend('Xcross5','Xcross1');
% subplot(4,2,4);
% plot(x,x52Out,x,x12Out);
% legend('Xcross5','Xcross1');
% subplot(4,2,6);
% plot(x,x53Out,x,x13Out);
% legend('Xcross5','Xcross1');
% subplot(4,2,8);
% plot(x,x54Out,x,x14Out);
% legend('Xcross5','Xcross1');
% 
% % Ring 2 vs Rind 3 vs Ring4
% 
% figure('name','Ring 4 VS 3 VS 2 VS 1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,N41In,x,N31In,x,N21In,x,N11In);
% legend('Ring4','Ring3','Ring2','Ring1'); 
% subplot(4,2,3);
% plot(x,N42In,x,N32In,x,N22In,x,N12In);
% legend('Ring4','Ring3','Ring2','Ring1');
% subplot(4,2,5);
% plot(x,N43In,x,N33In,x,N23In,x,N13In);
% legend('Ring4','Ring3','Ring2','Ring1');
% subplot(4,2,7);
% plot(x,N44In,x,N33In,x,N23In,x,N14In);
% legend('Ring4','Ring3','Ring2','Ring1');
% subplot(4,2,2);
% plot(x,N41Out,x,N31Out,x,N21Out,x,N11Out);
% legend('Ring4','Ring3','Ring2','Ring1');
% subplot(4,2,4);
% plot(x,N42Out,x,N32Out,x,N22Out,x,N12Out);
% legend('Ring4','Ring3','Ring2','Ring1');
% subplot(4,2,6);
% plot(x,N43Out,x,N33Out,x,N23Out,x,N13Out);
% legend('Ring4','Ring3','Ring2','Ring1');
% subplot(4,2,8);
% plot(x,N44Out,x,N34Out,x,N24Out,x,N14Out);
% legend('Ring4','Ring3','Ring2','Ring1');
% 
% figure('name','XCross 6 VS 4 VS 2 VS 1 IN OUT signals','numbertitle','off');
% subplot(4,2,1);
% plot(x,x61In,x,x41In,x,x21In,x,x11In);
% legend('XCross6','XCross4','XCross2','XCross1'); 
% subplot(4,2,3);
% plot(x,x62In,x,x42In,x,x22In,x,x12In);
% legend('XCross6','XCross4','XCross2','XCross1');
% subplot(4,2,5);
% plot(x,x63In,x,x43In,x,x23In,x,x13In);
% legend('XCross6','XCross4','XCross2','XCross1');
% subplot(4,2,7);
% plot(x,x64In,x,x44In,x,x24In,x,x14In);
% legend('XCross6','XCross4','XCross2','XCross1');
% subplot(4,2,2);
% plot(x,x61Out,x,x41Out,x,x21Out,x,x11Out);
% legend('XCross6','XCross4','XCross2','XCross1');
% subplot(4,2,4);
% plot(x,x62Out,x,x42Out,x,x22Out,x,x12Out);
% legend('XCross6','XCross4','XCross2','XCross1');
% subplot(4,2,6);
% plot(x,x63Out,x,x43Out,x,x23Out,x,x13Out);
% legend('XCross6','XCross4','XCross2','XCross1');
% subplot(4,2,8);
% plot(x,x64Out,x,x44Out,x,x24Out,x,x14Out);
% legend('XCross6','XCross4','XCross2','XCross1');

%figure('name',' Node N12','numbertitle','off');
%subplot(3,2,1);
%PLOT(X,