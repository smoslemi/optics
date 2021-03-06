set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= '2ch6RingAddDropFiler';
outputFile =load('2ch6RingAddDropFilter.1-DC.2d_dat');
mFile =load('2ch6RingAddDropFilter.1-DC.2d_dat');
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
c1N11InDB=outputFile(:,2);
c1N12OutDB=outputFile(:,3);
c1N13OutDB=outputFile(:,6);
c1N14OutDB=outputFile(:,8);
c1N11OutDB=outputFile(:,3);
c1N12InDB=outputFile(:,5);
c1N13InDB=outputFile(:,7);
c1N14InDB=outputFile(:,9);

c1N21InDB=outputFile(:,10);
c1N22OutDB=outputFile(:,12);
c1N23OutDB=outputFile(:,14);
c1N24OutDB=outputFile(:,16);
c1N21OutDB=outputFile(:,11);
c1N22InDB=outputFile(:,13);
c1N23InDB=outputFile(:,15);
c1N24InDB=outputFile(:,17);



rN11InDB=outputFile(:,18);
rN12OutDB=outputFile(:,20);
rN13OutDB=outputFile(:,22);
rN14OutDB=outputFile(:,24);
rN11OutDB=outputFile(:,19);
rN12InDB=outputFile(:,21);
rN13InDB=outputFile(:,23);
rN14InDB=outputFile(:,25);

rN21InDB=outputFile(:,26);
rN22OutDB=outputFile(:,28);
rN23OutDB=outputFile(:,30);
rN24OutDB=outputFile(:,32);
rN21OutDB=outputFile(:,27);
rN22InDB=outputFile(:,29);
rN23InDB=outputFile(:,31);
rN24InDB=outputFile(:,33);


c2ring1N11InDB=outputFile(:,34);
c2ring1N12InDB=outputFile(:,35);
c2ring1N13InDB=outputFile(:,36);
c2ring1N14InDB=outputFile(:,37);
c2ring1N11OutDB=outputFile(:,38);
c2ring1N12OutDB=outputFile(:,39);
c2ring1N13OutDB=outputFile(:,40);
c2ring1N14OutDB=outputFile(:,41);

c2ring2N21InDB=outputFile(:,42);
c2ring2N22InDB=outputFile(:,43);
c2ring2N23InDB=outputFile(:,44);
c2ring2N24InDB=outputFile(:,45);
c2ring2N21OutDB=outputFile(:,46);
c2ring2N22OutDB=outputFile(:,47);
c2ring2N23OutDB=outputFile(:,48);
c2ring2N24OutDB=outputFile(:,49);


figure('name','Circuit 1 DB values, Ring1','numbertitle','off');
subplot(4,2,1);
plot(x,c1N11InDB);
legend('c1N11InDB');
subplot(4,2,3);
plot(x,c1N12InDB);
legend('c1N12InDB');
subplot(4,2,5);
plot(x,c1N13InDB);
legend('c1N13InDB');
subplot(4,2,7);
plot(x,c1N14InDB);
legend('c1N14InDB');

subplot(4,2,2);
plot(x,c1N11OutDB);
legend('c1N11OutDB');
subplot(4,2,4);
plot(x,c1N12OutDB);
legend('c1N12OutDB');
subplot(4,2,6);
plot(x,c1N13OutDB);
legend('c1N13OutDB');
subplot(4,2,8);
plot(x,c1N14OutDB);
legend('c1N14OutDB');


figure('name','Circuit 1 DB values, Ring2','numbertitle','off');
subplot(4,2,1);
plot(x,c1N21InDB);
legend('c1N21InDB');
subplot(4,2,3);
plot(x,c1N22InDB);
legend('c1N22InDB');
subplot(4,2,5);
plot(x,c1N23InDB);
legend('c1N23InDB');
subplot(4,2,7);
plot(x,c1N24InDB);
legend('c1N24InDB');

subplot(4,2,2);
plot(x,c1N21OutDB);
legend('c1N21OutDB');
subplot(4,2,4);
plot(x,c1N22OutDB);
legend('c1N22OutDB');
subplot(4,2,6);
plot(x,c1N23OutDB);
legend('c1N23OutDB');
subplot(4,2,8);
plot(x,c1N24OutDB);
legend('c1N24OutDB');

