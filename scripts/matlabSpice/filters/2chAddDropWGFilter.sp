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

.param Noff = '1.6532'
.param Non = '1.6352'
.param NonWG = '3'

.param NMODES=1

* Voltage sources
v11 Mag1 0 DC = 1 
v12 Phi1 0 DC = 0


v21 Mag2 0 DC = 1 
v22 Phi2 0 DC = 0

v31 Mag3 0 DC = 1 
v32 Phi3 0 DC = 0

v41 Mag4 0 DC = 1 
v42 Phi4 0 DC = 0

v51 Mag5 0 DC = 1 
v52 Phi5 0 DC = 0

* lambda sweep Voltage
vcar vc 0 DC=1513

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 1, 2 channel add-drop filter
% 1 cw source 2 rings, 2 cross,

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring1 Nodes = [N11 N12 N13 N14] MoName = RingModel1
Osp OpticalRing   Name = ring2 Nodes = [N21 N22 N23 N24] MoName = RingModel1

Osp WaveGuide  Name=x1wg1 Nodes = [N13 x11] MoName=WGmodel 
Osp WaveGuide  Name=x1wg2 Nodes = [N14 x12] MoName=WGmodel 
Osp WaveGuide  Name=x1wg3 Nodes = [x13 N21] MoName=WGmodel 
Osp WaveGuide  Name=x1wg4 Nodes = [x14 x14n] MoName=WGmodel 


Osp WaveGuide  Name=x2wg1 Nodes = [N23 x21] MoName=WGmodel 
Osp WaveGuide  Name=x2wg2 Nodes = [N24 x22] MoName=WGmodel 
Osp WaveGuide  Name=x2wg3 Nodes = [x23 x23e] MoName=WGmodel 
Osp WaveGuide  Name=x2wg4 Nodes = [x24 x24n] MoName=WGmodel 


  
Osp XCOUPLER    Name=wx1 Nodes = [x11 x12 x13 x14] MoName=WXmodel  
Osp XCOUPLER    Name=wx2 Nodes = [x21 x22 x23 x24] MoName=WXmodel

Osp MIRROR        Name = mirR1P2 Nodes = [N12] MoName = Mmodel
Osp MIRROR        Name = mirR2P2 Nodes = [N22] MoName = Mmodel

Osp MIRROR        Name = mirWx1P4 Nodes = [x14n] MoName = Mmodel
Osp MIRROR        Name = mirWx2P3 Nodes = [x23e] MoName = Mmodel
Osp MIRROR        Name = mirWx2P4 Nodes = [x24n] MoName = Mmodel 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 2, 1 channel add-drop filter
% 1 cw source 1 rings, 2 cross,

Osp CWSOURCE      Name = Rcw2 Nodes = [Mag2 Phi2 N31] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring3 Nodes = [N31 N32 N33 N34] MoName = RingModel1


Osp WaveGuide  Name=x3wg1 Nodes = [N33 x31] MoName=WGmodel 
Osp WaveGuide  Name=x3wg2 Nodes = [N34 x32] MoName=WGmodel 
Osp WaveGuide  Name=x3wg3 Nodes = [x33 x33e] MoName=WGmodel 
Osp WaveGuide  Name=x3wg4 Nodes = [x34 x34n] MoName=WGmodel 


Osp WaveGuide  Name=x4wg1 Nodes = [x33e x41] MoName=WGmodel 
Osp WaveGuide  Name=x4wg2 Nodes = [x42s x42] MoName=WGmodel 
Osp WaveGuide  Name=x4wg3 Nodes = [x43 x43e] MoName=WGmodel 
Osp WaveGuide  Name=x4wg4 Nodes = [x44 x44n] MoName=WGmodel 

Osp XCOUPLER    Name=wx3 Nodes = [x31 x32 x33 x34] MoName=WXmodel  
Osp XCOUPLER    Name=wx4 Nodes = [x41 x42 x43 x44] MoName=WXmodel

Osp MIRROR        Name = mirR3P2 Nodes = [N32] MoName = Mmodel


