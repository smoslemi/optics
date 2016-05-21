function PlotAllCrossTalkImv(FileName,FileNameTH,FileNameTri)
    oFile =load(FileName);
    oFileTH =load(FileNameTH);
    oFileTri =load(FileNameTri);
    desc={'With the values:';
    'C =9.1065e-02';
    'Non = 1.6532e+00';
    %'dr = 0.018';
    'r1=2.9642';
    'r1=2.8285';
    'r1=2.8340';
    'r1=2.8395';
    'TH=0.98';
    'Right=0.1';
    'Left=0.1';
    'Ref=0.1'};
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
    if (nr > nrTH)
        oFile=oFile((nr/2)+1:nr,:);
    end
        
    [nrTri,ncTri]=size(oFileTri);
    for i=1:nrTri
        for j=2:ncTri
            if oFileTri(i,j) <-20
                oFileTri(i,j)=-20;
            end
        end
    end
     %nroFile
     

    NDiv= 8;
    NPort = 8;
    NPath = 2;
    col =2 ;
    colEnd = NPort+1;
    NRing=0
    %OutColS= 1;
    %OutColE= NPort;
    %OutStep= NPort;
    for h=1:NPath;
        for i=1:NDiv
            NRing = NRing+1;
            for j=col:colEnd
                %j
                c{j-1}=oFile(:,j);
                cTH{j-1}=oFileTH(:,j);
                cTri{j-1}=oFileTri(:,j);
            end; % for loop for j
            h;
            i;
            j;
            NRing;
           (i-1)*NPort+1;
            i*NPort;
            if i==1
                [N11I, N12I, N13I, N14I,N11O, N12O, N13O, N14O] = c{(i-1)*NPort+1+(h-1)*NDiv*NPort:i*NPort+(h-1)*NDiv*NPort};
                [NTH11I, NTH12I, NTH13I, NTH14I,NTH11O, NTH12O, NTH13O, NTH14O] = cTH{(i-1)*NPort+1:i*NPort};
                [NTri11I,NTri11O, NTri12O, NTri12I, NTri13O, NTri13I, NTri14O, NTri14I] = cTri{(i-1)*NPort+1:i*NPort};
                %[x11I, x12I, x13I, x14I,x11O, x12O, x13O, x14O] = c{(i-1)*NPort+1:i*NPort};
            end;
            if i==2
                [N21I, N22I, N23I, N24I,N21O, N22O, N23O, N24O] = c{(i-1)*NPort+1+(h-1)*NDiv*NPort:i*NPort+(h-1)*NDiv*NPort};
                [NTH21I, NTH22I, NTH23I, NTH24I,NTH21O, NTH22O, NTH23O, NTH24O] = cTH{(i-1)*NPort+1:i*NPort};
                [NTri21I,NTri21O, NTri22O, NTri22I, NTri23O, NTri23I, NTri24O, NTri24I] = cTri{(i-1)*NPort+1:i*NPort};
                %[x21I, x22I, x23I, x24I,x21O, x22O, x23O, x24O] = c{(i-1)*NPort+1:i*NPort};
            end;
            if i==3
                [N31I, N32I, N33I, N34I, N31O, N32O, N33O, N34O] = c{(i-1)*NPort+1+(h-1)*NDiv*NPort:i*NPort+(h-1)*NDiv*NPort};
                [NTH31I, NTH32I, NTH33I, NTH34I, NTH31O, NTH32O, NTH33O, NTH34O] = cTH{(i-1)*NPort+1:i*NPort};
                [NTri31I,NTri31O, NTri32O, NTri32I, NTri33O, NTri33I, NTri34O, NTri34I] = cTri{(i-1)*NPort+1:i*NPort};
                %[x31I,x32I, x33I, x34I, x31O, x32O, x33O, x34O] = c{(i-1)*NPort+1:i*NPort};
            end;
            if i==4
                [N41I, N42I, N43I, N44I, N41O, N42O, N43O, N44O] = c{(i-1)*NPort+1+(h-1)*NDiv*NPort:i*NPort+(h-1)*NDiv*NPort};
                [NTH41I, NTH42I, NTH43I, NTH44I, NTH41O, NTH42O, NTH43O, NTH44O] = cTH{(i-1)*NPort+1:i*NPort};
                [NTri41I,NTri41O, NTri42O, NTri42I, NTri43O, NTri43I, NTri44O, NTri14I] = cTri{(i-1)*NPort+1:i*NPort};
                %[x41I, x42I, x43I, x44I, x41O, x42O, x43O, x44O] = c{(i-1)*NPort+1:i*NPort};
            end;
            if i==5
                [N51I, N52I, N53I, N54I, N51O, N52O, N53O, N54O] = c{(i-1)*NPort+1+(h-1)*NDiv*NPort:i*NPort+(h-1)*NDiv*NPort};
                [NTH51I, NTH52I, NTH53I, NTH54I, NTH51O, NTH52O, NTH53O, NTH54O] = cTH{(i-1)*NPort+1:i*NPort};
                [NTri51I,NTri51O, NTri52O, NTri52I, NTri53O, NTri53I, NTri54O, NTri54I] = cTri{(i-1)*NPort+1:i*NPort};
                %[x51I, x52I, x53I, x54I, x51O, x52O, x53O, x54O] = c{(i-1)*NPort+1:i*NPort};
            end;
            if i==6
                [N61I, N62I, N63I, N64I, N61O, N62O, N63O, N64O] = c{(i-1)*NPort+1+(h-1)*NDiv*NPort:i*NPort+(h-1)*NDiv*NPort};
                [NTH61I, NTH62I, NTH63I, NTH64I, NTH61O, NTH62O, NTH63O, NTH64O] = cTH{(i-1)*NPort+1:i*NPort};
                [NTri61I,NTri61O, NTri62O, NTri62I, NTri63O, NTri63I, NTri64O, NTri64I] = cTri{(i-1)*NPort+1:i*NPort};
                %[x61I, x62I, x63I, x64I, x61O, x62O, x63O, x64O] = c{(i-1)*NPort+1:i*NPort};
            end;
            if i==7
                [N71I, N72I, N73I, N74I, N71O, N72O, N73O, N74O] = c{(i-1)*NPort+1+(h-1)*NDiv*NPort:i*NPort+(h-1)*NDiv*NPort};
                [NTH71I, NTH72I, NTH73I, NTH74I, NTH71O, NTH72O, NTH73O, NTH74O] = cTH{(i-1)*NPort+1:i*NPort};
                [NTri71I,NTri71O, NTri72O, NTri72I, NTri73O, NTri73I, NTri74O, NTri74I] = cTri{(i-1)*NPort+1:i*NPort};
                %[x71I, x72I, x73I, x74I, x71O, x72O, x73O, x74O] = c{(i-1)*NPort+1:i*NPort};
            end;
            if i==8
                [N81I, N82I, N83I, N84I, N81O, N82O, N83O, N84O] = c{(i-1)*NPort+1+(h-1)*NDiv*NPort:i*NPort+(h-1)*NDiv*NPort};
                [NTH81I, NTH82I, NTH83I, NTH84I, NTH81O, NTH82O, NTH83O, NTH84O] = cTH{(i-1)*NPort+1:i*NPort};
                [NTri81I,NTri81O, NTri82O, NTri82I, NTri83O, NTri83I, NTri84O, NTri84I] = cTri{(i-1)*NPort+1:i*NPort};
                %[x81I, x82I, x83I, x84I, x81O, x82O, x83O, x84O] = c{(i-1)*NPort+1:i*NPort};
            end;
            %c
            %clear c;
        %     col
        %     NPort
             col=col+NPort;
             colEnd=col+NPort-1;
        end; % for loop for NDiv, i
