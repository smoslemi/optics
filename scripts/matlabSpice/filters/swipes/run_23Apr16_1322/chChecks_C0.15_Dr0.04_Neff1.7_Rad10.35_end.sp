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

% circuit 1, 8 channel add-drop filter
% 1 cw source 8 rings, 8 cross,

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring1 Nodes = [N11 N12 N13 N14] MoName = RingModel1
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
.param C = '1.500000e-01'
.param Non = '1.700000e+00'
.param dr = '4.000000e-02'
.param r1='1.700000e+00'
.param r2='r1-dr'
.param r3='r2-dr'
.param r4='r3-dr'
.param r5='r4-dr'
.param r6='r5-dr'
.param r7='r6-dr'
.param r8='r7-dr'



%.param r3='r1-(2*dr)'
%.param r4='r1-(3*dr)'
%.param r5='r1-(4*dr)'
%.param r6='r5-(5*dr)'
%.param r7='r6-(6*dr)'
%.param r8='r7-(7*dr)'


.param lam=1514
.op 
.DC vcar 1500 1580 2
%.tran .1e-9 10e-9 nsolver=BACKE 

%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN
%.Monitor OptFields l5 Format=MagPhi Port=1 dir=IN  Pol=TE

% D1 Ring1
.Monitor OptPower ring1 Port=1 dir=IN Pol=TE  P0db=1 % C2
.Monitor OptPower ring1 Port=2 dir=IN Pol=TE  P0db=1 % C3
.Monitor OptPower ring1 Port=3 dir=IN Pol=TE  P0db=1 % C4
.Monitor OptPower ring1 Port=4 dir=IN Pol=TE  P0db=1 % C5

.Monitor OptPower ring1 Port=1 dir=OUT Pol=TE  P0db=1 % C6
.Monitor OptPower ring1 Port=2 dir=OUT Pol=TE  P0db=1 % C7
.Monitor OptPower ring1 Port=3 dir=OUT Pol=TE  P0db=1 % C8
.Monitor OptPower ring1 Port=4 dir=OUT Pol=TE  P0db=1 % C9

% Ring 2
.Monitor OptPower ring2 Port=1 dir=IN Pol=TE  P0db=1 % C10
.Monitor OptPower ring2 Port=2 dir=IN Pol=TE  P0db=1 % C11
.Monitor OptPower ring2 Port=3 dir=IN Pol=TE  P0db=1 % C12
.Monitor OptPower ring2 Port=4 dir=IN Pol=TE  P0db=1 % C13

.Monitor OptPower ring2 Port=1 dir=OUT Pol=TE  P0db=1 % C14
.Monitor OptPower ring2 Port=2 dir=OUT Pol=TE  P0db=1 % C15
.Monitor OptPower ring2 Port=3 dir=OUT Pol=TE  P0db=1 % C16
.Monitor OptPower ring2 Port=4 dir=OUT Pol=TE  P0db=1 % C17

% Ring 3
.Monitor OptPower ring3 Port=1 dir=IN Pol=TE  P0db=1 % C22
.Monitor OptPower ring3 Port=2 dir=IN Pol=TE  P0db=1 % C23
.Monitor OptPower ring3 Port=3 dir=IN Pol=TE  P0db=1 % C24
.Monitor OptPower ring3 Port=4 dir=IN Pol=TE  P0db=1 % C25

.Monitor OptPower ring3 Port=1 dir=OUT Pol=TE  P0db=1 % C26
.Monitor OptPower ring3 Port=2 dir=OUT Pol=TE  P0db=1 % C27
.Monitor OptPower ring3 Port=3 dir=OUT Pol=TE  P0db=1 % C28
.Monitor OptPower ring3 Port=4 dir=OUT Pol=TE  P0db=1 % C29

