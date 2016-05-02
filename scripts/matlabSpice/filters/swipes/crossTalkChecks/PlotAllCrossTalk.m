function PlotAllCrossTalk(FileName,FileNameTH)
    oFile =load(FileName);
    oFileTH =load(FileNameTH);
    %mFile =load('chChecks.1-DC.2d_dat');
    % Ref1=0.1;
    % TH1=0.9;
    % Right1= 0.1;
    % Left1= 0.1;
    % Limit the output (Output< -20 => 0)
    [nr,nc]=size(oFile);
    for i=1:nr
        for j=2:nc
            if oFile(i,j) <-20
                oFile(i,j)=-20;
            end
        end
    end
    
    [nrTH,ncTH]=size(oFileTH);
    for i=1:nrTH
        for j=2:ncTH
            if oFileTH(i,j) <-20
                oFileTH(i,j)=-20;
            end
        end
    end

     %nroFile
     

    NDiv= 8;
    NPort = 8;
    col =2 ;
    colEnd = NPort+1;
    OutColS= 1;
    OutColE= NPort;
    OutStep= NPort;
    for i=1:NDiv
        %i
        for j=col:colEnd
            %j
            c{j-1}=oFile(:,j);
            cTH{j-1}=oFileTH(:,j);
        end;
        if i==1
            [N11I, N12I, N13I, N14I,N11O, N12O, N13O, N14O] = c{(i-1)*NPort+1:i*NPort};
            [NTH11I, NTH12I, NTH13I, NTH14I,NTH11O, NTH12O, NTH13O, NTH14O] = cTH{(i-1)*NPort+1:i*NPort};
            %[x11I, x12I, x13I, x14I,x11O, x12O, x13O, x14O] = c{(i-1)*NPort+1:i*NPort};
            %N13O(5)
            %N14O(5)
        end;
        if i==2
            [N21I, N22I, N23I, N24I,N21O, N22O, N23O, N24O] = c{(i-1)*NPort+1:i*NPort};
            [NTH21I, NTH22I, NTH23I, NTH24I,NTH21O, NTH22O, NTH23O, NTH24O] = cTH{(i-1)*NPort+1:i*NPort};
            %[x21I, x22I, x23I, x24I,x21O, x22O, x23O, x24O] = c{(i-1)*NPort+1:i*NPort};
        end;
        if i==3
            [N31I, N32I, N33I, N34I, N31O, N32O, N33O, N34O] = c{(i-1)*NPort+1:i*NPort};
            [NTH31I, NTH32I, NTH33I, NTH34I, NTH31O, NTH32O, NTH33O, NTH34O] = cTH{(i-1)*NPort+1:i*NPort};
            %[x31I,x32I, x33I, x34I, x31O, x32O, x33O, x34O] = c{(i-1)*NPort+1:i*NPort};
        end;
        if i==4
            [N41I, N42I, N43I, N44I, N41O, N42O, N43O, N44O] = c{(i-1)*NPort+1:i*NPort};
            [NTH41I, NTH42I, NTH43I, NTH44I, NTH41O, NTH42O, NTH43O, NTH44O] = cTH{(i-1)*NPort+1:i*NPort};
            %[x41I, x42I, x43I, x44I, x41O, x42O, x43O, x44O] = c{(i-1)*NPort+1:i*NPort};
        end;
        if i==5
            [N51I, N52I, N53I, N54I, N51O, N52O, N53O, N54O] = c{(i-1)*NPort+1:i*NPort};
            [NTH51I, NTH52I, NTH53I, NTH54I, NTH51O, NTH52O, NTH53O, NTH54O] = cTH{(i-1)*NPort+1:i*NPort};
            %[x51I, x52I, x53I, x54I, x51O, x52O, x53O, x54O] = c{(i-1)*NPort+1:i*NPort};
        end;
        if i==6
            [N61I, N62I, N63I, N64I, N61O, N62O, N63O, N64O] = c{(i-1)*NPort+1:i*NPort};
            [NTH61I, NTH62I, NTH63I, NTH64I, NTH61O, NTH62O, NTH63O, NTH64O] = cTH{(i-1)*NPort+1:i*NPort};
            %[x61I, x62I, x63I, x64I, x61O, x62O, x63O, x64O] = c{(i-1)*NPort+1:i*NPort};
        end;
        if i==7
            [N71I, N72I, N73I, N74I, N71O, N72O, N73O, N74O] = c{(i-1)*NPort+1:i*NPort};
            [NTH71I, NTH72I, NTH73I, NTH74I, NTH71O, NTH72O, NTH73O, NTH74O] = cTH{(i-1)*NPort+1:i*NPort};
            %[x71I, x72I, x73I, x74I, x71O, x72O, x73O, x74O] = c{(i-1)*NPort+1:i*NPort};
        end;
        if i==8
            [N81I, N82I, N83I, N84I, N81O, N82O, N83O, N84O] = c{(i-1)*NPort+1:i*NPort};
            [NTH81I, NTH82I, NTH83I, NTH84I, NTH81O, NTH82O, NTH83O, NTH84O] = cTH{(i-1)*NPort+1:i*NPort};
            %[x81I, x82I, x83I, x84I, x81O, x82O, x83O, x84O] = c{(i-1)*NPort+1:i*NPort};
        end;
        %c
        %clear c;
    %     col
    %     NPort
         col=col+NPort;
         colEnd=col+NPort-1;

    end;

    x=oFile(:,1);

    % 8 ch outs
