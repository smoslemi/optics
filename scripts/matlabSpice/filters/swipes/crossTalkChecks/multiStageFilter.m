clear
lam1 =1530*(10^(-9));
nt=16;
n1=4;
n2=nt/n1;
nx2=n2/2;
dlamCh=3*(10^(-9));
dlamTot=(nt-1)*dlamCh;
lam(1)=lam1;
for i=2:1:nt
    lam(i)=lam(1)+(i-1)*dlamCh;
end
afsr=lam(nt)-lam(1);
alam(1)=0.5*(lam(nx2)+lam(nx2+1));
adlamCh=(n2-1)*dlamCh
am=alam(1)/afsr -1
am=vpa(int64(am));
neff = 1.4;
BW = 25*(10^(-10));

neff;
alam(1);
am;
nt;
BW;
neff
alam(1)
eval(am)
n1
BW
%nchfilter2(neff,lam11,m,n,BW)
nchfilter2(neff,alam(1),eval(am),n1, BW)