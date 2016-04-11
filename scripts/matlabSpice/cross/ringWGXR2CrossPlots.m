set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= 'ringWGXR2CrossLittle';
outputFile =load('ringWGXR2CrossLittle.1-DC.2d_dat');
Ref1=0.1;
TH1=0.9;
Right1= 0.1;
Left1= 0.1;

basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/cross/';




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

x11In=10.^(outputFile(:,10)./20);
x12In=10.^(outputFile(:,11)./20);
x13In=10.^(outputFile(:,12)./20);
x14In=10.^(outputFile(:,13)./20);
x11Out=10.^(outputFile(:,14)./20);
x12Out=10.^(outputFile(:,15)./20);
x13Out=10.^(outputFile(:,16)./20);
x14Out=10.^(outputFile(:,17)./20);

w4x1nIn=10.^(outputFile(:,18)./20);
w4x1nOut=10.^(outputFile(:,19)./20);

x21In=10.^(outputFile(:,20)./20);
x22In=10.^(outputFile(:,21)./20);
x23In=10.^(outputFile(:,22)./20);
x24In=10.^(outputFile(:,23)./20);
x21Out=10.^(outputFile(:,24)./20);
x22Out=10.^(outputFile(:,25)./20);
x23Out=10.^(outputFile(:,26)./20);
x24Out=10.^(outputFile(:,27)./20);

w2x2sIn=10.^(outputFile(:,28)./20);
w3x2eIn=10.^(outputFile(:,29)./20);
w4x2nIn=10.^(outputFile(:,30)./20);

w2x2sOut=10.^(outputFile(:,31)./20);
w3x2eOut=10.^(outputFile(:,32)./20);
w4x2nOut=10.^(outputFile(:,33)./20);

% db vlues
N11InDB=outputFile(:,2);
N12InDB=outputFile(:,3);
N13InDB=outputFile(:,4);
N14InDB=outputFile(:,5);
N11OutDB=outputFile(:,6);
N12OutDB=outputFile(:,7);
N13OutDB=outputFile(:,8);
N14OutDB=outputFile(:,9);

x11InDB=outputFile(:,10);
x12InDB=outputFile(:,11);
x13InDB=outputFile(:,12);
x14InDB=outputFile(:,13);
x11OutDB=outputFile(:,14);
x12OutDB=outputFile(:,15);
x13OutDB=outputFile(:,16);
x14OutDB=outputFile(:,17);

w4x1nInDB=outputFile(:,18);
w4x1nOutDB=outputFile(:,19);

x21InDB=outputFile(:,20);
x22InDB=outputFile(:,21);
x23InDB=outputFile(:,22);
x24InDB=outputFile(:,23);
x21OutDB=outputFile(:,24);
x22OutDB=outputFile(:,25);
x23OutDB=outputFile(:,26);
x24OutDB=outputFile(:,27);

w2x2sInDB=outputFile(:,28);
w3x2eInDB=outputFile(:,29);
w4x2nInDB=outputFile(:,30);

w2x2sOutDB=outputFile(:,31);
w3x2eOutDB=outputFile(:,32);
w4x2nOutDB=outputFile(:,33);


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


figure('name','Circuit Main DB values, CROSS 1','numbertitle','off');
subplot(4,2,1);
plot(x,x11InDB);
legend('x11InDB');
subplot(4,2,3);
plot(x,x12InDB);
legend('x12InDB');
subplot(4,2,5);
plot(x,x13InDB);
legend('x13InDB');
subplot(4,2,7);
plot(x,x14InDB);
legend('x14InDB');

subplot(4,2,2);
plot(x,x11OutDB);
legend('x11OutDB');
subplot(4,2,4);
plot(x,x12OutDB);
legend('x12OutDB');
subplot(4,2,6);
plot(x,x13OutDB);
legend('x13OutDB');
subplot(4,2,8);
plot(x,x14OutDB);
legend('x14OutDB');

figure('name','Circuit Main DB values, CROSS 2','numbertitle','off');
subplot(4,2,1);
plot(x,x21InDB);
legend('x21InDB');
subplot(4,2,3);
plot(x,x22InDB);
legend('x22InDB');
subplot(4,2,5);
plot(x,x23InDB);
legend('x23InDB');
subplot(4,2,7);
plot(x,x24InDB);
legend('x24InDB');

subplot(4,2,2);
plot(x,x21OutDB);
legend('x21OutDB');
subplot(4,2,4);
plot(x,x22OutDB);
legend('x22OutDB');
subplot(4,2,6);
plot(x,x23OutDB);
legend('x23OutDB');
subplot(4,2,8);
plot(x,x24OutDB);
legend('x24OutDB');


figure('name','Circuit Main DB values, Ring Drop and cross Outs','numbertitle','off');
%subplot(4,2,3);
plot(x,N12InDB,x,x13OutDB,x,x14OutDB);
legend('N12InDB','x14OutDB','x24OutDB');