%     figure('name','Array TH ports','numbertitle','off');
%     plot(x,N13O,'r',x,N23O,'g',x,N33O,'b',x,N43O,'y',x,N53O,'m',x,N63O,'c',x,N73O,'k',x,N83O,':r');
%     legend('N13O','N23O','N33O','N43O','N53O','N63O','N73O','N83O');

    figure('name',strcat( FileName, 'Drop'),'numbertitle','off');
    plot(x,N12I,'r',x,N22I,'g',x,N32I,'b',x,N42I,'y',x,N52I,'m',x,N62I,'c',x,N72I,'k',x,N82I,':r');
    legend('N12I','N22I','N32I','N42I','N52I','N62I','N72I','N82I');
    
    figure('name',strcat( FileNameTH, 'Drop'),'numbertitle','off');
    plot(x,NTH12I,'r',x,NTH22I,'g',x,NTH32I,'b',x,NTH42I,'y',x,NTH52I,'m',x,NTH62I,'c',x,NTH72I,'k',x,NTH82I,':r');
    legend('NTH12I','NTH22I','NTH32I','NTH42I','NTH52I','NTH62I','NTH72I','TH82I');
    
    
    figure('name','crosstalk compare CH1','numbertitle','off');
    plot(x,N12I,':r',x,NTH12I,'g');
    legend('N12I','NTH12I');
    
    figure('name','crosstalk compare CH2','numbertitle','off');
    plot(x,N22I,':r',x,NTH22I,'g');
    legend('N22I','NTH22I');
    
        figure('name','crosstalk compare CH3','numbertitle','off');
    plot(x,N32I,':r',x,NTH32I,'g');
    legend('N32I','NTH32I');
    
    figure('name','crosstalk compare CH4','numbertitle','off');
    plot(x,N42I,':r',x,NTH42I,'g');
    legend('N42I','NTH42I');
    
    figure('name','crosstalk compare CH5','numbertitle','off');
    plot(x,N52I,':r',x,NTH52I,'g');
    legend('N52I','NTH52I');
    
    figure('name','crosstalk compare CH6','numbertitle','off');
    plot(x,N62I,':r',x,NTH62I,'g');
    legend('N62I','NTH62I');
    
    figure('name','crosstalk compare CH7','numbertitle','off');
    plot(x,N72I,':r',x,NTH72I,'g');
    legend('N72I','NTH72I');
    
    figure('name','crosstalk compare CH8','numbertitle','off');
    plot(x,N82I,':r',x,NTH82I,'g');
    legend('N82I','NTH82I');

    
end

