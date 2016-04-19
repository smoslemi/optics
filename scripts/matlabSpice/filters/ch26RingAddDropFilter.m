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

c1N31InDB=outputFile(:,34);
c1N32OutDB=outputFile(:,36);
c1N33OutDB=outputFile(:,38);
c1N34OutDB=outputFile(:,40);
c1N31OutDB=outputFile(:,35);
c1N32InDB=outputFile(:,37);
c1N33InDB=outputFile(:,39);
c1N34InDB=outputFile(:,41);

c1N41InDB=outputFile(:,42);
c1N42OutDB=outputFile(:,44);
c1N43OutDB=outputFile(:,46);
c1N44OutDB=outputFile(:,48);
c1N41OutDB=outputFile(:,43);
c1N42InDB=outputFile(:,45);
c1N43InDB=outputFile(:,47);
c1N44InDB=outputFile(:,49);



rN31InDB=outputFile(:,50);
rN32OutDB=outputFile(:,52);
rN33OutDB=outputFile(:,54);
rN34OutDB=outputFile(:,56);
rN31OutDB=outputFile(:,51);
rN32InDB=outputFile(:,53);
rN33InDB=outputFile(:,55);
rN34InDB=outputFile(:,57);

rN41InDB=outputFile(:,58);
rN42OutDB=outputFile(:,60);
rN43OutDB=outputFile(:,62);
rN44OutDB=outputFile(:,64);
rN41OutDB=outputFile(:,59);
rN42InDB=outputFile(:,61);
rN43InDB=outputFile(:,63);
rN44InDB=outputFile(:,65);



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

figure('name','Circuit 1 (3-6 rings) Ring2 vs Circuit 2  (just one ring) Ring2','numbertitle','off');
subplot(4,2,1);
plot(x,c1N21InDB,x,rN21InDB);
legend('c1N21InDB','rN21InDB');
subplot(4,2,3);
plot(x,c1N22InDB,x,rN22InDB);
legend('c1N22InDB','rN22InDB');
subplot(4,2,5);
plot(x,c1N23InDB,x,rN23InDB);
legend('c1N23InDB','rN23InDB');
subplot(4,2,7);
plot(x,c1N24InDB,x,rN24InDB);
legend('c1N23InDB','rN24InDB');

subplot(4,2,2);
plot(x,c1N21OutDB,x,rN21OutDB);
legend('c1N21OutDB','rN21OutDB');
subplot(4,2,4);
plot(x,c1N22OutDB,x,rN22OutDB);
legend('c1N22OutDB','rN22OutDB');
subplot(4,2,6);
plot(x,c1N23OutDB,x,rN23OutDB);
legend('c1N23OutDB','rN23OutDB');
subplot(4,2,8);
plot(x,c1N24OutDB,x,rN24OutDB);
legend('c1N24OutDB','rN24OutDB');


figure('name','Circuit 1 (3-6 rings) Ring4 vs Circuit 2  (just one ring) Ring4','numbertitle','off');
subplot(4,2,1);
plot(x,c1N41InDB,x,rN41InDB);
legend('c1N41InDB','rN41InDB');
subplot(4,2,3);
plot(x,c1N42InDB,x,rN42InDB);
legend('c1N42InDB','rN42InDB');
subplot(4,2,5);
plot(x,c1N43InDB,x,rN43InDB);
legend('c1N43InDB','rN43InDB');
subplot(4,2,7);
plot(x,c1N44InDB,x,rN44InDB);
legend('c1N43InDB','rN44InDB');

subplot(4,2,2);
plot(x,c1N41OutDB,x,rN41OutDB);
legend('c1N41OutDB','rN41OutDB');
subplot(4,2,4);
plot(x,c1N42OutDB,x,rN42OutDB);
legend('c1N42OutDB','rN42OutDB');
subplot(4,2,6);
plot(x,c1N43OutDB,x,rN43OutDB);
legend('c1N43OutDB','rN43OutDB');
subplot(4,2,8);
plot(x,c1N44OutDB,x,rN44OutDB);
legend('c1N44OutDB','rN44OutDB');


figure('name','Circuit 1 (3-6 rings) drop ports','numbertitle','off');
subplot(4,2,1);
plot(x,c1N11InDB,x,c1N21InDB,x,c1N31InDB,x,c1N41InDB);
legend('c1N11InDB','c1N21InDB','c1N31InDB','c1N41InDB');
subplot(4,2,3);
plot(x,c1N12InDB,x,c1N22InDB,x,c1N32InDB,x,c1N42InDB);
legend('c1N12InDB','c1N22InDB','c1N32InDB','c1N42InDB');
subplot(4,2,5);
plot(x,c1N13InDB,x,c1N23InDB,x,c1N33InDB,x,c1N43InDB);
legend('c1N13InDB','c1N23InDB','c1N33InDB','c1N43InDB');
subplot(4,2,7);
plot(x,c1N14InDB,x,c1N24InDB,x,c1N34InDB,x,c1N44InDB);
legend('c1N14InDB','c1N24InDB','c1N34InDB','c1N44InDB');

subplot(4,2,2);
plot(x,c1N11OutDB,x,c1N21OutDB,x,c1N31OutDB,x,c1N41OutDB);
legend('c1N11OutDB','c1N21OutDB','c1N31OutDB','c1N41OutDB');
subplot(4,2,4);
plot(x,c1N12OutDB,x,c1N22OutDB,x,c1N32OutDB,x,c1N42OutDB);
legend('c1N12OutDB','c1N22OutDB','c1N32OutDB','c1N42OutDB');
subplot(4,2,6);
plot(x,c1N13OutDB,x,c1N23OutDB,x,c1N33OutDB,x,c1N43OutDB);
legend('c1N13OutDB','c1N23OutDB','c1N33OutDB','c1N43OutDB');
subplot(4,2,8);
plot(x,c1N14OutDB,x,c1N24OutDB,x,c1N34OutDB,x,c1N44OutDB);
legend('c1N14OutDB','c1N24OutDB','c1N34OutDB','c1N44OutDB');