set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

base1= '4ch6RingAddDropFilter';
outputFile =load('4ch6RingAddDropFilter.1-DC.2d_dat');
mFile =load('4ch6RingAddDropFilter.1-DC.2d_dat');
Ref1=0.1;
TH1=0.9;
Right1= 0.1;
Left1= 0.1;

basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/filter/';

[nr,nc]=size(mFile);
for i=1:nr
    for j=2:nc
        mFile(i,j)=10^(mFile(i,j)/20);
    end
end

x=outputFile(:,1);

% main circuit
c1N11In=mFile(:,2);


% db vlues
c1N11InDB=outputFile(:,2);
c1N11OutDB=outputFile(:,3);
c1N12OutDB=outputFile(:,4);
c1N12InDB=outputFile(:,5);
c1N13OutDB=outputFile(:,6);
c1N13InDB=outputFile(:,7);
c1N14OutDB=outputFile(:,8);
c1N14InDB=outputFile(:,9);

c1N21InDB=outputFile(:,10);
c1N21OutDB=outputFile(:,11);
c1N22OutDB=outputFile(:,12);
c1N22InDB=outputFile(:,13);
c1N23OutDB=outputFile(:,14);
c1N23InDB=outputFile(:,15);
c1N24OutDB=outputFile(:,16);
c1N24InDB=outputFile(:,17);

c1N31InDB=outputFile(:,18);
c1N31OutDB=outputFile(:,19);
c1N32OutDB=outputFile(:,20);
c1N32InDB=outputFile(:,21);
c1N33OutDB=outputFile(:,22);
c1N33InDB=outputFile(:,23);
c1N34OutDB=outputFile(:,24);
c1N34InDB=outputFile(:,25);

c1N41InDB=outputFile(:,26);
c1N41OutDB=outputFile(:,27);
c1N42OutDB=outputFile(:,28);
c1N42InDB=outputFile(:,29);
c1N43OutDB=outputFile(:,30);
c1N43InDB=outputFile(:,31);
c1N44OutDB=outputFile(:,32);
c1N44InDB=outputFile(:,33);



rN11InDB=outputFile(:,34);
rN11OutDB=outputFile(:,35);
rN12OutDB=outputFile(:,36);
rN12InDB=outputFile(:,37);
rN13OutDB=outputFile(:,38);
rN13InDB=outputFile(:,39);
rN14OutDB=outputFile(:,40);
rN14InDB=outputFile(:,41);

rN21InDB=outputFile(:,42);
rN21OutDB=outputFile(:,43);
rN22OutDB=outputFile(:,44);
rN22InDB=outputFile(:,45);
rN23OutDB=outputFile(:,46);
rN23InDB=outputFile(:,47);
rN24OutDB=outputFile(:,48);
rN24InDB=outputFile(:,49);

rN31InDB=outputFile(:,50);
rN31OutDB=outputFile(:,51);
rN32OutDB=outputFile(:,52);
rN32InDB=outputFile(:,53);
rN33OutDB=outputFile(:,54);
rN33InDB=outputFile(:,55);
rN34OutDB=outputFile(:,56);
rN34InDB=outputFile(:,57);

rN41InDB=outputFile(:,58);
rN41OutDB=outputFile(:,59);
rN42OutDB=outputFile(:,60);
rN42InDB=outputFile(:,61);
rN43OutDB=outputFile(:,62);
rN43InDB=outputFile(:,63);
rN44OutDB=outputFile(:,64);
rN44InDB=outputFile(:,65);




figure('name','Compare stage 1, multiple rings vs one ring at each corner','numbertitle','off');
subplot(4,2,1);
plot(x,c1N11InDB,':r',x,rN11InDB,'-.g');
legend('c1N11InDB','rN11InDB');
subplot(4,2,3);
plot(x,c1N12InDB,x,rN12InDB,'-.g');
legend('c1N12InDB','rN12InDB');
subplot(4,2,5);
plot(x,c1N13InDB,x,rN13InDB,'-.g');
legend('c1N13InDB','rN13InDB');
subplot(4,2,7);
plot(x,c1N14InDB,x,rN14InDB,'-.g');
legend('c1N14InDB','rN14InDB');

