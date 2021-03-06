Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG  AllMon=0 AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27


.param Noff = '1.6532'
.param Non = '1.6532'
%.param Non = '1.1'
.param NonWG = '1.4'

.param NMODES=1

* Voltage sources
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0

* lambda sweep Voltage
vcar vc 0 DC=1513


%%%%%%%%%%%%%%%%%%%%%%%% SUBCKT %%%%%%%%%%%%%%%%%%%%%%%%

.SUBCKT X6rings inS drS thS adS

Osp OpticalRing   Name = Xsring1 Nodes = [inS s12 s13 s14] MoName = RingModel1
Osp OpticalRing   Name = Xsring2 Nodes = [s12 s22 s23 s24] MoName = RingModel1
Osp OpticalRing   Name = Xsring3 Nodes = [s22 drS s33 adS] MoName = RingModel1


Osp MIRROR        Name = mirXsring1P4 Nodes = [s14] MoName = Mmodel
Osp MIRROR        Name = mirXsring2P3 Nodes = [s23] MoName = Mmodel
Osp MIRROR        Name = mirXsring2P4 Nodes = [s24] MoName = Mmodel
Osp MIRROR        Name = mirXsring3P2 Nodes = [s33] MoName = Mmodel


Osp OpticalRing   Name = Xpring1 Nodes = [s13 p12 p13 p14] MoName = RingModel1
Osp OpticalRing   Name = Xpring2 Nodes = [p13 p22 p23 p24] MoName = RingModel1
Osp OpticalRing   Name = Xpring3 Nodes = [p23 p32 thS p34] MoName = RingModel1

Osp MIRROR        Name = mirXpring1P2 Nodes = [p12] MoName = Mmodel
Osp MIRROR        Name = mirXpring1P4 Nodes = [p14] MoName = Mmodel
Osp MIRROR        Name = mirXpring2P2 Nodes = [p22] MoName = Mmodel
Osp MIRROR        Name = mirXpring2P4 Nodes = [p24] MoName = Mmodel
Osp MIRROR        Name = mirXpring3P2 Nodes = [p32] MoName = Mmodel
Osp MIRROR        Name = mirXpring3P4 Nodes = [p34] MoName = Mmodel


% Mirror Model
Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
%Ring general Model statment
Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r1
% Coupling Model
Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

% Filter model
Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non] 

.param r1='10.35'
.param gain='1'
.param C = '0.65'
.ends X6rings

%%%%%%%%%%%%%%%%%%%%%%%% SUBCKT %%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 1, 8 channel add-drop filter
% 1 cw source 8 rings, 8 cross,

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

X1 N11 N12 N13 N14 X6rings

%Osp OpticalRing   Name = ring1 Nodes = [N11 N91 N13 N1P4] MoName = RingModel1
%Osp OpticalRing   Name = ring9 Nodes = [N91 N101 N93 N94] MoName = RingModel1
%Osp OpticalRing   Name = ring10 Nodes = [N101 N12 N103 N14] MoName = RingModel1


Osp OpticalRing   Name = ring2 Nodes = [N21 N22 N23 N24] MoName = RingModel2
Osp OpticalRing   Name = ring3 Nodes = [N31 N32 N33 N34] MoName = RingModel3
Osp OpticalRing   Name = ring4 Nodes = [N41 N42 N43 N44] MoName = RingModel4
Osp OpticalRing   Name = ring5 Nodes = [N51 N52 N53 N54] MoName = RingModel5
Osp OpticalRing   Name = ring6 Nodes = [N61 N62 N63 N64] MoName = RingModel6
Osp OpticalRing   Name = ring7 Nodes = [N71 N72 N73 N74] MoName = RingModel7
Osp OpticalRing   Name = ring8 Nodes = [N81 N82 N83 N84] MoName = RingModel8

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
Osp Model Name = WXmodel  type = XCOUPLER ElemType=WGUIDECROSS  NumModes = NMODES Through=0.98 Right=0.01 Left=0.01 Ref=0.0 



% WGuide model
Osp Model Name = WGmodel  type = WaveGuide  Length=0.125   neff=[Non]  N0=Non NF=Non
%Osp Model Name = WGmodel  type = WaveGuide  Length=0.125   neff=[NonWG]  N0=NonWG NF=NonWG

** gain is for pwr so sqrt is taken 
.param gain='1'
%.param gain='0.85'

