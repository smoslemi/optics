Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG  AllMon=0 AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param PI=3.14159265358979
.param FourPI='4*3.1415926'
.param PIover2='3.1415926/2.0'
.param Noffset = 3.0e-4
%.param Non = '3.0  + Noffset'
%.param Noff = '3.012 + Noffset'


.param NMODES=1

* Voltage sources
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0

* lambda sweep Voltage
vcar vc 0 DC=1514

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

** gain is for pwr so sqrt is taken 
.param gain='1'
.param C = '1.500000e-01'
.param Non = '1.100000e+00'
%.param dr = '6.000000e-02'
.param dr = '0.022'
.param xr1='8.850000e+00'
.param r2='r1-dr'
.param r3='r2-dr'
.param r4='r3-dr'
.param r5='r4-dr'
.param r6='r5-dr'
.param r7='r6-dr'
.param r8='r7-dr'
.param lam=1514

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%% START SUBCKT %%%%%%%%%%%%%%%%%%%%%%%%

.SUBCKT X6rings inS drS thS adS


Osp OpticalRing   Name = Xsring1 Nodes = [inS s12 thS s14] MoName = RingModelx1
Osp OpticalRing   Name = Xsring2 Nodes = [s12 s22 s23 s24] MoName = RingModelx1
Osp OpticalRing   Name = Xsring3 Nodes = [s22 drS s33 adS] MoName = RingModelx1


Osp MIRROR        Name = mirXsring1P4 Nodes = [s14] MoName = Mmodel
Osp MIRROR        Name = mirXsring2P3 Nodes = [s23] MoName = Mmodel
Osp MIRROR        Name = mirXsring2P4 Nodes = [s24] MoName = Mmodel
Osp MIRROR        Name = mirXsring3P2 Nodes = [s33] MoName = Mmodel


%%Osp OpticalRing   Name = Xpring1 Nodes = [s13 p12 p13 p14] MoName = RingModelx1
%%Osp OpticalRing   Name = Xpring2 Nodes = [p13 p22 p23 p24] MoName = RingModelx1
%%Osp OpticalRing   Name = Xpring3 Nodes = [p23 p32 thS p34] MoName = RingModelx1

%%Osp MIRROR        Name = mirXpring1P2 Nodes = [p12] MoName = Mmodel
%%Osp MIRROR        Name = mirXpring1P4 Nodes = [p14] MoName = Mmodel
%%Osp MIRROR        Name = mirXpring2P2 Nodes = [p22] MoName = Mmodel
%%Osp MIRROR        Name = mirXpring2P4 Nodes = [p24] MoName = Mmodel
%%Osp MIRROR        Name = mirXpring3P2 Nodes = [p32] MoName = Mmodel
%%Osp MIRROR        Name = mirXpring3P4 Nodes = [p34] MoName = Mmodel




% Mirror Model
Osp Model Name = Mmodel   type = MIRROR Ref = 0.0
%Ring general Model statment
Osp Model Name = RingModelx1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = xr1
% Coupling Model
Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

% Filter model
Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]

.ends X6rings
%%%%%%%%%%%%%%%%%%%%%%%% END SUBCKT %%%%%%%%%%%%%%%%%%%%%%%%

% circuit 1, 8 channel add-drop filter
% 1 cw source 8 rings, 8 cross,

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc


% CHANGING ring R based on calculations


X1 N11 N12 N13 N14 X6rings xr1='8.85'
X2 N21 N22 N23 N24 X6rings xr1='8.85-dr'
X3 N31 N32 N33 N34 X6rings xr1='8.85-2*dr'
X4 N41 N42 N43 N44 X6rings xr1='8.85-3*dr'
X5 N51 N52 N53 N54 X6rings xr1='8.85-4*dr'
X6 N61 N62 N63 N64 X6rings xr1='8.85-5*dr'
X7 N71 N72 N73 N74 X6rings xr1='8.85-6*dr'
X8 N81 N82 N83 N84 X6rings xr1='8.85-7*dr'

%X1 N11 N12 N13 N14 X6rings xr1='8.85'
%X2 N21 N22 N23 N24 X6rings xr1='8.822'
%X3 N31 N32 N33 N34 X6rings xr1='8.794'
%X4 N41 N42 N43 N44 X6rings xr1='8.766'
%X5 N51 N52 N53 N54 X6rings xr1='8.738'
%X6 N61 N62 N63 N64 X6rings xr1='8.71'
%X7 N71 N72 N73 N74 X6rings xr1='8.682'
%X8 N81 N82 N83 N84 X6rings xr1='8.654'

