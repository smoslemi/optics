set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= '3srings';
outputFile =load('3srings.1-DC.2d_dat');
mFile =load('3srings.1-DC.2d_dat');
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
Nc1r11InDB=outputFile(:,2);
Nc1r12InDB=outputFile(:,3);
Nc1r13InDB=outputFile(:,4);
Nc1r14InDB=outputFile(:,5);
Nc1r11OutDB=outputFile(:,6);
Nc1r12OutDB=outputFile(:,7);
Nc1r13OutDB=outputFile(:,8);
Nc1r14OutDB=outputFile(:,9);

Nc1r21InDB=outputFile(:,10);
Nc1r22InDB=outputFile(:,11);
Nc1r23InDB=outputFile(:,12);
Nc1r24InDB=outputFile(:,13);
Nc1r21OutDB=outputFile(:,14);
Nc1r22OutDB=outputFile(:,15);
Nc1r23OutDB=outputFile(:,16);
Nc1r24OutDB=outputFile(:,17);

Nc1r31InDB=outputFile(:,18);
Nc1r32InDB=outputFile(:,19);
Nc1r33InDB=outputFile(:,20);
Nc1r34InDB=outputFile(:,21);
Nc1r31OutDB=outputFile(:,22);
Nc1r32OutDB=outputFile(:,23);
Nc1r33OutDB=outputFile(:,24);
Nc1r34OutDB=outputFile(:,25);




Nc2r11InDB=outputFile(:,26);
Nc2r12InDB=outputFile(:,27);
Nc2r13InDB=outputFile(:,28);
Nc2r14InDB=outputFile(:,29);
Nc2r11OutDB=outputFile(:,30);
Nc2r12OutDB=outputFile(:,31);
Nc2r13OutDB=outputFile(:,32);
Nc2r14OutDB=outputFile(:,33);

Nc2r21InDB=outputFile(:,34);
Nc2r22InDB=outputFile(:,35);
Nc2r23InDB=outputFile(:,36);
Nc2r24InDB=outputFile(:,37);
Nc2r21OutDB=outputFile(:,38);
Nc2r22OutDB=outputFile(:,39);
Nc2r23OutDB=outputFile(:,40);
Nc2r24OutDB=outputFile(:,41);

Nc2r31InDB=outputFile(:,42);
Nc2r32InDB=outputFile(:,43);
Nc2r33InDB=outputFile(:,44);
Nc2r34InDB=outputFile(:,45);
Nc2r31OutDB=outputFile(:,46);
Nc2r32OutDB=outputFile(:,47);
Nc2r33OutDB=outputFile(:,48);
Nc2r34OutDB=outputFile(:,49);

Nc3X11InDB=outputFile(:,50);
Nc3X12InDB=outputFile(:,51);
Nc3X13InDB=outputFile(:,52);
Nc3X14InDB=outputFile(:,53);
Nc3X11OutDB=outputFile(:,54);
Nc3X12OutDB=outputFile(:,55);
Nc3X13OutDB=outputFile(:,56);
Nc3X14OutDB=outputFile(:,57);

c4X11InDB=outputFile(:,58);
c4X12InDB=outputFile(:,59);
c4X13InDB=outputFile(:,60);
c4X14InDB=outputFile(:,61);
c4X11OutDB=outputFile(:,62);
c4X12OutDB=outputFile(:,63);
c4X13OutDB=outputFile(:,64);
c4X14OutDB=outputFile(:,65);



figure('name','3 rings in series DB values, Ring1 ,2,3 ','numbertitle','off');
subplot(4,2,1);
plot(x,Nc1r11InDB,x,Nc1r21InDB,x,Nc1r31InDB);
legend('Nc1r11InDB','Nc1r21InDB','Nc1r31InDB');
subplot(4,2,3);
plot(x,Nc1r12InDB,x,Nc1r22InDB,x,Nc1r32InDB);
legend('Nc1r12InDB','Nc1r22InDB','Nc1r32InDB');
subplot(4,2,5);
plot(x,Nc1r13InDB,x,Nc1r23InDB,x,Nc1r33InDB);
legend('Nc1r13InDB','Nc1r23InDB','Nc1r33InDB');
subplot(4,2,7);
plot(x,Nc1r14InDB,x,Nc1r24InDB,x,Nc1r34InDB);
legend('Nc1r14InDB','Nc1r24InDB','Nc1r34InDB');