figure('name','Circuit 2 , Ring1','numbertitle','off');
subplot(4,2,1);
plot(x,rN11InDB);
legend('rN11InDB');
subplot(4,2,3);
plot(x,rN12InDB);
legend('rN12InDB');
subplot(4,2,5);
plot(x,rN13InDB);
legend('rN13InDB');
subplot(4,2,7);
plot(x,rN14InDB);
legend('rN14InDB');

subplot(4,2,2);
plot(x,rN11OutDB);
legend('rN11OutDB');
subplot(4,2,4);
plot(x,rN12OutDB);
legend('rN12OutDB');
subplot(4,2,6);
plot(x,rN13OutDB);
legend('rN13OutDB');
subplot(4,2,8);
plot(x,rN14OutDB);
legend('rN14OutDB');


figure('name','Circuit 2 , Ring2','numbertitle','off');
subplot(4,2,1);
plot(x,rN21InDB);
legend('rN21InDB');
subplot(4,2,3);
plot(x,rN22InDB);
legend('rN22InDB');
subplot(4,2,5);
plot(x,rN23InDB);
legend('rN23InDB');
subplot(4,2,7);
plot(x,rN24InDB);
legend('rN24InDB');

subplot(4,2,2);
plot(x,rN21OutDB);
legend('rN21OutDB');
subplot(4,2,4);
plot(x,rN22OutDB);
legend('rN22OutDB');
subplot(4,2,6);
plot(x,rN23OutDB);
legend('rN23OutDB');
subplot(4,2,8);
plot(x,rN24OutDB);
legend('rN24OutDB');



figure('name','2nd Circuit 2 , Ring1','numbertitle','off');
subplot(4,2,1);
plot(x,c2ring1N11InDB);
legend('c2ring1N11InDB');
subplot(4,2,3);
plot(x,c2ring1N12InDB);
legend('c2ring1N12InDB');
subplot(4,2,5);
plot(x,c2ring1N13InDB);
legend('c2ring1N13InDB');
subplot(4,2,7);
plot(x,c2ring1N14InDB);
legend('c2ring1N14InDB');

subplot(4,2,2);
plot(x,c2ring1N11OutDB);
legend('c2ring1N11OutDB');
subplot(4,2,4);
plot(x,c2ring1N12OutDB);
legend('c2ring1N12OutDB');
subplot(4,2,6);
plot(x,c2ring1N13OutDB);
legend('c2ring1N13OutDB');
subplot(4,2,8);
plot(x,c2ring1N14OutDB);
legend('c2ring1N14OutDB');


figure('name','2nd Circuit 2 , Ring2','numbertitle','off');
subplot(4,2,1);
plot(x,c2ring2N21InDB);
legend('c2ring2N21InDB');
subplot(4,2,3);
plot(x,c2ring2N22InDB);
legend('c2ring2N22InDB');
subplot(4,2,5);
plot(x,c2ring2N23InDB);
legend('c2ring2N23InDB');
subplot(4,2,7);
plot(x,c2ring2N24InDB);
legend('c2ring2N24InDB');

subplot(4,2,2);
plot(x,c2ring2N21OutDB);
legend('c2ring2N21OutDB');
subplot(4,2,4);
plot(x,c2ring2N22OutDB);
legend('c2ring2N22OutDB');
subplot(4,2,6);
plot(x,c2ring2N23OutDB);
legend('c2ring2N23OutDB');
subplot(4,2,8);
plot(x,c2ring2N24OutDB);
legend('c2ring2N24OutDB');




% % db vlues
% N11InDB=outputFile(:,2);
% N12InDB=outputFile(:,3);
% N13InDB=outputFile(:,4);
% N14InDB=outputFile(:,5);
% N11OutDB=outputFile(:,6);
% N12OutDB=outputFile(:,7);
% N13OutDB=outputFile(:,8);
% N14OutDB=outputFile(:,9);
% x14InDB=outputFile(:,10);
% x14OutDB=outputFile(:,11);
% N21InDB=outputFile(:,12);
% N22InDB=outputFile(:,13);
% N23InDB=outputFile(:,14);
% N24InDB=outputFile(:,15);
% N21OutDB=outputFile(:,16);
% N22OutDB=outputFile(:,17);
% N23OutDB=outputFile(:,18);
% N24OutDB=outputFile(:,19);
% x23InDB=outputFile(:,20);
% x24InDB=outputFile(:,21);
% x23OutDB=outputFile(:,22);
% x24OutDB=outputFile(:,23);
% 
% 
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


