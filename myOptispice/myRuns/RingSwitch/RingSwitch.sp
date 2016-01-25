Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG  AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27


.param PI=3.14159265358979
.param FourPI='4*3.1415926'
.param PIover2='3.1415926/2.0'

.param lam=1557.81

.param Non = 3.0 
.param Noff = 3.012  
.param gain=0.97
.param r=10
.param C = 0.3
.param moptl='2.5*r*Non*2*PI'
.param Von = 0
.param Voff = 0.012
.param PHI=0.0


% Voltage sources
v1 Mag1 0 DC = 0 pulse 0 1 .02n .005n .005n .01n .03n
% pulse 0 1 .02n .005n .005n .01n .04n
v2 Phi1 0 DC = 0 

VsN1 vn 0 0 DC=0 PWL 0 0 0.5n 0.0 0.55n Voff 10n Voff

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 Rin1] MoName = CWmodel lambda=lam
Osp OpticalRing   Name = ring1 Nodes = [Rin1 Rin2 Rout1 Rout2] MoName = RingModel1
+ LayerCNodes = [{vn 0}{vn 0}] InitialVs = [0.0]

Osp MIRROR        Name = Rmir1 Nodes = [Rin2]  MoName = Mmodel 
Osp MIRROR        Name = Rmir2 Nodes = [Rout1] MoName = Mmodel 
Osp MIRROR        Name = Rmir3 Nodes = [Rout2] MoName = Mmodel 


Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
Osp Model Name = CWmodel  type = CWSOURCE lambda=lam

Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten= gain Index = [Non]  
+         dNdV = [1.0] MaxOptLen=[moptl]

Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r

.tran .001n 1n  MinSt=1e-4n MaxSt=1e-4n 

.Monitor V Mag1

.Monitor OptPower Rin1 dir=FWD Pol=TE 
.Monitor OptPower Rin2 dir=REV Pol=TE 
.Monitor OptPower Rout1 dir=FWD Pol=TE 
.Monitor OptPower Rout2 dir=FWD Pol=TE 

.Monitor V vn
.end