%%X1 N11 N12 N13 N14 X6rings xr1='8.85'
%%X2 N21 N22 N23 N24 X6rings xr1='8.79'
%%X3 N31 N32 N33 N34 X6rings xr1='8.73'
%%X4 N41 N42 N43 N44 X6rings xr1='8.67'
%%X5 N51 N52 N53 N54 X6rings xr1='8.61'
%%X6 N61 N62 N63 N64 X6rings xr1='8.55'
%%X7 N71 N72 N73 N74 X6rings xr1='8.49'
%%X8 N81 N82 N83 N84 X6rings xr1='8.43'


%Osp OpticalRing   Name = ring1 Nodes = [N11 N12 N13 N14] MoName = RingModel1
%Osp OpticalRing   Name = ring2 Nodes = [N21 N22 N23 N24] MoName = RingModel2
%Osp OpticalRing   Name = ring3 Nodes = [N31 N32 N33 N34] MoName = RingModel3
%Osp OpticalRing   Name = ring4 Nodes = [N41 N42 N43 N44] MoName = RingModel4
%Osp OpticalRing   Name = ring5 Nodes = [N51 N52 N53 N54] MoName = RingModel5
%Osp OpticalRing   Name = ring6 Nodes = [N61 N62 N63 N64] MoName = RingModel6
%Osp OpticalRing   Name = ring7 Nodes = [N71 N72 N73 N74] MoName = RingModel7
%Osp OpticalRing   Name = ring8 Nodes = [N81 N82 N83 N84] MoName = RingModel8

%%Osp WaveGuide  Name=wg1 Nodes = [N13 x11] MoName=WGmodel  
%%Osp WaveGuide  Name=wg2 Nodes = [N14 x12] MoName=WGmodel
  
Osp XCOUPLER    Name=wx1 Nodes = [N13 N14 N21 x14] MoName=WXmodel  
Osp XCOUPLER    Name=wx2 Nodes = [N23 N24 N31 x24] MoName=WXmodel 
Osp XCOUPLER    Name=wx3 Nodes = [N33 N34 N41 x34] MoName=WXmodel 
Osp XCOUPLER    Name=wx4 Nodes = [N43 N44 N51 x44] MoName=WXmodel 
Osp XCOUPLER    Name=wx5 Nodes = [N53 N54 N61 x54] MoName=WXmodel 
Osp XCOUPLER    Name=wx6 Nodes = [N63 N64 N71 x64] MoName=WXmodel 
Osp XCOUPLER    Name=wx7 Nodes = [N73 N74 N81 x74] MoName=WXmodel 
Osp XCOUPLER    Name=wx8 Nodes = [N83 N84 x83 x84] MoName=WXmodel

Osp MIRROR        Name = mirR1P2 Nodes = [N12] MoName = Mmodel
Osp MIRROR        Name = mirR2P2 Nodes = [N22] MoName = Mmodel
Osp MIRROR        Name = mirR3P2 Nodes = [N32] MoName = Mmodel
Osp MIRROR        Name = mirR4P2 Nodes = [N42] MoName = Mmodel
Osp MIRROR        Name = mirR5P2 Nodes = [N52] MoName = Mmodel
Osp MIRROR        Name = mirR6P2 Nodes = [N62] MoName = Mmodel
Osp MIRROR        Name = mirR7P2 Nodes = [N72] MoName = Mmodel
Osp MIRROR        Name = mirR8P2 Nodes = [N82] MoName = Mmodel
Osp MIRROR        Name = mirWx1P4 Nodes = [x14] MoName = Mmodel
Osp MIRROR        Name = mirWx2P4 Nodes = [x24] MoName = Mmodel
Osp MIRROR        Name = mirWx3P4 Nodes = [x34] MoName = Mmodel
Osp MIRROR        Name = mirWx4P4 Nodes = [x44] MoName = Mmodel
Osp MIRROR        Name = mirWx5P4 Nodes = [x54] MoName = Mmodel
Osp MIRROR        Name = mirWx6P4 Nodes = [x64] MoName = Mmodel
Osp MIRROR        Name = mirWx7P4 Nodes = [x74] MoName = Mmodel 
Osp MIRROR        Name = mirWx8P3 Nodes = [x83] MoName = Mmodel
Osp MIRROR        Name = mirWx8P4 Nodes = [x84] MoName = Mmodel 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Mirror Model
Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 