Osp MIRROR        Name = mirWx3P4 Nodes = [x34n] MoName = Mmodel
Osp MIRROR        Name = mirWx4P2 Nodes = [x42s] MoName = Mmodel 
Osp MIRROR        Name = mirWx4P3 Nodes = [x43e] MoName = Mmodel
Osp MIRROR        Name = mirWx4P4 Nodes = [x44n] MoName = Mmodel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% circuit 3, 1 channel add-drop filter
% 1 cw source 3 rings (in seriers), 2 cross,

Osp CWSOURCE      Name = Rcw3 Nodes = [Mag3 Phi3 N41] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring4 Nodes = [N41 N42 N43 N44] MoName = RingModel1
Osp OpticalRing   Name = ring5 Nodes = [N42 N52 N53 N54] MoName = RingModel1
Osp OpticalRing   Name = ring6 Nodes = [N52 N62 N63 N64] MoName = RingModel1


Osp WaveGuide  Name=x5wg1 Nodes = [N43 x51] MoName=WGmodel 
Osp WaveGuide  Name=x5wg2 Nodes = [N64 x52] MoName=WGmodel 
Osp WaveGuide  Name=x5wg3 Nodes = [x53 x53e] MoName=WGmodel 
Osp WaveGuide  Name=x5wg4 Nodes = [x54 x54n] MoName=WGmodel 


Osp WaveGuide  Name=x6wg1 Nodes = [x53e x61] MoName=WGmodel 
Osp WaveGuide  Name=x6wg2 Nodes = [x62s x62] MoName=WGmodel 
Osp WaveGuide  Name=x6wg3 Nodes = [x63 x63e] MoName=WGmodel 
Osp WaveGuide  Name=x6wg4 Nodes = [x64 x64n] MoName=WGmodel 

Osp XCOUPLER    Name=wx5 Nodes = [x51 x52 x53 x54] MoName=WXmodel  
Osp XCOUPLER    Name=wx6 Nodes = [x61 x62 x63 x64] MoName=WXmodel

Osp MIRROR        Name = mirR4P4 Nodes = [N44] MoName = Mmodel
Osp MIRROR        Name = mirR5P3 Nodes = [N53] MoName = Mmodel
Osp MIRROR        Name = mirR5P4 Nodes = [N54] MoName = Mmodel
Osp MIRROR        Name = mirR6P2 Nodes = [N62] MoName = Mmodel
Osp MIRROR        Name = mirR6P3 Nodes = [N63] MoName = Mmodel


Osp MIRROR        Name = mirWx5P4 Nodes = [x54n] MoName = Mmodel
Osp MIRROR        Name = mirWx6P2 Nodes = [x62s] MoName = Mmodel 
Osp MIRROR        Name = mirWx6P3 Nodes = [x63e] MoName = Mmodel
Osp MIRROR        Name = mirWx6P4 Nodes = [x64n] MoName = Mmodel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% circuit 4, 1 channel add-drop filter
% 1 cw source 3 rings (in parallel), 2 cross,

Osp CWSOURCE      Name = Rcw4 Nodes = [Mag4 Phi4 N71] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring7 Nodes = [N71 N72 N73 N74] MoName = RingModel1
Osp OpticalRing   Name = ring8 Nodes = [N73 N74 N83 N84] MoName = RingModel1
Osp OpticalRing   Name = ring9 Nodes = [N83 N84 N93 N94] MoName = RingModel1


Osp MIRROR        Name = mirR7P2 Nodes = [N72] MoName = Mmodel
Osp MIRROR        Name = mirR9P3 Nodes = [N93] MoName = Mmodel
Osp MIRROR        Name = mirR9P4 Nodes = [N94] MoName = Mmodel

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

.SUBCKT X3srings in dr th ad

Osp OpticalRing   Name = ring3s1 Nodes = [in xs12 th xs14] MoName = RingModel1
Osp OpticalRing   Name = ring3s2 Nodes = [xs12 xs22 xs23 xs24] MoName = RingModel1
Osp OpticalRing   Name = ring3s3 Nodes = [xs22 dr xs33 ad] MoName = RingModel1


