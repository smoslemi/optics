set(0,'DefaultFigureWindowStyle','docked')
%addpath ../ ../../
% close all

basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/';
base = 'waveguide_smt';

basefile = strcat(base,'.sp');
baseFileFull = strcat(basePath,basefile);

display(baseFileFull);

system(pwd);

cd('/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/16feb2016_1150');

system(pwd);


l = [1];
lam = [600]; 
neff = [1.1];
    
    %for c = drange(1:10)
    
    for i = l
        for j = lam
            for k = neff
                BaseSimFile = sprintf('%s_L%1.1f_LAM%d_Neff%1.1f_end',base,i,j,k);
                SimFile = strcat(BaseSimFile,'.sp');
                %copyfile(basefile,SimFile);
                copyfile(baseFileFull,SimFile);
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
