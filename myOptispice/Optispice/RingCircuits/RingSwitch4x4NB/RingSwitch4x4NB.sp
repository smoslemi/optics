Title 'CW Source check'

.include 'TwoBySw.sp'

Osp Jobcontrol Verbosity=DEBUG  AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param PI=3.14159265358979
.param FourPI='4*3.1415926'
.param PIover2='3.1415926/2.0'

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
% v1 Mag1 0 DC = 0 pulse 0 1 .02n .005n .005n .01n .08n
v1 Mag1 0 DC = 0  vo = 0.0 va = 1.0 tranMode=GAUSSIAN sigma=.0075n t0=0.02n
v3 Phi1 0 DC = 0 

v2 Mag2 0 DC = 1 pulse 0 1 .01n .005n .005n .01n .16n
v4 Phi2 0 DC = PHI 
% pwl 0 0 3n PI


VsN1 vn1 0 Voff
VsN2 vn2 0 Voff 
VsN34 vn34 0 Voff
VsN56 vn56 0 Von
VsN7 vn7 0 Voff 
VsN8 vn8 0 Voff

Osp CWSOURCE      Name = cw1 Nodes = [Mag1 Phi1 WestIn] MoName = CWmodel lambda=lam 
Osp CWSOURCE      Name = cw2 Nodes = [Mag2 Phi2 EastIn] MoName = CWmodel lambda=lam 

Osp OpticalRing   Name = R1 Nodes = [NorthOut WestIn N12 N15] MoName = RingModel1
+ LayerCNodes = [{vn1 0}{vn1 0}] InitialVs = [0.0]
Osp OpticalRing   Name = R2 Nodes = [NorthIn WestOut N26 N23] MoName = RingModel1
+ LayerCNodes = [{vn2 0}{vn2 0}] InitialVs = [0.0]

%top left bottom right 
xSw43 N12 N37 N48 N23 vn34 TwoBySw C=C r=r Non=Non gain=gain 
xSw65 N15 N57 N68 N26 vn56 TwoBySw C=C r=r Non=Non gain=gain 

Osp OpticalRing   Name = R7 Nodes = [N57 N37 EastOut SouthIn] MoName = RingModel1
+ LayerCNodes = [{vn7 0}{vn7 0}] InitialVs = [0.0]
Osp OpticalRing   Name = R8 Nodes = [N48 N68 EastIn SouthOut] MoName = RingModel1
+ LayerCNodes = [{vn8 0}{vn8 0}] InitialVs = [0.0]

Osp MIRROR        Name = MNorthIn Nodes = [NorthIn] MoName = Mmodel 
Osp MIRROR        Name = MNorthOut Nodes = [NorthOut] MoName = Mmodel 

Osp MIRROR        Name = MWestOut Nodes = [WestOut] MoName = Mmodel 

Osp MIRROR        Name = MEastOut Nodes = [EastOut] MoName = Mmodel 
% Osp MIRROR        Name = MEastIn Nodes = [EastIn] MoName = Mmodel 

Osp MIRROR        Name = MSouthOut Nodes = [SouthOut] MoName = Mmodel 
Osp MIRROR        Name = MSouthIn Nodes = [SouthIn] MoName = Mmodel 

Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
Osp Model Name = CWmodel  type = CWSOURCE lambda=lam

% gain is for pwr so sqrt is taken 
.param lam=1557.81
% .op 

% .tran .001n .2n sweep PHI start=0 stop=3.14 step=.314 MinSt=1e-4n MaxSt=1e-4n  
.tran .001n 0.05n  MinSt=1e-4n MaxSt=1e-4n 

.Monitor OptFields WestIn Format=Mag dir=BOTH Pol=TE  
.Monitor OptFields WestOut Format=Mag dir=BOTH Pol=TE  

.Monitor OptFields NorthIn Format=Mag dir=BOTH Pol=TE  
.Monitor OptFields NorthOut Format=Mag dir=BOTH Pol=TE  

.Monitor OptFields EastIn Format=Mag dir=BOTH Pol=TE  
.Monitor OptFields EastOut Format=Mag dir=BOTH Pol=TE  

.Monitor OptFields SouthIn Format=Mag dir=BOTH Pol=TE  
.Monitor OptFields SouthOut Format=Mag dir=BOTH Pol=TE  

.Monitor V Mag1
.Monitor V Mag2
.Monitor V Phi2

Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
+         dNdV = [1.0] MaxOptLen=[moptl]

Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r


.end