Osp MIRROR        Name = mirR4P4 Nodes = [xs14] MoName = Mmodel
Osp MIRROR        Name = mirR5P3 Nodes = [xs23] MoName = Mmodel
Osp MIRROR        Name = mirR5P4 Nodes = [xs24] MoName = Mmodel
Osp MIRROR        Name = mirR6P2 Nodes = [xs33] MoName = Mmodel

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
.ends X3srings


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% circuit 5, 1 3 rings in series using a sub circuit
% 1 cw source 3 rings (in series)

Osp CWSOURCE  Name = Rcw5 Nodes = [Mag5 Phi5 s11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

X1 s11 s12 s13 s14 X3srings

Osp MIRROR        Name = mirs12 Nodes = [s12] MoName = Mmodel
Osp MIRROR        Name = mirs13 Nodes = [s13] MoName = Mmodel
Osp MIRROR        Name = mirs14 Nodes = [s14] MoName = Mmodel


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

.param r1='10.35'
%.param r1='20'
.param r2='10.30'
.param r3='10.25'
.param r4='10.20'
.param r5='10.15'
.param r6='10.10'
.param r7='10.05'
.param r8='10.00'
.param C = '0.25'

.param lam=1514
.op 
.DC vcar 1510 1580 1
%.tran .1e-9 10e-9 nsolver=BACKE 

%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN


%.Monitor OptFields l5 Format=MagPhi Port=1 dir=IN  Pol=TE


% Outputs for circut 1, (ring1-2, wx1-2) // 22 outputs c2-23
% Ring 1
.Monitor OptPower ring1 Port=1 dir=IN Pol=TE  P0db=1 % C2
.Monitor OptPower ring1 Port=2 dir=IN Pol=TE  P0db=1 % C3
.Monitor OptPower ring1 Port=3 dir=IN Pol=TE  P0db=1 % C4
.Monitor OptPower ring1 Port=4 dir=IN Pol=TE  P0db=1 % C5

.Monitor OptPower ring1 Port=1 dir=OUT Pol=TE  P0db=1 % C6
.Monitor OptPower ring1 Port=2 dir=OUT Pol=TE  P0db=1 % C7
.Monitor OptPower ring1 Port=3 dir=OUT Pol=TE  P0db=1 % C8
.Monitor OptPower ring1 Port=4 dir=OUT Pol=TE  P0db=1 % C9

% wx1
.Monitor OptPower x1wg4 Port=2 dir=IN Pol=TE  P0db=1 % C10
.Monitor OptPower x1wg4 Port=2 dir=OUT Pol=TE  P0db=1 % C11

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
.Monitor OptPower x2wg3 Port=2 dir=IN Pol=TE  P0db=1 % C20
.Monitor OptPower x2wg4 Port=2 dir=IN Pol=TE  P0db=1 % C21

.Monitor OptPower x2wg3 Port=2 dir=OUT Pol=TE  P0db=1 % C22
.Monitor OptPower x2wg4 Port=2 dir=OUT Pol=TE  P0db=1 % C23

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Outputs for circut 2, (ring3, wx3-4) // 18 outputs c24-35
% Ring 3
.Monitor OptPower ring3 Port=1 dir=IN Pol=TE  P0db=1 % C24
.Monitor OptPower ring3 Port=2 dir=IN Pol=TE  P0db=1 % C25
.Monitor OptPower ring3 Port=3 dir=IN Pol=TE  P0db=1 % C26
.Monitor OptPower ring3 Port=4 dir=IN Pol=TE  P0db=1 % C27

.Monitor OptPower ring3 Port=1 dir=OUT Pol=TE  P0db=1 % C28
.Monitor OptPower ring3 Port=2 dir=OUT Pol=TE  P0db=1 % C29
.Monitor OptPower ring3 Port=3 dir=OUT Pol=TE  P0db=1 % C30
.Monitor OptPower ring3 Port=4 dir=OUT Pol=TE  P0db=1 % C31

% wx 3
.Monitor OptPower wx3 Port=3 dir=IN Pol=TE  P0db=1 % C32
.Monitor OptPower wx3 Port=4 dir=IN Pol=TE  P0db=1 % C33

.Monitor OptPower wx3 Port=3 dir=OUT Pol=TE  P0db=1 % C34
.Monitor OptPower wx3 Port=4 dir=OUT Pol=TE  P0db=1 % C35

% wx 4
.Monitor OptPower x4wg2 Port=1 dir=IN Pol=TE  P0db=1 % C36
.Monitor OptPower x4wg3 Port=2 dir=IN Pol=TE  P0db=1 % C37
.Monitor OptPower x4wg4 Port=2 dir=IN Pol=TE  P0db=1 % C38

.Monitor OptPower x4wg2 Port=1 dir=OUT Pol=TE  P0db=1 % C39
.Monitor OptPower x4wg3 Port=2 dir=OUT Pol=TE  P0db=1 % C40
.Monitor OptPower x4wg4 Port=2 dir=OUT Pol=TE  P0db=1 % C41



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Outputs for circut 3, (ring4,5,6, , wx5-6) // 34 outputs c42-75
% Ring 4
.Monitor OptPower ring4 Port=1 dir=IN Pol=TE  P0db=1 % C42
.Monitor OptPower ring4 Port=2 dir=IN Pol=TE  P0db=1 % C43
.Monitor OptPower ring4 Port=3 dir=IN Pol=TE  P0db=1 % C44
.Monitor OptPower ring4 Port=4 dir=IN Pol=TE  P0db=1 % C45

.Monitor OptPower ring4 Port=1 dir=OUT Pol=TE  P0db=1 % C46
.Monitor OptPower ring4 Port=2 dir=OUT Pol=TE  P0db=1 % C47
.Monitor OptPower ring4 Port=3 dir=OUT Pol=TE  P0db=1 % C48
.Monitor OptPower ring4 Port=4 dir=OUT Pol=TE  P0db=1 % C49

% Ring 5
.Monitor OptPower ring5 Port=1 dir=IN Pol=TE  P0db=1 % C50
.Monitor OptPower ring5 Port=2 dir=IN Pol=TE  P0db=1 % C51
.Monitor OptPower ring5 Port=3 dir=IN Pol=TE  P0db=1 % C52
.Monitor OptPower ring5 Port=4 dir=IN Pol=TE  P0db=1 % C53

.Monitor OptPower ring5 Port=1 dir=OUT Pol=TE  P0db=1 % C54
.Monitor OptPower ring5 Port=2 dir=OUT Pol=TE  P0db=1 % C55
.Monitor OptPower ring5 Port=3 dir=OUT Pol=TE  P0db=1 % C56
.Monitor OptPower ring5 Port=4 dir=OUT Pol=TE  P0db=1 % C57

% Ring 6
.Monitor OptPower ring6 Port=1 dir=IN Pol=TE  P0db=1 % C58
.Monitor OptPower ring6 Port=2 dir=IN Pol=TE  P0db=1 % C59
.Monitor OptPower ring6 Port=3 dir=IN Pol=TE  P0db=1 % C60
.Monitor OptPower ring6 Port=4 dir=IN Pol=TE  P0db=1 % C61

.Monitor OptPower ring6 Port=1 dir=OUT Pol=TE  P0db=1 % C62
.Monitor OptPower ring6 Port=2 dir=OUT Pol=TE  P0db=1 % C63
.Monitor OptPower ring6 Port=3 dir=OUT Pol=TE  P0db=1 % C64
.Monitor OptPower ring6 Port=4 dir=OUT Pol=TE  P0db=1 % C65

% wx 5
.Monitor OptPower wx5 Port=3 dir=IN Pol=TE  P0db=1 % C66
.Monitor OptPower wx5 Port=4 dir=IN Pol=TE  P0db=1 % C67

.Monitor OptPower wx5 Port=3 dir=OUT Pol=TE  P0db=1 % C68
.Monitor OptPower wx5 Port=4 dir=OUT Pol=TE  P0db=1 % C69

% wx 6
.Monitor OptPower x6wg2 Port=1 dir=IN Pol=TE  P0db=1 % C70
.Monitor OptPower x6wg3 Port=2 dir=IN Pol=TE  P0db=1 % C71
.Monitor OptPower x6wg4 Port=2 dir=IN Pol=TE  P0db=1 % C72

.Monitor OptPower x6wg2 Port=1 dir=OUT Pol=TE  P0db=1 % C73
.Monitor OptPower x6wg3 Port=2 dir=OUT Pol=TE  P0db=1 % C74
.Monitor OptPower x6wg4 Port=2 dir=OUT Pol=TE  P0db=1 % C75

%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Outputs for circut 4, (ring7,8,9 ) // 24 outputs c76-99
% Ring 7
.Monitor OptPower ring7 Port=1 dir=IN Pol=TE  P0db=1 % C76
.Monitor OptPower ring7 Port=2 dir=IN Pol=TE  P0db=1 % C77
.Monitor OptPower ring7 Port=3 dir=IN Pol=TE  P0db=1 % C78
.Monitor OptPower ring7 Port=4 dir=IN Pol=TE  P0db=1 % C79

.Monitor OptPower ring7 Port=1 dir=OUT Pol=TE  P0db=1 % C80
.Monitor OptPower ring7 Port=2 dir=OUT Pol=TE  P0db=1 % C81
.Monitor OptPower ring7 Port=3 dir=OUT Pol=TE  P0db=1 % C82
.Monitor OptPower ring7 Port=4 dir=OUT Pol=TE  P0db=1 % C83

% Ring 8
.Monitor OptPower ring8 Port=1 dir=IN Pol=TE  P0db=1 % C84
.Monitor OptPower ring8 Port=2 dir=IN Pol=TE  P0db=1 % C85
.Monitor OptPower ring8 Port=3 dir=IN Pol=TE  P0db=1 % C86
.Monitor OptPower ring8 Port=4 dir=IN Pol=TE  P0db=1 % C87

.Monitor OptPower ring8 Port=1 dir=OUT Pol=TE  P0db=1 % C88
.Monitor OptPower ring8 Port=2 dir=OUT Pol=TE  P0db=1 % C89
.Monitor OptPower ring8 Port=3 dir=OUT Pol=TE  P0db=1 % C90
.Monitor OptPower ring8 Port=4 dir=OUT Pol=TE  P0db=1 % C91

% Ring 9
.Monitor OptPower ring9 Port=1 dir=IN Pol=TE  P0db=1 % C92
.Monitor OptPower ring9 Port=2 dir=IN Pol=TE  P0db=1 % C93
.Monitor OptPower ring9 Port=3 dir=IN Pol=TE  P0db=1 % C94
.Monitor OptPower ring9 Port=4 dir=IN Pol=TE  P0db=1 % C95

.Monitor OptPower ring9 Port=1 dir=OUT Pol=TE  P0db=1 % C96
.Monitor OptPower ring9 Port=2 dir=OUT Pol=TE  P0db=1 % C97
.Monitor OptPower ring9 Port=3 dir=OUT Pol=TE  P0db=1 % C98
.Monitor OptPower ring9 Port=4 dir=OUT Pol=TE  P0db=1 % C99


%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Outputs for circut 5, (subcircuit for 3 rings in seriers ) // 8 outputs c99-c107

.Monitor OptPower X1 Port=1 dir=IN Pol=TE  P0db=1 % C100
.Monitor OptPower X1 Port=2 dir=IN Pol=TE  P0db=1 % C101
.Monitor OptPower X1 Port=3 dir=IN Pol=TE  P0db=1 % C102
.Monitor OptPower X1 Port=4 dir=IN Pol=TE  P0db=1 % C103

.Monitor OptPower X1 Port=1 dir=OUT Pol=TE  P0db=1 % C104
.Monitor OptPower X1 Port=2 dir=OUT Pol=TE  P0db=1 % C105
.Monitor OptPower X1 Port=3 dir=OUT Pol=TE  P0db=1 % C106
.Monitor OptPower X1 Port=4 dir=OUT Pol=TE  P0db=1 % C107


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