%         i
%         j
%         h
%         NRing
        if h==1
            P1N11I = N11I; P1N12I = N12I; P1N13I= N13I; P1N14I = N14I;
            P1N11O = N11O; P1N12O = N12O; P1N13O= N13O; P1N14O = N14O;
            
            P1N21I = N21I; P1N22I = N22I; P1N23I= N23I; P1N24I = N24I;
            P1N21O = N21O; P1N22O = N22O; P1N23O= N23O; P1N24O = N24O;
            
            P1N31I = N31I; P1N32I = N32I; P1N33I= N33I; P1N34I = N34I;
            P1N31O = N31O; P1N32O = N32O; P1N33O= N33O; P1N34O = N34O;
            
            P1N41I = N41I; P1N42I = N42I; P1N43I= N43I; P1N44I = N44I;
            P1N41O = N41O; P1N42O = N42O; P1N43O= N43O; P1N44O = N44O;
            
            P1N51I = N51I; P1N52I = N52I; P1N53I= N53I; P1N54I = N54I;
            P1N51O = N51O; P1N52O = N52O; P1N53O= N53O; P1N54O = N54O;
            
            P1N61I = N61I; P1N62I = N62I; P1N63I= N63I; P1N64I = N64I;
            P1N61O = N61O; P1N62O = N62O; P1N63O= N63O; P1N64O = N64O;
            
            P1N71I = N71I; P1N72I = N72I; P1N73I= N73I; P1N74I = N74I;
            P1N71O = N71O; P1N72O = N72O; P1N73O= N73O; P1N74O = N74O;
            
            P1N81I = N81I; P1N82I = N82I; P1N83I= N83I; P1N84I = N84I;
            P1N81O = N81O; P1N82O = N82O; P1N83O= N83O; P1N84O = N84O;
        end;
        if h==2
            P2N11I = N11I; P2N12I = N12I; P2N13I= N13I; P2N14I = N14I;
            P2N11O = N11O; P2N12O = N12O; P2N13O= N13O; P2N14O = N14O;
            
            P2N21I = N21I; P2N22I = N22I; P2N23I= N23I; P2N24I = N24I;
            P2N21O = N21O; P2N22O = N22O; P2N23O= N23O; P2N24O = N24O;
            
            P2N31I = N31I; P2N32I = N32I; P2N33I= N33I; P2N34I = N34I;
            P2N31O = N31O; P2N32O = N32O; P2N33O= N33O; P2N34O = N34O;
            
            P2N41I = N41I; P2N42I = N42I; P2N43I= N43I; P2N44I = N44I;
            P2N41O = N41O; P2N42O = N42O; P2N43O= N43O; P2N44O = N44O;
            
            P2N51I = N51I; P2N52I = N52I; P2N53I= N53I; P2N54I = N54I;
            P2N51O = N51O; P2N52O = N52O; P2N53O= N53O; P2N54O = N54O;
            
            P2N61I = N61I; P2N62I = N62I; P2N63I= N63I; P2N64I = N64I;
            P2N61O = N61O; P2N62O = N62O; P2N63O= N63O; P2N64O = N64O;
            
            P2N71I = N71I; P2N72I = N72I; P2N73I= N73I; P2N74I = N74I;
            P2N71O = N71O; P2N72O = N72O; P2N73O= N73O; P2N74O = N74O;
            
            P2N81I = N81I; P2N82I = N82I; P2N83I= N83I; P2N84I = N84I;
            P2N81O = N81O; P2N82O = N82O; P2N83O= N83O; P2N84O = N84O;
        end;
        i
        j
        h
        NRing
    end; % for loop for Npath, h 

    x=oFile(:,1);
    
    % 16 ch outs
    figure('name',strcat( FileName, 'Drop'),'numbertitle','off');
    plot(x,P1N12I,':r',x,P1N22I,':g',x,P1N32I,':b',x,P1N42I,':y',x,P1N52I,':m',x,P1N62I,':c',x,P1N72I,':k',x,P1N82I,'*r',x,P2N12I,'r',x,P2N22I,'g',x,P2N32I,'b',x,P2N42I,'y',x,P2N52I,'m',x,P2N62I,'c',x,P2N72I,'k',x,P2N82I,'*k');
    legend('P1N12I','P1N22I','P1N32I','P1N42I','P1N52I','P1N62I','P1N72I','P1N82I','P2N12I','P2N22I','P2N32I','P2N42I','P2N52I','P2N62I','P2N72I','P2N82I');
    xlim=get(gca,'XLim');
    ylim=get(gca,'YLim');
    text(xlim(2),ylim(2)-10,desc);

    % 8 ch outs
