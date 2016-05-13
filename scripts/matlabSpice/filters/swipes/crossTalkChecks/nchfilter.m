function nchfilter(neff,lam11,m,n,BW)

% Straight forward theory and design specs
% params
% p1- neff: material/structure dependent.
% p2- m:    wavelenght number (I chosed by trial and error based on the
% results ring sizes. 
% Spec
% S1- n:    Nomber of channels.
% S2- lam11:    Wavelength window = [lam11, lam11+FSR1], the upper limist is not choosen it. it
% is defined by the FSR of the first channel. Working with neff and ring
% size we can change the FSR. Other ways to change FSR will include circuit
% changes.
% S3- BW; This will set the minimun cross-coupling
% value, which is related to the gap between the waveguide and the ring.
% S4- The limits on losses will put limits on the ring sizes. I haven't considred this
% effect here for now.
% Disgn constrints:
% C1- Avoid resonant spliting; which gives us the maximun value for
% cross-coupling coeff.
% C2- Lower crosstalk which calls for high-Q filter. 


% Spec is to have the 8 channles in the first channle resonat interval
% Meaning the channels window is [lam1 lam1+fsr1]
% n=8 for an 8-ch filter
% Note: We chose to have equally spced channeles with wavelength difference as dlam1

[r1,fsr1,lam12,dlam1]= getCH1(neff,lam11,m,n);

lam(1)=lam11;
r(1)=r1;
fsr(1)=fsr1;
fwhm(1)=0; % just to initialize fwhm

c = 299792458; % speed of light

for i=2:1:n
    lam(i)=lam(1)+(i-1)*dlam1;
    r(i)= r(1)*(lam(i)/lam12);
    fsr(i)=(lam(i)^2)/(neff*2*pi*r(i));
end
Mlam = lam(1); % main wavelenght to calculate the total bandwidth.
% Get the max value for the cross coupling from the constrient on individual
% channle bandwidth. Channels should not overlap

a = 1; % Assumption a=1.0, 'a' is the attenuation factor.

kmax = maxK(neff,r(1),lam(1),r(2),lam(2),a);
kmin=minK(c,neff,Mlam,r,lam,a,n,BW);
csmax = sqrt(kmax); % cs is the cross-coupling factor used is ospcie
csmin = sqrt(kmin); % cs is the cross-coupling factor used is ospcie

b= 0.2 % just a random number to pick k between kmin and kmax
k = b*kmax; % That is just a pick of a value less than kmax
% loop to make sure k is greater than kmin
while k < kmin
    b=b+0.005
    k=b*kmax;
end

kmax
kmin
k



cs= sqrt(k) % c is the cross-coupling factor used is ospcie
% Assumption: All rings have same cross-coupling coeff.
% 'rc' is the self-coupling factros (trasmission factor)
rc = sqrt(1-k^2);

for i=1:n
    fwhm(i)=((1-rc^2.*a)*lam(i)^2)/(pi*2*pi*r(i)*neff*rc*sqrt(a));
end

totDlam = sum(fwhm)
%dlam1_8= 8*fwhm(4)
totBW= c*(totDlam/Mlam^2)
for i=1:1
    sprintf('%1.4e , %1.4e , %1.4e, %1.4e',r(i),lam(i),fwhm(i),fsr(i)) 
end

lam;
r;
outID=fopen('designSpecPara.txt','w');
fprintf(outID,'%s\n','Design Spec');

end
function [r,fsr,lamf,dlam]= getCH1(neff,lam11,m,n)
r=(m*lam11)/(neff*2*pi);
fsr=(lam11^2)/(neff*2*pi*r);
lamf=lam11+fsr;
% Spec is to have the 8 channles in the first channle resonat interval
% Meaning the channels window is [lam1 lam1+fsr1]
% n=8 for an 8-ch filter
% Note: We chose to have equally spced channeles with wavelength difference as dlam1
dlam = fsr/n;
end

function k1 = maxK(neff,r1,lam1,r2,lam2,a)
syms k
rk=sqrt(1-k^2);
fwhm1=((1-a*rk^2)*lam1^2)/(pi*2*pi*r1*neff*rk*sqrt(a));
fwhm2=((1-a*rk^2)*lam2^2)/(pi*2*pi*r2*neff*rk*sqrt(a));
x1=lam1+0.5*fwhm1;
x2=lam2-0.5*fwhm2;
[solk]=solve(x1-x2==0);
k1=vpa(solk);
k1=k1(k1>0);
end

function k1=minK(c,neff,Mlam,r,lam,a,n,BWv)
syms k
rk=sqrt(1-k^2);

for i=1:n
    fwhm(i)=((1-rk^2.*a)*lam(i)^2)/(pi*2*pi*r(i)*neff*rk*sqrt(a));
end

bw = (c/Mlam^2)*sum(fwhm);
[solk]=solve(bw==25*BWv);
k1=vpa(solk);
k1=k1(k1>0);
vpa(fwhm(1));
vpa(bw);
end

