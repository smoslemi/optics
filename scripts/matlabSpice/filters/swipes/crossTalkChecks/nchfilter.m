function nchfilter(neff,lam11,m,n)

% Simple theory and design specs
r1=(m*lam11)/(neff*2*pi)
fsr1=(lam11^2)/(neff*2*pi*r1)
lam12=lam11+fsr1
% Spec is to have the 8 channles in the first channle resonat interval
% Meaning the channels window is [lam1 lam1+fsr1]
% n=8 for an 8-ch filter
% Channles are equaly spced with wavelength difference as dlam1
dlam1 = fsr1/n
lam(1)=lam11;
r(1)=r1;
fsr(1)=fsr1;
fwhm(1)=0; % just to initialize fwhm
for i=2:1:8
    lam(i)=lam(1)+(i-1)*dlam1;
    r(i)= r(1)*(lam(i)/lam12);
    fsr(i)=(lam(i)^2)/(neff*2*pi*r(i))
end
% Get the max value for the cross coupling from the constrient on individual
% channle bandwidth. Channels should not overlap
% Assumption a=1.0, 'a' is the attenuation factor.
a = 1;
cmax = maxK(neff,r(1),lam(1),r(2),lam(2),1.0)
c = 0.5*cmax; % That is just a pick of a value less than max
% Assumption: All rings have same cross-coupling coeff.
% 'r' is the self-coupling factros (trasmission factor)
rmin = sqrt(1-c^2);

for i=1:8
    fwhm(i)=(c^2*lam(i)^2)/(pi*2*pi*r(i)*neff*sqrt(1-c^2));
end

fwhm(8)
for i=1:8
    sprintf('%1.4e , %1.4e , %1.4e, %1.4e',r(i),lam(i),fwhm(i),fsr(i)) 
end

lam;
r;
end
function c1 = maxK(neff,r1,lam1,r2,lam2,a)
syms k
fwhm1=(k^2*lam1^2)/(pi*2*pi*r1*neff*sqrt(1-k^2));
fwhm2=(k^2*lam2^2)/(pi*2*pi*r2*neff*sqrt(1-k^2));
x1=lam1+0.5*fwhm1;
x2=lam2-0.5*fwhm2;
[solk]=solve(x1-x2==0);
c1=vpa(solk)
c1=c1(c1>0)
end