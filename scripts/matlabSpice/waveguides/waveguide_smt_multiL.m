set(0,'DefaultFigureWindowStyle','docked')
%addpath ../ ../../
% close all


% base netlist file and matlab scripts reside in wavequides forlder.
% the script will creat an output folder with a time stamp of the run.
% all optput files will be generated in the output folder.
% waveguide_smt.sp is the parametrized netlist file.
% waveguide_smt_multiL.m is the matlab script to sweep length, lambda and
% neff and run the netlist.


basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/waveguides/';
base = 'waveguide_smt';

basefile = strcat(base,'.sp');
baseFileFull = strcat(basePath,basefile);

display(baseFileFull);

currentDir = pwd;


display(currentDir);
dateStamp = datestr(now,'ddmmmyy_HHMM');
display(dateStamp);
snapshot = strcat('run_', dateStamp);
display(snapshot);
mkdir(snapshot);
snapshotFull=strcat('./',snapshot)
cd(snapshotFull);
system(pwd);

% Setting for run_16Feb2016_1526
%l = 1:0.2:5;
%lam = 600:10:1500; 
%neff = 1.1:0.2:3.0;

l = 1:0.2:3;
lam = 900:100:1100; 
neff = 1.1;
    
    %for c = drange(1:10)
    
    for i = l
        for j = lam
            for k = neff
                BaseSimFile = sprintf('%s_L%1.1f_LAM%d_Neff%1.1f_end',base,i,j,k);
                SimFile = strcat(BaseSimFile,'.sp');
                %copyfile(basefile,SimFile);
                copyfile(baseFileFull,SimFile);
                %display(BaseSimFile);
                display(SimFile);
                %display(basefile);

                
                find_and_replace(SimFile, 'LENGTH',sprintf('%e',i));
                find_and_replace(SimFile, 'LAM',sprintf('%e',j));
                find_and_replace(SimFile, 'NEFF',sprintf('%e',k));
                ospice_cmd = sprintf('/Users/sanam/OptispiceBin/ospiceResearch %s ',SimFile);
                disp(ospice_cmd);
                system(ospice_cmd);
                BaseSimFile='a';
            end
        end
    end
    
% 
% figure
% plot(L,eye);

cd(currentDir);
