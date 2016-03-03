set(0,'DefaultFigureWindowStyle','docked')
basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/cross/';
%base = 'ringCross';
base = 'rings2CrossCoupled';
basefile = strcat(base,'.sp');
baseFileFull = strcat(basePath,basefile);
dateStamp = datestr(now,'ddmmmyy_HHMM');
display(dateStamp);
snapshot = strcat('ringCross_', dateStamp);
display(snapshot);
% mkdir(snapshot);
snapshotFull=strcat('./',snapshot)
% cd(snapshotFull);
system(pwd);
output = load('rings2CrossCoupled.0-DC.2d_dat');
%x=ringCross_0_DC(:,1);
%N11In=ringCross_0_DC(:,2);
x=output(:,1);
N11In=output(:,2); % N11 in
N12In=output(:,3); % N12 in
N13In=output(:,4); % N13 in
N14In=output(:,5); % N14 in
N11Out=output(:,6); % N11 out
N12Out=output(:,7); % N12 out
N13Out=output(:,8); % N13 out 
N14Out=output(:,9); % N14 out
x11In=output(:,10); % x11 in
x12In=output(:,11); % x12 in 
x13In=output(:,12); % x13 in
x14In=output(:,13); % x14 in
x11Out=output(:,14); % x11 out
x12Out=output(:,15); % x11 out
x13Out=output(:,16);
x14Out=output(:,17);
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


%figure;
figure('name','Ring 1 IN signals','numbertitle','off');
subplot(2,2,1);
plot(x,N11In);
subplot(2,2,2);
plot(x,N12In);
subplot(2,2,3);
plot(x,N13In);
subplot(2,2,4);
plot(x,N14In);


figure('name','Ring 1 OUT signals','numbertitle','off');
subplot(2,2,1);
plot(x,N11Out);
subplot(2,2,2);
plot(x,N12Out);
subplot(2,2,3);
plot(x,N13Out);
subplot(2,2,4);
plot(x,N14Out);

figure('name','Cross 1 IN signals','numbertitle','off');
subplot(2,2,1);
plot(x,x11In);
subplot(2,2,2);
plot(x,x12In);
subplot(2,2,3);
plot(x,x13In);
subplot(2,2,4);
plot(x,x14In);


figure('name','Cross 1 OUT signals','numbertitle','off');
subplot(2,2,1);
plot(x,x11Out);
subplot(2,2,2);
plot(x,x12Out);
subplot(2,2,3);
plot(x,x13Out);
subplot(2,2,4);
plot(x,x14Out);

figure('name','Ring 2 IN signals','numbertitle','off');
subplot(2,2,1);
plot(x,N21In);
subplot(2,2,2);
plot(x,N22In);
subplot(2,2,3);
plot(x,N23In);
subplot(2,2,4);
plot(x,N24In);


figure('name','Ring 2 OUT signals','numbertitle','off');
subplot(2,2,1);
plot(x,N21Out);
subplot(2,2,2);
plot(x,N22Out);
subplot(2,2,3);
plot(x,N23Out);
subplot(2,2,4);
plot(x,N24Out);

figure('name','Cross 2 IN signals','numbertitle','off');
subplot(2,2,1);
plot(x,x21In);
subplot(2,2,2);
plot(x,x22In);
subplot(2,2,3);
plot(x,x23In);
subplot(2,2,4);
plot(x,x24In);


figure('name','Cross 2 OUT signals','numbertitle','off');
subplot(2,2,1);
plot(x,x21Out);
subplot(2,2,2);
plot(x,x22Out);
subplot(2,2,3);
plot(x,x23Out);
subplot(2,2,4);
plot(x,x24Out);

%figure('name',' Node N12','numbertitle','off');
%subplot(3,2,1);
%PLOT(X,