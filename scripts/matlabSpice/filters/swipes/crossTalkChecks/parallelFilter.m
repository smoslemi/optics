clear
lam1 =1530*(10^(-9));
nt=16; %total number of channels
n1=8; % numebers of channles in on path
np=nt/n1; % number of pathes
dlamCh=3*(10^(-9));
dlamTot=(nt-1)*dlamCh;
lam(1,1)=lam1;
nch =0;
for i=1:1:np
    for j=1:1:n1
        nch=nch+1;
        lam(i,j)=lam(1,1)+(nch-1)*dlamCh
    end
end
lam(1,8)
fsr=lam(2,1)-lam(1,1);
m=lam(1,1)/fsr
m=vpa(int64(m))-2
neff = 1.6532;
BW = 25*(10^(-10));
fsr=lam(1,1)/m
% 
% neff;
% alam(1);
% am;
% nt;
% BW;
% neff
% alam(1)
% eval(am)
% n1
% BW
% %nchfilter2(neff,lam11,m,n,BW)
 nchfilter3(neff,lam(2,1),dlamCh,eval(m),n1, BW)