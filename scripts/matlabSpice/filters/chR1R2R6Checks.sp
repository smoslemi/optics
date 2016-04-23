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
.param Non = '1.6532'
%.param Non = '1.1'

.param NonWG = '1.4'

.param NMODES=1

* Voltage sources
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0

* lambda sweep Voltage
vcar vc 0 DC=1513

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 1, 8 channel add-drop filter
% 1 cw source 8 rings, 8 cross,

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring1 Nodes = [N11 N12 N13 N14] MoName = RingModel1
Osp OpticalRing   Name = ring2 Nodes = [N21 N22 N23 N24] MoName = RingModel2
%Osp OpticalRing   Name = ring3 Nodes = [N31 N32 N33 N34] MoName = RingModel3
%Osp OpticalRing   Name = ring4 Nodes = [N41 N42 N43 N44] MoName = RingModel4
%Osp OpticalRing   Name = ring5 Nodes = [N51 N52 N53 N54] MoName = RingModel5
Osp OpticalRing   Name = ring6 Nodes = [N61 N62 N63 N64] MoName = RingModel6
%Osp OpticalRing   Name = ring7 Nodes = [N71 N72 N73 N74] MoName = RingModel7
%Osp OpticalRing   Name = ring8 Nodes = [N81 N82 N83 N84] MoName = RingModel8

%%Osp WaveGuide  Name=wg1 Nodes = [N13 x11] MoName=WGmodel  
%%Osp WaveGuide  Name=wg2 Nodes = [N14 x12] MoName=WGmodel
  
Osp XCOUPLER    Name=wx1 Nodes = [N13 N14 N21 x14] MoName=WXmodel  
Osp XCOUPLER    Name=wx2 Nodes = [N23 N24 x23 x24] MoName=WXmodel 
Osp XCOUPLER    Name=wx3 Nodes = [x23 x32 x33 x34] MoName=WXmodel 
Osp XCOUPLER    Name=wx4 Nodes = [x33 x42 x43 x44] MoName=WXmodel 
Osp XCOUPLER    Name=wx5 Nodes = [x43 x52 N61 x54] MoName=WXmodel 
Osp XCOUPLER    Name=wx6 Nodes = [N63 N64 x63 x64] MoName=WXmodel 
Osp XCOUPLER    Name=wx7 Nodes = [x63 x72 x73 x74] MoName=WXmodel 
Osp XCOUPLER    Name=wx8 Nodes = [x73 x82 x83 x84] MoName=WXmodel

Osp MIRROR        Name = mirR1P2 Nodes = [N12] MoName = Mmodel
Osp MIRROR        Name = mirR2P2 Nodes = [N22] MoName = Mmodel
Osp MIRROR        Name = mirx3P2 Nodes = [x32] MoName = Mmodel
Osp MIRROR        Name = mirx4P2 Nodes = [x42] MoName = Mmodel
Osp MIRROR        Name = mirx5P2 Nodes = [x52] MoName = Mmodel
Osp MIRROR        Name = mirR6P2 Nodes = [N62] MoName = Mmodel
Osp MIRROR        Name = mirx7P2 Nodes = [x72] MoName = Mmodel
Osp MIRROR        Name = mirx8P2 Nodes = [x82] MoName = Mmodel
Osp MIRROR        Name = mirWx1P4 Nodes = [x14] MoName = Mmodel
Osp MIRROR        Name = mirWx2P4 Nodes = [x24] MoName = Mmodel
Osp MIRROR        Name = mirWx3P4 Nodes = [x34] MoName = Mmodel
Osp MIRROR        Name = mirWx4P4 Nodes = [x44] MoName = Mmodel
Osp MIRROR        Name = mirWx5P4 Nodes = [x54] MoName = Mmodel
Osp MIRROR        Name = mirWx6P4 Nodes = [x64] MoName = Mmodel
Osp MIRROR        Name = mirWx7P4 Nodes = [x74] MoName = Mmodel 
Osp MIRROR        Name = mirWx8P3 Nodes = [x83] MoName = Mmodel
Osp MIRROR        Name = mirWx8P4 Nodes = [x84] MoName = Mmodel 


% Extra for specail circuits
%Osp MIRROR        Name = mirR2P1 Nodes = [N21] MoName = Mmodel


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
.DC vcar 1500 1580 0.1
%.tran .1e-9 10e-9 nsolver=BACKE 

%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN


%.Monitor OptFields l5 Format=MagPhi Port=1 dir=IN  Pol=TE


% Outputs for circut 3.5, (ring1, x1, x1-4) // 20 outputs c2-
% D1 
.Monitor OptPower ring1 Port=1 dir=IN Pol=TE  P0db=1 % C2
.Monitor OptPower ring1 Port=2 dir=IN Pol=TE  P0db=1 % C3
.Monitor OptPower ring1 Port=3 dir=IN Pol=TE  P0db=1 % C4
.Monitor OptPower ring1 Port=4 dir=IN Pol=TE  P0db=1 % C5

.Monitor OptPower ring1 Port=1 dir=OUT Pol=TE  P0db=1 % C6
.Monitor OptPower ring1 Port=2 dir=OUT Pol=TE  P0db=1 % C7
.Monitor OptPower ring1 Port=3 dir=OUT Pol=TE  P0db=1 % C8
.Monitor OptPower ring1 Port=4 dir=OUT Pol=TE  P0db=1 % C9

% D2
.Monitor OptPower ring2 Port=1 dir=IN Pol=TE  P0db=1 % C10
.Monitor OptPower ring2 Port=2 dir=IN Pol=TE  P0db=1 % C11
.Monitor OptPower ring2 Port=3 dir=IN Pol=TE  P0db=1 % C12
.Monitor OptPower ring2 Port=4 dir=IN Pol=TE  P0db=1 % C13