subplot(4,2,2);
plot(x,c1N11OutDB,x,rN11OutDB,'-.g');
legend('c1N11OutDB','rN11OutDB');
subplot(4,2,4);
plot(x,c1N12OutDB,x,rN12OutDB,'-.g');
legend('c1N12OutDB','rN12OutDB');
subplot(4,2,6);
plot(x,c1N13OutDB,x,rN13OutDB,'-.g');
legend('c1N13OutDB','rN13OutDB');
subplot(4,2,8);
plot(x,c1N14OutDB,x,rN14OutDB,'-.g');
legend('c1N14OutDB','rN14OutDB');

figure('name','Compare stage 2, multiple rings vs one ring at each corner','numbertitle','off');
subplot(4,2,1);
plot(x,c1N21InDB,':r',x,rN21InDB,'-.g');
legend('c1N21InDB','rN21InDB');
subplot(4,2,3);
plot(x,c1N22InDB,x,rN22InDB,'-.g');
legend('c1N22InDB','rN22InDB');
subplot(4,2,5);
plot(x,c1N23InDB,x,rN23InDB,'-.g');
legend('c1N23InDB','rN23InDB');
subplot(4,2,7);
plot(x,c1N24InDB,x,rN24InDB,'-.g');
legend('c1N24InDB','rN24InDB');

subplot(4,2,2);
plot(x,c1N21OutDB,x,rN21OutDB,'-.g');
legend('c1N21OutDB','rN21OutDB');
subplot(4,2,4);
plot(x,c1N22OutDB,x,rN22OutDB,'-.g');
legend('c1N22OutDB','rN22OutDB');
subplot(4,2,6);
plot(x,c1N23OutDB,x,rN23OutDB,'-.g');
legend('c1N23OutDB','rN23OutDB');
subplot(4,2,8);
plot(x,c1N24OutDB,x,rN24OutDB,'-.g');
legend('c1N24OutDB','rN24OutDB');

figure('name','Compare stage 3, multiple rings vs one ring at each corner','numbertitle','off');
subplot(4,2,1);
plot(x,c1N31InDB,':r',x,rN31InDB,'-.g');
legend('c1N31InDB','rN31InDB');
subplot(4,2,3);
plot(x,c1N32InDB,x,rN32InDB,'-.g');
legend('c1N32InDB','rN32InDB');
subplot(4,2,5);
plot(x,c1N33InDB,x,rN33InDB,'-.g');
legend('c1N33InDB','rN33InDB');
subplot(4,2,7);
plot(x,c1N34InDB,x,rN34InDB,'-.g');
legend('c1N34InDB','rN34InDB');

subplot(4,2,2);
plot(x,c1N31OutDB,x,rN31OutDB,'-.g');
legend('c1N31OutDB','rN31OutDB');
subplot(4,2,4);
plot(x,c1N32OutDB,x,rN32OutDB,'-.g');
legend('c1N32OutDB','rN32OutDB');
subplot(4,2,6);
plot(x,c1N33OutDB,x,rN33OutDB,'-.g');
legend('c1N33OutDB','rN33OutDB');
subplot(4,2,8);
plot(x,c1N34OutDB,x,rN34OutDB,'-.g');
legend('c1N34OutDB','rN34OutDB');



% 
% 
% figure('name','Circuit Main DB values, wx1 Cross','numbertitle','off');
% 
% subplot(1,2,1);
% plot(x,x14InDB);
% legend('x14InDB');
% 
% subplot(1,2,2);
% plot(x,x14OutDB);
% legend('x14OutDB');
% 
% 