% Ring 4
.Monitor OptPower ring4 Port=1 dir=IN Pol=TE  P0db=1 % C32
.Monitor OptPower ring4 Port=2 dir=IN Pol=TE  P0db=1 % C33
.Monitor OptPower ring4 Port=3 dir=IN Pol=TE  P0db=1 % C34
.Monitor OptPower ring4 Port=4 dir=IN Pol=TE  P0db=1 % C35

.Monitor OptPower ring4 Port=1 dir=OUT Pol=TE  P0db=1 % C36
.Monitor OptPower ring4 Port=2 dir=OUT Pol=TE  P0db=1 % C37
.Monitor OptPower ring4 Port=3 dir=OUT Pol=TE  P0db=1 % C38
.Monitor OptPower ring4 Port=4 dir=OUT Pol=TE  P0db=1 % C39

% Ring 5
.Monitor OptPower ring5 Port=1 dir=IN Pol=TE  P0db=1 % C42
.Monitor OptPower ring5 Port=2 dir=IN Pol=TE  P0db=1 % C43
.Monitor OptPower ring5 Port=3 dir=IN Pol=TE  P0db=1 % C44
.Monitor OptPower ring5 Port=4 dir=IN Pol=TE  P0db=1 % C45

.Monitor OptPower ring5 Port=1 dir=OUT Pol=TE  P0db=1 % C46
.Monitor OptPower ring5 Port=2 dir=OUT Pol=TE  P0db=1 % C47
.Monitor OptPower ring5 Port=3 dir=OUT Pol=TE  P0db=1 % C48
.Monitor OptPower ring5 Port=4 dir=OUT Pol=TE  P0db=1 % C49

% Ring 6
.Monitor OptPower ring6 Port=1 dir=IN Pol=TE  P0db=1 % C52
.Monitor OptPower ring6 Port=2 dir=IN Pol=TE  P0db=1 % C53
.Monitor OptPower ring6 Port=3 dir=IN Pol=TE  P0db=1 % C54
.Monitor OptPower ring6 Port=4 dir=IN Pol=TE  P0db=1 % C55

.Monitor OptPower ring6 Port=1 dir=OUT Pol=TE  P0db=1 % C56
.Monitor OptPower ring6 Port=2 dir=OUT Pol=TE  P0db=1 % C57
.Monitor OptPower ring6 Port=3 dir=OUT Pol=TE  P0db=1 % C58
.Monitor OptPower ring6 Port=4 dir=OUT Pol=TE  P0db=1 % C59

% Ring 7
.Monitor OptPower ring7 Port=1 dir=IN Pol=TE  P0db=1 % C62
.Monitor OptPower ring7 Port=2 dir=IN Pol=TE  P0db=1 % C63
.Monitor OptPower ring7 Port=3 dir=IN Pol=TE  P0db=1 % C64
.Monitor OptPower ring7 Port=4 dir=IN Pol=TE  P0db=1 % C65

.Monitor OptPower ring7 Port=1 dir=OUT Pol=TE  P0db=1 % C66
.Monitor OptPower ring7 Port=2 dir=OUT Pol=TE  P0db=1 % C67
.Monitor OptPower ring7 Port=3 dir=OUT Pol=TE  P0db=1 % C68
.Monitor OptPower ring7 Port=4 dir=OUT Pol=TE  P0db=1 % C69

% Ring 8
.Monitor OptPower ring8 Port=1 dir=IN Pol=TE  P0db=1 % C72
.Monitor OptPower ring8 Port=2 dir=IN Pol=TE  P0db=1 % C73
.Monitor OptPower ring8 Port=3 dir=IN Pol=TE  P0db=1 % C74
.Monitor OptPower ring8 Port=4 dir=IN Pol=TE  P0db=1 % C75

.Monitor OptPower ring8 Port=1 dir=OUT Pol=TE  P0db=1 % C76
.Monitor OptPower ring8 Port=2 dir=OUT Pol=TE  P0db=1 % C77
.Monitor OptPower ring8 Port=3 dir=OUT Pol=TE  P0db=1 % C78
.Monitor OptPower ring8 Port=4 dir=OUT Pol=TE  P0db=1 % C79

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