.Monitor OptPower ring2 Port=1 dir=OUT Pol=TE  P0db=1 % C14
.Monitor OptPower ring2 Port=2 dir=OUT Pol=TE  P0db=1 % C15
.Monitor OptPower ring2 Port=3 dir=OUT Pol=TE  P0db=1 % C16
.Monitor OptPower ring2 Port=4 dir=OUT Pol=TE  P0db=1 % C17

% Ring 3
.Monitor OptPower wx3 Port=1 dir=IN Pol=TE  P0db=1 % C22
.Monitor OptPower wx3 Port=2 dir=IN Pol=TE  P0db=1 % C23
.Monitor OptPower wx3 Port=3 dir=IN Pol=TE  P0db=1 % C24
.Monitor OptPower wx3 Port=4 dir=IN Pol=TE  P0db=1 % C25

.Monitor OptPower wx3 Port=1 dir=OUT Pol=TE  P0db=1 % C26
.Monitor OptPower wx3 Port=2 dir=OUT Pol=TE  P0db=1 % C27
.Monitor OptPower wx3 Port=3 dir=OUT Pol=TE  P0db=1 % C28
.Monitor OptPower wx3 Port=4 dir=OUT Pol=TE  P0db=1 % C29

% Ring 4
.Monitor OptPower wx4 Port=1 dir=IN Pol=TE  P0db=1 % C32
.Monitor OptPower wx4 Port=2 dir=IN Pol=TE  P0db=1 % C33
.Monitor OptPower wx4 Port=3 dir=IN Pol=TE  P0db=1 % C34
.Monitor OptPower wx4 Port=4 dir=IN Pol=TE  P0db=1 % C35

.Monitor OptPower wx4 Port=1 dir=OUT Pol=TE  P0db=1 % C36
.Monitor OptPower wx4 Port=2 dir=OUT Pol=TE  P0db=1 % C37
.Monitor OptPower wx4 Port=3 dir=OUT Pol=TE  P0db=1 % C38
.Monitor OptPower wx4 Port=4 dir=OUT Pol=TE  P0db=1 % C39

% D5
.Monitor OptPower wx5 Port=1 dir=IN Pol=TE  P0db=1 % C42
.Monitor OptPower wx5 Port=2 dir=IN Pol=TE  P0db=1 % C43
.Monitor OptPower wx5 Port=3 dir=IN Pol=TE  P0db=1 % C44
.Monitor OptPower wx5 Port=4 dir=IN Pol=TE  P0db=1 % C45

.Monitor OptPower wx5 Port=1 dir=OUT Pol=TE  P0db=1 % C46
.Monitor OptPower wx5 Port=2 dir=OUT Pol=TE  P0db=1 % C47
.Monitor OptPower wx5 Port=3 dir=OUT Pol=TE  P0db=1 % C48
.Monitor OptPower wx5 Port=4 dir=OUT Pol=TE  P0db=1 % C49

% D6 Ring 6
.Monitor OptPower ring6 Port=1 dir=IN Pol=TE  P0db=1 % C52
.Monitor OptPower ring6 Port=2 dir=IN Pol=TE  P0db=1 % C53
.Monitor OptPower ring6 Port=3 dir=IN Pol=TE  P0db=1 % C54
.Monitor OptPower ring6 Port=4 dir=IN Pol=TE  P0db=1 % C55

.Monitor OptPower ring6 Port=1 dir=OUT Pol=TE  P0db=1 % C56
.Monitor OptPower ring6 Port=2 dir=OUT Pol=TE  P0db=1 % C57
.Monitor OptPower ring6 Port=3 dir=OUT Pol=TE  P0db=1 % C58
.Monitor OptPower ring6 Port=4 dir=OUT Pol=TE  P0db=1 % C59

% Ring 7
.Monitor OptPower wx7 Port=1 dir=IN Pol=TE  P0db=1 % C62
.Monitor OptPower wx7 Port=2 dir=IN Pol=TE  P0db=1 % C63
.Monitor OptPower wx7 Port=3 dir=IN Pol=TE  P0db=1 % C64
.Monitor OptPower wx7 Port=4 dir=IN Pol=TE  P0db=1 % C65

.Monitor OptPower wx7 Port=1 dir=OUT Pol=TE  P0db=1 % C66
.Monitor OptPower wx7 Port=2 dir=OUT Pol=TE  P0db=1 % C67
.Monitor OptPower wx7 Port=3 dir=OUT Pol=TE  P0db=1 % C68
.Monitor OptPower wx7 Port=4 dir=OUT Pol=TE  P0db=1 % C69

% Ring 8
.Monitor OptPower wx8 Port=1 dir=IN Pol=TE  P0db=1 % C72
.Monitor OptPower wx8 Port=2 dir=IN Pol=TE  P0db=1 % C73
.Monitor OptPower wx8 Port=3 dir=IN Pol=TE  P0db=1 % C74
.Monitor OptPower wx8 Port=4 dir=IN Pol=TE  P0db=1 % C75

.Monitor OptPower wx8 Port=1 dir=OUT Pol=TE  P0db=1 % C76
.Monitor OptPower wx8 Port=2 dir=OUT Pol=TE  P0db=1 % C77
.Monitor OptPower wx8 Port=3 dir=OUT Pol=TE  P0db=1 % C78
.Monitor OptPower wx8 Port=4 dir=OUT Pol=TE  P0db=1 % C79

.end