.param r1='10.35'
.param r2='10.30'
.param r3='10.25'
.param r4='10.20'
.param r5='10.15'
.param r6='10.10'
.param r7='10.05'
.param r8='10.00'
%.param C = '0.25'



%.param r1='10.35'
%.param r2='10.25'
%.param r3='10.15'
%.param r4='10.05'
%.param r5='9.95'
%.param r6='9.85'
%.param r7='9.75'
%.param r8='9.65'
.param C = '0.15'

.param lam=1514
.op 
.DC vcar 1500 1580 1
%.tran .1e-9 10e-9 nsolver=BACKE 

%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN


%.Monitor OptFields l5 Format=MagPhi Port=1 dir=IN  Pol=TE


% Outputs for circut 3.5, (ring1, x1, x1-4) // 20 outputs c2-
% Ring 1
.Monitor OptPower N11 dir=BOTH Pol=TE  P0db=1 % C2,6
.Monitor OptPower N12 dir=BOTH Pol=TE  P0db=1 % C3,7
.Monitor OptPower N13 dir=BOTH Pol=TE  P0db=1 % C4,8
.Monitor OptPower N14 dir=BOTH Pol=TE  P0db=1 % C5,9

% wx1
.Monitor OptPower wx1 Port=4 dir=IN Pol=TE  P0db=1 % C10

.Monitor OptPower wx1 Port=4 dir=OUT Pol=TE  P0db=1 % C11

% Ring 2
.Monitor OptPower ring2 Port=1 dir=IN Pol=TE  P0db=1 % C12
.Monitor OptPower ring2 Port=2 dir=IN Pol=TE  P0db=1 % C13
.Monitor OptPower ring2 Port=3 dir=IN Pol=TE  P0db=1 % C14
.Monitor OptPower ring2 Port=4 dir=IN Pol=TE  P0db=1 % C15

.Monitor OptPower ring2 Port=1 dir=OUT Pol=TE  P0db=1 % C16
.Monitor OptPower ring2 Port=2 dir=OUT Pol=TE  P0db=1 % C17
.Monitor OptPower ring2 Port=3 dir=OUT Pol=TE  P0db=1 % C18
.Monitor OptPower ring2 Port=4 dir=OUT Pol=TE  P0db=1 % C19

% wx2
.Monitor OptPower wx2 Port=4 dir=IN Pol=TE  P0db=1 % C20

.Monitor OptPower wx2 Port=4 dir=OUT Pol=TE  P0db=1 % C21

% Ring 3
.Monitor OptPower ring3 Port=1 dir=IN Pol=TE  P0db=1 % C22
.Monitor OptPower ring3 Port=2 dir=IN Pol=TE  P0db=1 % C23
.Monitor OptPower ring3 Port=3 dir=IN Pol=TE  P0db=1 % C24
.Monitor OptPower ring3 Port=4 dir=IN Pol=TE  P0db=1 % C25

.Monitor OptPower ring3 Port=1 dir=OUT Pol=TE  P0db=1 % C26
.Monitor OptPower ring3 Port=2 dir=OUT Pol=TE  P0db=1 % C27
.Monitor OptPower ring3 Port=3 dir=OUT Pol=TE  P0db=1 % C28
.Monitor OptPower ring3 Port=4 dir=OUT Pol=TE  P0db=1 % C29

% wx3
.Monitor OptPower wx3 Port=4 dir=IN Pol=TE  P0db=1 % C30

.Monitor OptPower wx3 Port=4 dir=OUT Pol=TE  P0db=1 % C31

% Ring 4
.Monitor OptPower ring4 Port=1 dir=IN Pol=TE  P0db=1 % C32
.Monitor OptPower ring4 Port=2 dir=IN Pol=TE  P0db=1 % C33
.Monitor OptPower ring4 Port=3 dir=IN Pol=TE  P0db=1 % C34
.Monitor OptPower ring4 Port=4 dir=IN Pol=TE  P0db=1 % C35

.Monitor OptPower ring4 Port=1 dir=OUT Pol=TE  P0db=1 % C36
.Monitor OptPower ring4 Port=2 dir=OUT Pol=TE  P0db=1 % C37
.Monitor OptPower ring4 Port=3 dir=OUT Pol=TE  P0db=1 % C38
.Monitor OptPower ring4 Port=4 dir=OUT Pol=TE  P0db=1 % C39

% wx4
.Monitor OptPower wx4 Port=4 dir=IN Pol=TE  P0db=1 % C40

.Monitor OptPower wx4 Port=4 dir=OUT Pol=TE  P0db=1 % C41

