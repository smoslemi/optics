set(0,'DefaultFigureWindowStyle','docked')
%addpath ../ ../../
% close all


% base netlist file and matlab scripts reside in wavequides forlder.
% the script will creat an output folder with a time stamp of the run.
% all optput files will be generated in the output folder.
% waveguide_smt.sp is the parametrized netlist file.
% waveguide_smt_multiL.m is the matlab script to sweep length, lambda and
% neff and run the netlist.


basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/filters/swipes/';
base = 'chChecks';

basefile = strcat(base,'.sp');
baseFileFull = strcat(basePath,basefile);

%display(baseFileFull);

currentDir = pwd;


%display(currentDir);
dateStamp = datestr(now,'ddmmmyy_HHMM');
%display(dateStamp);
snapshot = strcat('run_', dateStamp);
%display(snapshot);
mkdir(snapshot);
snapshotFull=strcat('./',snapshot)
cd(snapshotFull);
%system(pwd);

% Setting for run_16Feb2016_1526
%l = 1:0.2:5;
%lam = 600:10:1500; 
%neff = 1.1:0.2:3.0;

coup = 0.15:0.1:0.3;
diffr = 0.04:0.02:0.08; 
neff = 1.1:0.2:1.7;
rad = 10.35;    
    %for c = drange(1:10)
    
    for i = coup
        for j = diffr
            for k = neff
                for h = rad
                BaseSimFile = sprintf('%s_C%1.2f_Dr%1.2f_Neff%1.1f_Rad%2.2f_end',base,i,j,k,h);
                SimFile = strcat(BaseSimFile,'.sp');
                %copyfile(basefile,SimFile);
                copyfile(baseFileFull,SimFile);
                %display(BaseSimFile);
                %display(SimFile);
                %display(basefile);
                
                find_and_replace(SimFile, 'CCOEF',sprintf('%e',i));
                find_and_replace(SimFile, 'DIFFR',sprintf('%e',j));
                find_and_replace(SimFile, 'NEFF',sprintf('%e',k));
                find_and_replace(SimFile, 'RAD1',sprintf('%e',h));
                ospice_cmd = sprintf('/Users/sanam/OptispiceBin/ospiceResearch %s ',SimFile);
                disp(ospice_cmd);
                system(ospice_cmd);
                BaseSimFile='a';
                end
            end
        end
    end
%     
% % 
% % figure
% % plot(L,eye);
% 
cd(currentDir);
