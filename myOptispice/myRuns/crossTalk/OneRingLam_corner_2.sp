Title 'CW Source check'
.
%.include '../TwoBySw.sp'

%Osp Jobcontrol Verbosity=DEBUG

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param PI=3.14159265358979
.param FourPI='4*3.1415926'
.param PIover2='3.1415926/2.0'

.param Non = 3.0 
.param Noff = 3.012  
.param gain=GAIN
.param r=10
.param C = CC0
.param moptl='2.5*r*Non*2*PI'

.param Voffset = 0.0e-4
.param Von = '0 + Voffset'
.param Voff = '0.012 + Voffset'

.param Rise=RISE
.param Fall=RISE
.param BitLength=LENGTH1
.param BitLength2=LENGTH2
.param BitLength3=LENGTH3
.param BitLength4=LENGTH4


v22 Mag1 0 DC = 1.000000 

v3 Phi1 0 DC = 0.000000 



vT Tp 0 DC=0 pwl 0 0 2n 0

VsN1 vn1 vn1b Voff
E1 vn1b 0 vcvs Tp 0 0.33

VsN2 vn2 vn2b Von 
E2 vn2b 0 vcvs Tp 0 0

VsN34 vn34 vn34b Von
E3 vn34b 0 vcvs Tp 0 0.33

VsN56 vn56 vn56b Von
E4 vn56b 0 vcvs Tp 0 0.66

VsN7 vn7 vn7b Voff 
E5 vn7b 0 vcvs Tp 0 1.0

VsN8 vn8 vn8b Von
E6 vn8b 0 vcvs Tp 0 0.66


Osp CWSOURCE      Name = cw1 Nodes = [Mag1 Phi1 WestIn]  MoName = CWmodel lambda=lam 
%Osp CWSOURCE      Name = cw2 Nodes = [Mag2 Phi2 NorthIn] MoName = CWmodel lambda=lam 
%Osp CWSOURCE      Name = cw3 Nodes = [Mag3 Phi3 EastIn] MoName = CWmodel lambda=lam 
%Osp CWSOURCE      Name = cw4 Nodes = [Mag4 Phi4 SouthIn]  MoName = CWmodel lambda=lam 

% Osp MIRROR        Name = Rmir1 Nodes = [NorthIn] MoName = Mmodel 
% Osp MIRROR        Name = Rmir4 Nodes = [WestIn] MoName = Mmodel 
% Osp MIRROR        Name = Rmir2 Nodes = [SouthIn] MoName = Mmodel 
% Osp MIRROR        Name = Rmir3 Nodes = [EastIn] MoName = Mmodel 

Osp OpticalRing   Name = R1 Nodes = [NorthOut WestIn N12 N15] MoName = RingModel1
+ LayerCNodes = [{vn1 0}{vn1 0}] InitialVs = [0.0]
%Osp OpticalRing   Name = R2 Nodes = [NorthIn WestOut N26 N23] MoName = RingModel1
%+ LayerCNodes = [{vn2 0}{vn2 0}] InitialVs = [0.0]

%top left bottom right 
%xSw43 N12 N37 N48 N23 vn34 TwoBySw C=C r=r Non=Non gain=gain 
%xSw65 N15 N57 N68 N26 vn56 TwoBySw C=C r=r Non=Non gain=gain 

%Osp OpticalRing   Name = R7 Nodes = [N57 N37 EastOut SouthIn] MoName = RingModel1
%+ LayerCNodes = [{vn7 0}{vn7 0}] InitialVs = [0.0]
%Osp OpticalRing   Name = R8 Nodes = [N48 N68 EastIn SouthOut] MoName = RingModel1
%+ LayerCNodes = [{vn8 0}{vn8 0}] InitialVs = [0.0]

Osp MIRROR        Name = MNorthOut Nodes = [NorthOut] MoName = Mmodel 
Osp MIRROR        Name = Rmir1N12 Nodes = [N12] MoName = Mmodel 
Osp MIRROR        Name = Rmir1N15 Nodes = [N15] MoName = Mmodel  
%Osp MIRROR        Name = MWestOut Nodes = [WestOut] MoName = Mmodel 
%Osp MIRROR        Name = MEastOut Nodes = [EastOut] MoName = Mmodel 
%Osp MIRROR        Name = MSouthOut Nodes = [SouthOut] MoName = Mmodel 

Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
Osp Model Name = CWmodel  type = CWSOURCE lambda=lam

% gain is for pwr so sqrt is taken 
.param lam=1557.81
% .op 

% .tran .001n .2n sweep PHI start=0 stop=3.14 step=.314 MinSt=1e-4n MaxSt=1e-4n
.tran .01n .2n MinSt=1e-4n MaxSt=1e-4n    
% .tran STEP SIMTIME  MinSt=STEP MaxSt=STEP


.Monitor OptPower WestIn Format=Mag dir=IN Pol=TE
.Monitor OptPower WestIn Format=Mag dir=OUT Pol=TE
  

.Monitor OptPower NorthOut Format=Mag dir=IN Pol=TE
.Monitor OptPower NorthOut Format=Mag dir=OUT Pol=TE
  


%.Monitor V Mag1
%.Monitor V Mag2
%.Monitor V Mag3
%.Monitor V Mag4

%.Monitor V Phi1
%.Monitor V Phi2
%.Monitor V Phi3
%.Monitor V Phi4

Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
+         dNdV = [1.0] MaxOptLen=[moptl]

Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r


.end
