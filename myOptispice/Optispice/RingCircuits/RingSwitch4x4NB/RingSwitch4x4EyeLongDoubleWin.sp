Title 'CW Source check'

% .include 'TwoBySw.sp'

%Osp Jobcontrol Verbosity=DEBUG  AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param PI=3.14159265358979
.param FourPI='4*3.1415926'
.param PIover2='3.1415926/2.0'

.param Non = 3.0 
.param Noff = 3.012  
.param gain=GAIN
.param r=10
.param Co2 = 'PI*r'

% .param C = CC0
.param C = 0.2
.param C2 = 0.30
% .param C3 = 0.03
.param C3 = CC0
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

% Voltage sources

% v1 Mag1 0 DC = 1.000000 pulse 1.000000 0.000000 .0125n .025n .025n .025n .16n
% v2 Mag2 0 DC = 1.000000 pulse 1.000000 0.000000 .0125n .025n .025n .025n .16n
% v5 Mag3 0 DC = 0.000000 pulse 0.000000 1.000000 .0125n .025n .025n .025n .16n
% v7 Mag4 0 DC = 0.000000 pulse 0.000000 1.000000 .0125n .025n .025n .025n .16n

% v1 Mag1 0 DC = 0.000000 pulse 0.000000 1.000000 .00625n .0125n .0125n .00625n .05n
% v2 Mag2 0 DC = 0.000000 pulse 0.000000 0.000000 .00625n .0125n .0125n .00625n .05n
% v5 Mag3 0 DC = 0.000000 pulse 0.000000 0.000000 .00625n .0125n .0125n .00625n .05n
% v7 Mag4 0 DC = 0.000000 pulse 0.000000 0.000000 .00625n .0125n .0125n .00625n .05n

% v1 Mag1 0 DC = 1
% v2 Mag2 0 DC = 1
% v5 Mag3 0 DC = 1
% v7 Mag4 0 DC = 1


.Osp BitGen VGen1 Mag1 0 DCOffset=0 nBitStream = 0101010101 Period = 10 BitMag=BitON1 RiseTime=Rise Length=BitLength FallTime=Fall nPulseShape=LIN
.Osp BitGen VGen2 Mag2 0 DCOffset=0 nBitStream = 1010010010 Period = 10 BitMag=BitON2 RiseTime=Rise Length=BitLength2 FallTime=Fall nPulseShape=LIN
.Osp BitGen VGen3 Mag3 0 DCOffset=0 nBitStream = 0001011110 Period = 10 BitMag=BitON3 RiseTime=Rise Length=BitLength3 FallTime=Fall nPulseShape=LIN
.Osp BitGen VGen4 Mag4 0 DCOffset=0 nBitStream = 1011001010 Period = 10 BitMag=BitON4 RiseTime=Rise Length=BitLength4 FallTime=Fall nPulseShape=LIN

% .Osp BitGen VGen2 Mag2 0 DCOffset=0 BitMag=1.0 RiseTime = Rise Length=BitLength FallTime=Fall 
% .Osp BitGen VGen3 Mag3 0 DCOffset=0 BitMag=1.0 RiseTime = Rise Length=BitLength FallTime=Fall 
% .Osp BitGen VGen4 Mag4 0 DCOffset=0 BitMag=1.0 RiseTime = Rise Length=BitLength FallTime=Fall 


% v1 Mag1 0 DC = 0  vo = 1.000000 va = 0.000000 tranMode=GAUSSIAN sigma=.02n t0=0.05n
% v2 Mag2 0 DC = 0  vo = 1.000000 va = 0.000000 tranMode=GAUSSIAN sigma=.02n t0=0.05n
% v5 Mag3 0 DC = 0  vo = 0.000000 va = 1.000000 tranMode=GAUSSIAN sigma=.02n t0=0.05n
% v7 Mag4 0 DC = 0  vo = 0.000000 va = 1.000000 tranMode=GAUSSIAN sigma=.02n t0=0.05n

v3 Phi1 0 DC = 0.000000 
v4 Phi2 0 DC = 0.000000 
v6 Phi3 0 DC = 0.000000
v8 Phi4 0 DC = 0.000000 

% pwl 0 0 3n PI

vT Tp 0 DC=0 pwl 0 TEMP

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
Osp CWSOURCE      Name = cw2 Nodes = [Mag2 Phi2 NorthIn] MoName = CWmodel lambda=lam 
Osp CWSOURCE      Name = cw3 Nodes = [Mag3 Phi3 EastIn] MoName = CWmodel lambda=lam 
Osp CWSOURCE      Name = cw4 Nodes = [Mag4 Phi4 SouthIn]  MoName = CWmodel lambda=lam 