% Source Model
Osp Model Name = CWmodel  type = CWSOURCE NumModes = NMODES lambda=lam



% Ring related Models  START

%Ring general Model statment
Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r1
Osp Model Name = RingModel2 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r2
Osp Model Name = RingModel3 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r3
Osp Model Name = RingModel4 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r4
Osp Model Name = RingModel5 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r5
Osp Model Name = RingModel6 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r6
Osp Model Name = RingModel7 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r7
Osp Model Name = RingModel8 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r8

% Coupling Model
Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

% Filter model
Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
  
% Ring related Models  END

% Xcouple model
Osp Model Name = WXmodel  type = XCOUPLER ElemType=WGUIDECROSS  NumModes = NMODES Through=0.98 Right=0.1 Left=0.1 Ref=0.1


% WGuide model
Osp Model Name = WGmodel  type = WaveGuide  Length=0.125   neff=[Non]  N0=Non NF=Non
%Osp Model Name = WGmodel  type = WaveGuide  Length=0.125   neff=[NonWG]  N0=NonWG NF=NonWG



.op 
.DC vcar 1500 1580 0.1
%.tran .1e-9 10e-9 nsolver=BACKE 

%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN
%.Monitor OptFields l5 Format=MagPhi Port=1 dir=IN  Pol=TE


.Monitor OptPower N11 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N12 dir=BOTH Pol=TE  P0db=1
.Monitor OptPower N13 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N14 dir=BOTH Pol=TE  P0db=1 

.Monitor OptPower N21 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N22 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N23 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N24 dir=BOTH Pol=TE  P0db=1 

.Monitor OptPower N31 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N32 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N33 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N34 dir=BOTH Pol=TE  P0db=1 

.Monitor OptPower N41 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N42 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N43 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N44 dir=BOTH Pol=TE  P0db=1 

.Monitor OptPower N51 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N52 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N53 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N54 dir=BOTH Pol=TE  P0db=1 

.Monitor OptPower N61 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N62 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N63 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N64 dir=BOTH Pol=TE  P0db=1 

.Monitor OptPower N71 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N72 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N73 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N74 dir=BOTH Pol=TE  P0db=1 

.Monitor OptPower N81 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N82 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N83 dir=BOTH Pol=TE  P0db=1 
.Monitor OptPower N84 dir=BOTH Pol=TE  P0db=1 

%.Monitor OptFields ring1 Format=MagPhi Port=1 dir=IN  Pol=TE %C22,23
%.Monitor OptFields ring1 Format=MagPhi Port=2 dir=IN  Pol=TE %C24,25
%.Monitor OptFields ring1 Format=MagPhi Port=3 dir=IN  Pol=TE %C26,27
%.Monitor OptFields ring1 Format=MagPhi Port=4 dir=IN  Pol=TE %C28,29

%.Monitor OptFields ring1 Format=MagPhi Port=1 dir=OUT  Pol=TE %C30,31
%.Monitor OptFields ring1 Format=MagPhi Port=2 dir=OUT  Pol=TE %C32,33
%.Monitor OptFields ring1 Format=MagPhi Port=3 dir=OUT  Pol=TE %C34,35
%.Monitor OptFields ring1 Format=MagPhi Port=4 dir=OUT  Pol=TE %C36,37

%.Monitor OptFields wx1 Format=MagPhi Port=1 dir=IN  Pol=TE %C38,39
%.Monitor OptFields wx1 Format=MagPhi Port=2 dir=IN  Pol=TE %C40,41
%.Monitor OptFields wx1 Format=MagPhi Port=3 dir=IN  Pol=TE %C42,43
%.Monitor OptFields wx1 Format=MagPhi Port=4 dir=IN  Pol=TE %C44,45

%.Monitor OptFields wx1 Format=MagPhi Port=1 dir=OUT  Pol=TE %C46,47
%.Monitor OptFields wx1 Format=MagPhi Port=2 dir=OUT  Pol=TE %C48,49
%.Monitor OptFields wx1 Format=MagPhi Port=3 dir=OUT  Pol=TE %C50,51
%.Monitor OptFields wx1 Format=MagPhi Port=4 dir=OUT  Pol=TE %C52,53

%.Monitor OptFields wg4 Format=MagPhi Port=2 dir=IN  Pol=TE %C56,57
%.Monitor OptFields wg4 Format=MagPhi Port=2 dir=Out  Pol=TE %C60,61

.end