% %     figure('name','Array TH ports','numbertitle','off');
% %     plot(x,N13O,'r',x,N23O,'g',x,N33O,'b',x,N43O,'y',x,N53O,'m',x,N63O,'c',x,N73O,'k',x,N83O,':r');
% %     legend('N13O','N23O','N33O','N43O','N53O','N63O','N73O','N83O');
% 
% 
%     figure('name',strcat( FileName, 'Drop'),'numbertitle','off');
%     plot(x,N12I,'r',x,N22I,'g',x,N32I,'b',x,N42I,'y',x,N52I,'m',x,N62I,'c',x,N72I,'k',x,N82I,':r');
%     legend('N12I','N22I','N32I','N42I','N52I','N62I','N72I','N82I');
%     xlim=get(gca,'XLim');
%     ylim=get(gca,'YLim');
%     text(xlim(2),ylim(2)-10,desc);
%     
% %     figure('name',strcat( FileNameTH, 'Drop'),'numbertitle','off');
% %     plot(x,NTH12I,'r',x,NTH22I,'g',x,NTH32I,'b',x,NTH42I,'y');
% %     legend('NTH12I','NTH22I','NTH32I','NTH42I');
% %     xlim=get(gca,'XLim');
% %     ylim=get(gca,'YLim');
% %     text(xlim(2),ylim(2)-10,desc);
% %     
% %         
% %     figure('name',strcat( FileNameTri, 'Drop'),'numbertitle','off');
% %     plot(x,NTri12I,'r',x,NTri22I,'g',x,NTri32I,'b',x,NTri42I,'y');
% %     legend('NTri12I','NTri22I','NTri32I','NTri42I');
% %     xlim=get(gca,'XLim');
% %     ylim=get(gca,'YLim');
% %     text(xlim(2),ylim(2)-10,desc);
% %     
% %     
% %     figure('name','crosstalk compare CH1','numbertitle','off');
% %     plot(x,N12I,':r',x,NTH12I,'--g',x,NTri12I,'-.b');
% %     legend('N12I','NTH12I','NTri12I');
% %     xlim=get(gca,'XLim');
% %     ylim=get(gca,'YLim');
% %     text(xlim(2),ylim(2)-10,desc);
% %     
% %     figure('name','crosstalk compare CH2','numbertitle','off');
% %     plot(x,N22I,':r',x,NTH22I,'g',x,NTri22I,'-.b');
% %     legend('N22I','NTH22I','NTri22I');
% %     xlim=get(gca,'XLim');
% %     ylim=get(gca,'YLim');
% %     text(xlim(2),ylim(2)-10,desc);
% %     
% %     figure('name','crosstalk compare CH3','numbertitle','off');
% %     plot(x,N32I,':r',x,NTH32I,'g',x,NTri32I,'-.b');
% %     legend('N32I','NTH32I','NTri32I');
% %     xlim=get(gca,'XLim');
% %     ylim=get(gca,'YLim');
% %     text(xlim(2),ylim(2)-10,desc);
% %     
% %     figure('name','crosstalk compare CH4','numbertitle','off');
% %     plot(x,N42I,':r',x,NTH42I,'g',x,NTri42I,'-.b');
% %     legend('N42I','NTH42I','NTri42I');
% %     xlim=get(gca,'XLim');
% %     ylim=get(gca,'YLim');
% %     text(xlim(2),ylim(2)-10,desc);
    
end

