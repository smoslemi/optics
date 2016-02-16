set(0,'DefaultFigureWindowStyle','docked')
%addpath ../ ../../
% close all


base = 'waveguide_smt';

basefile = strcat(base,'.sp');

display(base);

system(pwd);

cd('/Users/sanam/phd/myOptispice/myRuns/waveguide/16feb2016_1150');

system(pwd);


l = [1 1.2 1.4 1.6 1.8 2 2.2 2.4 2.6 2.8 3.0 3.2 3.4 3.6 3.8 4 4.2 4.4 4.6 4.8 5];
lam = [600 650 700 750 800 850 900 950 1000 1050 1100 1150 1200 1250 1300 1350 1400 1450 1500]; 
neff = [1.1 1.5 2 2.5 3 3.5];
    
    %for c = drange(1:10)
    
    for i = l
        for j = lam
            for k = neff
                BaseSimFile = sprintf('%s_L%1.1f_LAM%d_Neff%1.1f_end',base,i,j,k);
                SimFile = strcat(BaseSimFile,'.sp');
                copyfile(basefile,SimFile);
                display(BaseSimFile);
                display(SimFile);
                display(basefile);

                
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

%cd('../');