subplot(4,2,2);
plot(x,Nc1r11OutDB,x,Nc1r21OutDB,x,Nc1r31OutDB);
legend('Nc1r11OutDB','Nc1r21OutDB','Nc1r31OutDB');
subplot(4,2,4);
plot(x,Nc1r12OutDB,x,Nc1r22OutDB,x,Nc1r32OutDB);
legend('Nc1r12OutDB','Nc1r22OutDB','Nc1r32OutDB');
subplot(4,2,6);
plot(x,Nc1r13OutDB,x,Nc1r23OutDB,x,Nc1r33OutDB);
legend('Nc1r13OutDB','Nc1r23OutDB','Nc1r33OutDB');
subplot(4,2,8);
plot(x,Nc1r14OutDB,x,Nc1r24OutDB,x,Nc1r34OutDB);
legend('Nc1r14OutDB','Nc1r24OutDB','Nc1r34OutDB');


figure('name','3 rings in Parralel DB values, Ring1 ,2,3 ','numbertitle','off');
subplot(4,2,1);
plot(x,Nc2r11InDB,x,Nc2r21InDB,x,Nc2r31InDB);
legend('Nc2r11InDB','Nc2r21InDB','Nc2r31InDB');
subplot(4,2,3);
plot(x,Nc2r12InDB,x,Nc2r22InDB,x,Nc2r32InDB);
legend('Nc2r12InDB','Nc2r22InDB','Nc2r32InDB');
subplot(4,2,5);
plot(x,Nc2r13InDB,x,Nc2r23InDB,x,Nc2r33InDB);
legend('Nc2r13InDB','Nc2r23InDB','Nc2r33InDB');
subplot(4,2,7);
plot(x,Nc2r14InDB,x,Nc2r24InDB,x,Nc2r34InDB);
legend('Nc2r14InDB','Nc2r24InDB','Nc2r34InDB');

subplot(4,2,2);
plot(x,Nc2r11OutDB,x,Nc2r21OutDB,x,Nc2r31OutDB);
legend('Nc2r11OutDB','Nc2r21OutDB','Nc2r31OutDB');
subplot(4,2,4);
plot(x,Nc2r12OutDB,x,Nc2r22OutDB,x,Nc2r32OutDB);
legend('Nc2r12OutDB','Nc2r22OutDB','Nc2r32OutDB');
subplot(4,2,6);
plot(x,Nc2r13OutDB,x,Nc2r23OutDB,x,Nc2r33OutDB);
legend('Nc2r13OutDB','Nc2r23OutDB','Nc2r33OutDB');
subplot(4,2,8);
plot(x,Nc2r14OutDB,x,Nc2r24OutDB,x,Nc2r34OutDB);
legend('Nc2r14OutDB','Nc2r24OutDB','Nc2r34OutDB');

figure('name','6 rings in a subcircuit DB values','numbertitle','off');
subplot(4,2,1);
plot(x,Nc3X11InDB);
legend('Nc3X11InDB');
subplot(4,2,3);
plot(x,Nc3X12InDB);
legend('Nc3X12InDB');
subplot(4,2,5);
plot(x,Nc3X13InDB);
legend('Nc3X13InDB');
subplot(4,2,7);
plot(x,Nc3X14InDB);
legend('Nc3X14InDB');

subplot(4,2,2);
plot(x,Nc3X11OutDB);
legend('Nc3X11OutDB');
subplot(4,2,4);
plot(x,Nc3X12OutDB);
legend('Nc3X12OutDB');
subplot(4,2,6);
plot(x,Nc3X13OutDB);
legend('Nc3X13OutDB');
subplot(4,2,8);
plot(x,Nc3X14OutDB);
legend('Nc3X14OutDB');


figure('name','6 rings in a subcircuit DB values','numbertitle','off');
subplot(4,2,1);
plot(x,c4X11InDB);
legend('c4X11InDB');
subplot(4,2,3);
plot(x,c4X12InDB);
legend('c4X12InDB');
subplot(4,2,5);
plot(x,c4X13InDB);
legend('c4X13InDB');
subplot(4,2,7);
plot(x,c4X14InDB);
legend('c4X14InDB');

subplot(4,2,2);
plot(x,c4X11OutDB);
legend('c4X11OutDB');
subplot(4,2,4);
plot(x,c4X12OutDB);
legend('c4X12OutDB');
subplot(4,2,6);
plot(x,c4X13OutDB);
legend('c4X13OutDB');
subplot(4,2,8);
plot(x,c4X14OutDB);
legend('c4X14OutDB');