% Ring 5
.Monitor OptPower ring5 Port=1 dir=IN Pol=TE  P0db=1 % C42
.Monitor OptPower ring5 Port=2 dir=IN Pol=TE  P0db=1 % C43
.Monitor OptPower ring5 Port=3 dir=IN Pol=TE  P0db=1 % C44
.Monitor OptPower ring5 Port=4 dir=IN Pol=TE  P0db=1 % C45

.Monitor OptPower ring5 Port=1 dir=OUT Pol=TE  P0db=1 % C46
.Monitor OptPower ring5 Port=2 dir=OUT Pol=TE  P0db=1 % C47
.Monitor OptPower ring5 Port=3 dir=OUT Pol=TE  P0db=1 % C48
.Monitor OptPower ring5 Port=4 dir=OUT Pol=TE  P0db=1 % C49

% wx5
.Monitor OptPower wx5 Port=4 dir=IN Pol=TE  P0db=1 % C50

.Monitor OptPower wx5 Port=4 dir=OUT Pol=TE  P0db=1 % C51

% Ring 6
.Monitor OptPower ring6 Port=1 dir=IN Pol=TE  P0db=1 % C52
.Monitor OptPower ring6 Port=2 dir=IN Pol=TE  P0db=1 % C53
.Monitor OptPower ring6 Port=3 dir=IN Pol=TE  P0db=1 % C54
.Monitor OptPower ring6 Port=4 dir=IN Pol=TE  P0db=1 % C55

.Monitor OptPower ring6 Port=1 dir=OUT Pol=TE  P0db=1 % C56
.Monitor OptPower ring6 Port=2 dir=OUT Pol=TE  P0db=1 % C57
.Monitor OptPower ring6 Port=3 dir=OUT Pol=TE  P0db=1 % C58
.Monitor OptPower ring6 Port=4 dir=OUT Pol=TE  P0db=1 % C59

% wx6
.Monitor OptPower wx6 Port=4 dir=IN Pol=TE  P0db=1 % C60

.Monitor OptPower wx6 Port=4 dir=OUT Pol=TE  P0db=1 % C61

% Ring 7
.Monitor OptPower ring7 Port=1 dir=IN Pol=TE  P0db=1 % C62
.Monitor OptPower ring7 Port=2 dir=IN Pol=TE  P0db=1 % C63
.Monitor OptPower ring7 Port=3 dir=IN Pol=TE  P0db=1 % C64
.Monitor OptPower ring7 Port=4 dir=IN Pol=TE  P0db=1 % C65

.Monitor OptPower ring7 Port=1 dir=OUT Pol=TE  P0db=1 % C66
.Monitor OptPower ring7 Port=2 dir=OUT Pol=TE  P0db=1 % C67
.Monitor OptPower ring7 Port=3 dir=OUT Pol=TE  P0db=1 % C68
.Monitor OptPower ring7 Port=4 dir=OUT Pol=TE  P0db=1 % C69

% wx7
.Monitor OptPower wx7 Port=4 dir=IN Pol=TE  P0db=1 % C70

.Monitor OptPower wx7 Port=4 dir=OUT Pol=TE  P0db=1 % C71

% Ring 8
.Monitor OptPower ring8 Port=1 dir=IN Pol=TE  P0db=1 % C72
.Monitor OptPower ring8 Port=2 dir=IN Pol=TE  P0db=1 % C73
.Monitor OptPower ring8 Port=3 dir=IN Pol=TE  P0db=1 % C74
.Monitor OptPower ring8 Port=4 dir=IN Pol=TE  P0db=1 % C75

.Monitor OptPower ring8 Port=1 dir=OUT Pol=TE  P0db=1 % C76
.Monitor OptPower ring8 Port=2 dir=OUT Pol=TE  P0db=1 % C77
.Monitor OptPower ring8 Port=3 dir=OUT Pol=TE  P0db=1 % C78
.Monitor OptPower ring8 Port=4 dir=OUT Pol=TE  P0db=1 % C79

% wx8
.Monitor OptPower wx8 Port=3 dir=IN Pol=TE  P0db=1 % C80
.Monitor OptPower wx8 Port=4 dir=IN Pol=TE  P0db=1 % C81

.Monitor OptPower wx8 Port=3 dir=OUT Pol=TE  P0db=1 % C82
.Monitor OptPower wx8 Port=4 dir=OUT Pol=TE  P0db=1 % C83



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
