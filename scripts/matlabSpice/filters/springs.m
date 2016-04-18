set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= 'springs';
outputFile =load('springs.1-DC.2d_dat');
mFile =load('springs.1-DC.2d_dat');
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
sr11InDB=outputFile(:,2);
sr32InDB=outputFile(:,3);
pr33InDB=outputFile(:,4);
sr34InDB=outputFile(:,5);
sr11OutDB=outputFile(:,6);
sr32OutDB=outputFile(:,7);
pr33OutDB=outputFile(:,8);
sr34OutDB=outputFile(:,9);

X11InDB=outputFile(:,10);
X11OutDB=outputFile(:,11);
X12OutDB=outputFile(:,12);
X12InDB=outputFile(:,13);
X13OutDB=outputFile(:,14);
X13InDB=outputFile(:,15);
X14OutDB=outputFile(:,16);
X14InDB=outputFile(:,17);





figure('name','6 rings  DB values','numbertitle','off');
subplot(4,2,1);
plot(x,sr11InDB);
legend('sr11InDB');
subplot(4,2,3);
plot(x,sr32InDB);
legend('sr32InDB');
subplot(4,2,5);
plot(x,pr33InDB);
legend('pr33InDB');
subplot(4,2,7);
plot(x,sr34InDB);
legend('sr34InDB');

subplot(4,2,2);
plot(x,sr11OutDB);
legend('sr11OutDB');
subplot(4,2,4);
plot(x,sr32OutDB);
legend('sr32OutDB');
subplot(4,2,6);
plot(x,pr33OutDB);
legend('pr33OutDB');
subplot(4,2,8);
plot(x,sr34OutDB);
legend('sr34OutDB');


figure('name','6 rings in a subcircuit DB values','numbertitle','off');
subplot(4,2,1);
plot(x,X11InDB);
legend('X11InDB');
subplot(4,2,3);
plot(x,X12InDB);
legend('X12InDB');
subplot(4,2,5);
plot(x,X13InDB);
legend('X13InDB');
subplot(4,2,7);
plot(x,X14InDB);
legend('X14InDB');

subplot(4,2,2);
plot(x,X11OutDB);
legend('X11OutDB');
subplot(4,2,4);
plot(x,X12OutDB);
legend('X12OuttDB');
subplot(4,2,6);
plot(x,X13OutDB);
legend('X13OutDB');
subplot(4,2,8);
plot(x,X14OutDB);
legend('X14IDB');