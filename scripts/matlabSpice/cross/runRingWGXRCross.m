set(0,'DefaultFigureWindowStyle','docked');
%set(0,'DefaultFigureWindowStyle','normal');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
%set(groot,'defaultAxesLineStyleOrder',['-' '--' '.' '-.']);
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);

dateStamp = datestr(now,'ddmmmyy_HHMM');
display(dateStamp);
snapshot = strcat('ringWGXRCross_', dateStamp);
display(snapshot);
mkdir(snapshot);
snapshotFull=strcat('./',snapshot);
cd(snapshotFull);
system(pwd);


base1= 'ringWGXRCross';
Ref1=0.1;
TH1=0.7;
Right1= 0.15;
Left1= 0.4;

base2= 'ringWGXRCrossIdeal';
Ref2=0.0;
TH2=1.0;
Right2= 0.0;
Left2= 0.0;

base3= 'ringWGXRCrossTH';
Ref3=0.0;
TH3=0.7;
Right3= 0.0;
Left3= 0.0;

base4= 'ringWGXRCrossRef';
Ref4=0.1;
TH4=0.7;
Right4= 0.0;
Left4= 0.0;

base5= 'ringWGXRCrossRefRight';
Ref5=0.1;
TH5=0.7;
Right5= 0.15;
Left5= 0.0;

base6= 'ringWGXRCrossRight';
Ref6=0.0;
TH6=0.7;
Right6= 0.15;
Left6= 0.0;


base7= 'ringWGXRCrossLeft';
Ref7=0.0;
TH7=0.7;
Right7= 0.0;
Left7= 0.2;

basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/cross/';



for i=1:7
    bName=(strcat('base',num2str(i)));
    refName=(strcat('Ref',num2str(i)));
    thName=(strcat('TH',num2str(i)));
    rightName=(strcat('Right',num2str(i)));
    leftName=(strcat('Left',num2str(i)));
    base=eval(bName);
    display(base)    
    basefile = strcat(base,'.sp');
    display(basefile)
    baseFileFull = strcat(basePath,basefile);
    display(baseFileFull)
    copyfile(baseFileFull,basefile);
    ospice_cmd = sprintf('/Users/sanam/OptispiceBin/ospiceResearch %s ',basefile);
    disp(ospice_cmd);
    system(ospice_cmd);
end
cd(basePath);
system(pwd);