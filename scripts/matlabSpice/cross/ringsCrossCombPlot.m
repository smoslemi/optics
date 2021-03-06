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

%Circuit 2, x1
x11In=output(:,10); % x11 in
x12In=output(:,11); % x12 in 
x13In=output(:,12); % x13 in
x14In=output(:,13); % x14 in
x11Out=output(:,14); % x11 out
x12Out=output(:,15); % x11 out
x13Out=output(:,16);
x14Out=output(:,17);

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




%figure;

%Circuit 1
figure('name','Circuit 1, Ring 1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N11In);
subplot(4,2,3);
plot(x,N12In);
subplot(4,2,5);
plot(x,N13In);
subplot(4,2,7);
plot(x,N14In);
subplot(4,2,2);
plot(x,N11Out);
subplot(4,2,4);
plot(x,N12Out);
subplot(4,2,6);
plot(x,N13Out);
subplot(4,2,8);
plot(x,N14Out);

figure('name','Circuit 1, N11In = N12In + N13Out?','numbertitle','off');
plot(x, 10.^(N11In), x, 10.^(N12In/20)+10.^(N13Out/20));

%Circuit 2
figure('name','Circuit 2, xcross 1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x11In);
subplot(4,2,3);
plot(x,x12In);
subplot(4,2,5);
plot(x,x13In);
subplot(4,2,7);
plot(x,x14In);
subplot(4,2,2);
plot(x,x11Out);
subplot(4,2,4);
plot(x,x12Out);
subplot(4,2,6);
plot(x,x13Out);
subplot(4,2,8);
plot(x,x14Out);

%Circuit 3
figure('name','Circuit 3, Ring 2 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N21In);
subplot(4,2,3);
plot(x,N22In);
subplot(4,2,5);
plot(x,N23In);
subplot(4,2,7);
plot(x,N24In);
subplot(4,2,2);
plot(x,N21Out);
subplot(4,2,4);
plot(x,N22Out);
subplot(4,2,6);
plot(x,N23Out);
subplot(4,2,8);
plot(x,N24Out);

figure('name','Circuit 3, xcross 2 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x21In);
subplot(4,2,3);
plot(x,x22In);
subplot(4,2,5);
plot(x,x23In);
subplot(4,2,7);
plot(x,x24In);
subplot(4,2,2);
plot(x,x21Out);
subplot(4,2,4);
plot(x,x22Out);
subplot(4,2,6);
plot(x,x23Out);
subplot(4,2,8);
plot(x,x24Out);

%Compare Ring2 and Ring1

figure('name','Ring2 VS Ring1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N21In,x,N11In);
legend('Ring2','Ring1');
grid on;
grid minor;
subplot(4,2,3);
plot(x,N22In,x,N12In);
legend('Ring2','Ring1');
subplot(4,2,5);
plot(x,N23In,x,N13In);
legend('Ring2','Ring1');
subplot(4,2,7);
plot(x,N24In,x,N14In);
legend('Ring2','Ring1');
subplot(4,2,2);
plot(x,N21Out,x,N11Out);
legend('Ring2','Ring1');
subplot(4,2,4);
plot(x,N22Out,x,N12Out);
legend('Ring2','Ring1');
subplot(4,2,6);
plot(x,N23Out,x,N13Out);
legend('Ring2','Ring1');
subplot(4,2,8);
plot(x,N24Out,x,N14Out);
legend('Ring2','Ring1');

figure('name','Xcross2 VS XCcross1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x21In,x,x11In);
legend('Xcross2','Xcross1');
subplot(4,2,3);
plot(x,x22In,x,x12In);
legend('Xcross2','Xcross1');
subplot(4,2,5);
plot(x,x23In,x,x13In);
legend('Xcross2','Xcross1');
subplot(4,2,7);
plot(x,x24In,x,x14In);
legend('Xcross2','Xcross1');
subplot(4,2,2);
plot(x,x21Out,x,x11Out);
legend('Xcross2','Xcross1');
subplot(4,2,4);
plot(x,x22Out,x,x12Out);
legend('Xcross2','Xcross1');
subplot(4,2,6);
plot(x,x23Out,x,x13Out);
legend('Xcross2','Xcross1');
subplot(4,2,8);
plot(x,x24Out,x,x14Out);
legend('Xcross2','Xcross1');

%Circuit 4
figure('name','Circuit 4, Ring 3 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N31In);
subplot(4,2,3);
plot(x,N32In);
subplot(4,2,5);
plot(x,N33In);
subplot(4,2,7);
plot(x,N34In);
subplot(4,2,2);
plot(x,N31Out);
subplot(4,2,4);
plot(x,N32Out);
subplot(4,2,6);
plot(x,N33Out);
subplot(4,2,8);
plot(x,N34Out);

figure('name','Circuit 4, xcross 3 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x31In);
subplot(4,2,3);
plot(x,x32In);
subplot(4,2,5);
plot(x,x33In);
subplot(4,2,7);
plot(x,x34In);
subplot(4,2,2);
plot(x,x31Out);
subplot(4,2,4);
plot(x,x32Out);
subplot(4,2,6);
plot(x,x33Out);
subplot(4,2,8);
plot(x,x34Out);

figure('name','Circuit 4, xcross 4 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x41In);
subplot(4,2,3);
plot(x,x42In);
subplot(4,2,5);
plot(x,x43In);
subplot(4,2,7);
plot(x,x44In);
subplot(4,2,2);
plot(x,x41Out);
subplot(4,2,4);
plot(x,x42Out);
subplot(4,2,6);
plot(x,x43Out);
subplot(4,2,8);
plot(x,x44Out);

%Compare Ring3 and Ring1

figure('name','Ring3 VS Ring1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N31In,x,N11In);
legend('Ring3','Ring1'); 
subplot(4,2,3);
plot(x,N32In,x,N12In);
legend('Ring3','Ring1');
subplot(4,2,5);
plot(x,N33In,x,N13In);
legend('Ring3','Ring1');
subplot(4,2,7);
plot(x,N34In,x,N14In);
legend('Ring3','Ring1');
subplot(4,2,2);
plot(x,N31Out,x,N11Out);
legend('Ring3','Ring1');
subplot(4,2,4);
plot(x,N32Out,x,N12Out);
legend('Ring3','Ring1');
subplot(4,2,6);
plot(x,N33Out,x,N13Out);
legend('Ring3','Ring1');
subplot(4,2,8);
plot(x,N34Out,x,N14Out);
legend('Ring3','Ring1');

figure('name','Xcross3 VS XCcross1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x31In,x,x11In);
legend('Xcross3','Xcross1');
subplot(4,2,3);
plot(x,x32In,x,x12In);
legend('Xcross3','Xcross1');
subplot(4,2,5);
plot(x,x33In,x,x13In);
legend('Xcross3','Xcross1');
subplot(4,2,7);
plot(x,x34In,x,x14In);
legend('Xcross3','Xcross1');
subplot(4,2,2);
plot(x,x31Out,x,x11Out);
legend('Xcross3','Xcross1');
subplot(4,2,4);
plot(x,x32Out,x,x12Out);
legend('Xcross3','Xcross1');
subplot(4,2,6);
plot(x,x33Out,x,x13Out);
legend('Xcross3','Xcross1');
subplot(4,2,8);
plot(x,x34Out,x,x14Out);
legend('Xcross3','Xcross1');


figure('name','Xcross4 VS XCcross1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x41In,x,x11In);
legend('Xcross4','Xcross1');
subplot(4,2,3);
plot(x,x42In,x,x12In);
legend('Xcross4','Xcross1');
subplot(4,2,5);
plot(x,x43In,x,x13In);
legend('Xcross4','Xcross1');
subplot(4,2,7);
plot(x,x44In,x,x14In);
legend('Xcross4','Xcross1');
subplot(4,2,2);
plot(x,x41Out,x,x11Out);
legend('Xcross4','Xcross1');
subplot(4,2,4);
plot(x,x42Out,x,x12Out);
legend('Xcross4','Xcross1');
subplot(4,2,6);
plot(x,x43Out,x,x13Out);
legend('Xcross4','Xcross1');
subplot(4,2,8);
plot(x,x44Out,x,x14Out);
legend('Xcross4','Xcross1');


%Circuit 5
figure('name','Circuit 5, Ring 4 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N41In);
subplot(4,2,3);
plot(x,N42In);
subplot(4,2,5);
plot(x,N43In);
subplot(4,2,7);
plot(x,N44In);
subplot(4,2,2);
plot(x,N41Out);
subplot(4,2,4);
plot(x,N42Out);
subplot(4,2,6);
plot(x,N43Out);
subplot(4,2,8);
plot(x,N44Out);

figure('name','Circuit 5, xcross 5 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x51In);
subplot(4,2,3);
plot(x,x52In);
subplot(4,2,5);
plot(x,x53In);
subplot(4,2,7);
plot(x,x54In);
subplot(4,2,2);
plot(x,x51Out);
subplot(4,2,4);
plot(x,x52Out);
subplot(4,2,6);
plot(x,x53Out);
subplot(4,2,8);
plot(x,x54Out);


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
plot(x,x61In);
subplot(4,2,3);
plot(x,x62In);
subplot(4,2,5);
plot(x,x63In);
subplot(4,2,7);
plot(x,x64In);
subplot(4,2,2);
plot(x,x61Out);
subplot(4,2,4);
plot(x,x62Out);
subplot(4,2,6);
plot(x,x63Out);
subplot(4,2,8);
plot(x,x64Out);



figure('name','Ring4 VS Ring1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N41In,x,N11In);
legend('Ring4','Ring1'); 
subplot(4,2,3);
plot(x,N42In,x,N12In);
legend('Ring4','Ring1');
subplot(4,2,5);
plot(x,N43In,x,N13In);
legend('Ring4','Ring1');
subplot(4,2,7);
plot(x,N44In,x,N14In);
legend('Ring4','Ring1');
subplot(4,2,2);
plot(x,N41Out,x,N11Out);
legend('Ring4','Ring1');
subplot(4,2,4);
plot(x,N42Out,x,N12Out);
legend('Ring4','Ring1');
subplot(4,2,6);
plot(x,N43Out,x,N13Out);
legend('Ring4','Ring1');
subplot(4,2,8);
plot(x,N44Out,x,N14Out);
legend('Ring4','Ring1');

figure('name','Xcross5 VS XCcross1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x51In,x,x11In);
legend('Xcross5','Xcross1');
subplot(4,2,3);
plot(x,x52In,x,x12In);
legend('Xcross5','Xcross1');
subplot(4,2,5);
plot(x,x53In,x,x13In);
legend('Xcross5','Xcross1');
subplot(4,2,7);
plot(x,x54In,x,x14In);
legend('Xcross5','Xcross1');
subplot(4,2,2);
plot(x,x51Out,x,x11Out);
legend('Xcross5','Xcross1');
subplot(4,2,4);
plot(x,x52Out,x,x12Out);
legend('Xcross5','Xcross1');
subplot(4,2,6);
plot(x,x53Out,x,x13Out);
legend('Xcross5','Xcross1');
subplot(4,2,8);
plot(x,x54Out,x,x14Out);
legend('Xcross5','Xcross1');

% Ring 2 vs Rind 3 vs Ring4

figure('name','Ring 4 VS 3 VS 2 VS 1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,N41In,x,N31In,x,N21In,x,N11In);
legend('Ring4','Ring3','Ring2','Ring1'); 
subplot(4,2,3);
plot(x,N42In,x,N32In,x,N22In,x,N12In);
legend('Ring4','Ring3','Ring2','Ring1');
subplot(4,2,5);
plot(x,N43In,x,N33In,x,N23In,x,N13In);
legend('Ring4','Ring3','Ring2','Ring1');
subplot(4,2,7);
plot(x,N44In,x,N33In,x,N23In,x,N14In);
legend('Ring4','Ring3','Ring2','Ring1');
subplot(4,2,2);
plot(x,N41Out,x,N31Out,x,N21Out,x,N11Out);
legend('Ring4','Ring3','Ring2','Ring1');
subplot(4,2,4);
plot(x,N42Out,x,N32Out,x,N22Out,x,N12Out);
legend('Ring4','Ring3','Ring2','Ring1');
subplot(4,2,6);
plot(x,N43Out,x,N33Out,x,N23Out,x,N13Out);
legend('Ring4','Ring3','Ring2','Ring1');
subplot(4,2,8);
plot(x,N44Out,x,N34Out,x,N24Out,x,N14Out);
legend('Ring4','Ring3','Ring2','Ring1');

figure('name','XCross 6 VS 4 VS 2 VS 1 IN OUT signals','numbertitle','off');
subplot(4,2,1);
plot(x,x61In,x,x41In,x,x21In,x,x11In);
legend('XCross6','XCross4','XCross2','XCross1'); 
subplot(4,2,3);
plot(x,x62In,x,x42In,x,x22In,x,x12In);
legend('XCross6','XCross4','XCross2','XCross1');
subplot(4,2,5);
plot(x,x63In,x,x43In,x,x23In,x,x13In);
legend('XCross6','XCross4','XCross2','XCross1');
subplot(4,2,7);
plot(x,x64In,x,x44In,x,x24In,x,x14In);
legend('XCross6','XCross4','XCross2','XCross1');
subplot(4,2,2);
plot(x,x61Out,x,x41Out,x,x21Out,x,x11Out);
legend('XCross6','XCross4','XCross2','XCross1');
subplot(4,2,4);
plot(x,x62Out,x,x42Out,x,x22Out,x,x12Out);
legend('XCross6','XCross4','XCross2','XCross1');
subplot(4,2,6);
plot(x,x63Out,x,x43Out,x,x23Out,x,x13Out);
legend('XCross6','XCross4','XCross2','XCross1');
subplot(4,2,8);
plot(x,x64Out,x,x44Out,x,x24Out,x,x14Out);
legend('XCross6','XCross4','XCross2','XCross1');

%figure('name',' Node N12','numbertitle','off');
%subplot(3,2,1);
%PLOT(X,