X10 vn1 vn2 vn34 vn56 vn7 vn8 EastIn NorthIn WestIn NorthOut SouthIn SouthOut EastOut WestOut 4x4OpDoubleRing 

Osp MIRROR        Name = MNorthOut Nodes = [NorthOut] MoName = Mmodel 
Osp MIRROR        Name = MWestOut Nodes = [WestOut] MoName = Mmodel 
Osp MIRROR        Name = MEastOut Nodes = [EastOut] MoName = Mmodel 
Osp MIRROR        Name = MSouthOut Nodes = [SouthOut] MoName = Mmodel 

% gain is for pwr so sqrt is taken 
.param lam=1557.81
% .op 

% .tran .001n .2n sweep PHI start=0 stop=3.14 step=.314 MinSt=1e-4n MaxSt=1e-4n  
.tran STEP SIMTIME  MinSt=STEP MaxSt=STEP


.Monitor OptPower WestIn Format=Mag dir=BOTH Pol=TE  
.Monitor OptPower NorthIn Format=Mag dir=BOTH Pol=TE  
.Monitor OptPower EastIn Format=Mag dir=BOTH Pol=TE  
.Monitor OptPower SouthIn Format=Mag dir=BOTH Pol=TE  


.Monitor OptPower WestOut Format=Mag dir=BOTH Pol=TE  
.Monitor OptPower NorthOut Format=Mag dir=BOTH Pol=TE  
.Monitor OptPower EastOut Format=Mag dir=BOTH Pol=TE  
.Monitor OptPower SouthOut Format=Mag dir=BOTH Pol=TE  

.Monitor V Mag1
.Monitor V Mag2
.Monitor V Mag3
.Monitor V Mag4

.Monitor V Phi1
.Monitor V Phi2
.Monitor V Phi3
.Monitor V Phi4



.SUBCKT 2DoubleRing2 SIG5 SIG6 SIG3 SIG2 vn34 
X1 SIG5 SIG6 SIG9 SIG12 vn34 4PortDoubleRing
X2 SIG12 SIG9 SIG3 SIG2 vn34 4PortDoubleRing
.ENDS 2Ring2


.SUBCKT 4x4OpDoubleRing vn1 vn2 SIG4 SIG9 vn7 vn8 SIG1 SIG3 SIG27 SIG16 SIG7 SIG11 SIG21 SIG26 
X3 SIG11 SIG7 SIG5 SIG14 vn1 4PortDoubleRing
X4 SIG1 SIG16 SIG17 SIG18 vn2 4PortDoubleRing 
X5 SIG19 SIG20 SIG21 SIG27 vn7 4PortDoubleRing 
X6 SIG23 SIG24 SIG3 SIG26 vn8 4PortDoubleRing 

X7 SIG20 SIG5 SIG23 SIG18 SIG4 2DoubleRing2 
X8 SIG19 SIG14 SIG17 SIG24 SIG9 2DoubleRing2 
.ENDS 4x4OpDoubleRing


.SUBCKT 4PortDoubleRing In21 In22 In23 In24 vc1
Osp XCOUPLER          Name = xc3    Nodes = [In21 int21 In23 int22] MoName = XCmodel2
Osp MultiLayerFilter  Name = rightF12 Nodes = [int22  int24]             MoName = RingFilter1expV
+                     FilterCNodes = [{vc1 0}] InitialVs = [0.0]
Osp MultiLayerFilter  Name = leftF12  Nodes = [int21   int23]            MoName = RingFilter1expV
+                     FilterCNodes = [{vc1 0}] InitialVs = [0.0]
Osp XCOUPLER          Name = xc4    Nodes = [int23 Int2 int24 Int4] MoName = XCmodel3

Osp MultiLayerFilter  Name = rightF22 Nodes = [Int4  Int5]             MoName = RingFilter1expV
+                     FilterCNodes = [{vc1 0}] InitialVs = [0.0]
Osp MultiLayerFilter  Name = leftF22  Nodes = [Int2  Int6]            MoName = RingFilter1expV
+                     FilterCNodes = [{vc1 0}] InitialVs = [0.0]
Osp XCOUPLER          Name = xc5    Nodes = [Int6 In24 Int5 In22] MoName = XCmodel2
.ENDS 4PortDoubleRing


Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 

Osp Model Name = CWmodel  type = CWSOURCE lambda=lam

Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
+         dNdV = [1.0] MaxOptLen=[moptl]

Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r

Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C
Osp Model Name = XCmodel2  type = XCOUPLER Conjugate=0 c = C2
Osp Model Name = XCmodel3  type = XCOUPLER Conjugate=0 c = C3

Osp Model Name = RingFilter1expV type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non] Thickness = [Co2]
+         dNdV = [1.0] MaxOptLen=[moptl]



.end
