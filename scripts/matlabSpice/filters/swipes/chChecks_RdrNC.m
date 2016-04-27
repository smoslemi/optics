set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');
set(groot,'defaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0],'defaultAxesLineStyleOrder',{'--',':'});
set(0,'DefaultLineMarkerSize',1);



basePath = '/Users/sanam/phd/GitThesis/optics/scripts/matlabSpice/filters/swipes/';
base = 'chChecks';


coup = 0.15:0.1:0.3;
diffr = 0.04:0.02:0.08; 
neff = 1.1:0.2:1.7;
rad = 10.35;    
%for c = drange(1:10)
NCir = 0;

    for i = coup
        for j = diffr
            for k = neff
                for h = rad
                BaseSimFile = sprintf('%s_C%1.2f_Dr%1.2f_Neff%1.1f_Rad%2.2f_end',base,i,j,k,h);
                DataFile = strcat(BaseSimFile,'.1-DC.2d_dat');
                NCir
                PlotAll(DataFile);
                NCir = NCir +1 ;
                end
            end
        end
    end
outs = 'outPlots';
mkdir(outs);
save_all_figs_dir_name(outs);

    

