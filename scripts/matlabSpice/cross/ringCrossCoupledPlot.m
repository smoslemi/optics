set(0,'DefaultFigureWindowStyle','docked')
basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/cross/';
%base = 'ringCross';
base = 'ringCrossCoupled';
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
output = load('ringCrossCoupled.0-DC.2d_dat');
%x=ringCross_0_DC(:,1);
%y1=ringCross_0_DC(:,2);
x=output(:,1);
y1=output(:,2);
y2=output(:,3);
y3=output(:,4);
y4=output(:,5);
y5=output(:,6);
y6=output(:,7);
y7=output(:,8);
y8=output(:,9);
y9=output(:,10);
y10=output(:,11);
y11=output(:,12);
y12=output(:,13);
y13=output(:,14);
y14=output(:,15);
y15=output(:,16);
y16=output(:,17);


figure;
subplot(2,2,1);
plot(x,y1);
subplot(2,2,2);
plot(x,y2);
subplot(2,2,3);
plot(x,y3);
subplot(2,2,4);
plot(x,y4);


figure;
subplot(2,2,1);
plot(x,y5);
subplot(2,2,2);
plot(x,y6);
subplot(2,2,3);
plot(x,y7);
subplot(2,2,4);
plot(x,y8);

figure;
subplot(2,2,1);
plot(x,y9);
subplot(2,2,2);
plot(x,y10);
subplot(2,2,3);
plot(x,y11);
subplot(2,2,4);
plot(x,y12);


figure;
subplot(2,2,1);
plot(x,y13);
subplot(2,2,2);
plot(x,y14);
subplot(2,2,3);
plot(x,y15);
subplot(2,2,4);
plot(x,y16);
