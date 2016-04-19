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
.param NonWG = '3'

.param NMODES=1

* Voltage sources
v11 Mag1 0 DC = 1 
v12 Phi1 0 DC = 0


v21 Mag2 0 DC = 1 
v22 Phi2 0 DC = 0

* lambda sweep Voltage
vcar vc 0 DC=1513

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 1, 2 channel add-drop filter
% 1 cw source 2 rings, 2 cross,

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring1 Nodes = [N11 N12 N13 N14] MoName = RingModel1
Osp OpticalRing   Name = ring2 Nodes = [N21 N22 N23 N24] MoName = RingModel1


  
Osp XCOUPLER    Name=wx1 Nodes = [N13 N14 N21 x14] MoName=WXmodel  
Osp XCOUPLER    Name=wx2 Nodes = [N23 N24 x23 x24] MoName=WXmodel

Osp MIRROR        Name = mirR1P2 Nodes = [N12] MoName = Mmodel
Osp MIRROR        Name = mirR2P2 Nodes = [N22] MoName = Mmodel

Osp MIRROR        Name = mirWx1P4 Nodes = [x14] MoName = Mmodel
Osp MIRROR        Name = mirWx2P3 Nodes = [x23] MoName = Mmodel
Osp MIRROR        Name = mirWx2P4 Nodes = [x24] MoName = Mmodel 
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
Osp Model Name = WXmodel  type = XCOUPLER ElemType=WGUIDECROSS  NumModes = NMODES Through=0.7 Right=0.15 Left=0.2 Ref=0.1 



% WGuide model
Osp Model Name = WGmodel  type = WaveGuide  Length=0.25   neff=[Non]  N0=Non NF=Non
%Osp Model Name = WGmodel  type = WaveGuide  Length=0.25   neff=[NonWG]  N0=Non NF=Non

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
.DC vcar 1510 1580 0.1



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
.Monitor OptPower wx2 Port=3 dir=IN Pol=TE  P0db=1 % C20
.Monitor OptPower wx2 Port=4 dir=IN Pol=TE  P0db=1 % C21

.Monitor OptPower wx2 Port=3 dir=OUT Pol=TE  P0db=1 % C22
.Monitor OptPower wx2 Port=4 dir=OUT Pol=TE  P0db=1 % C23

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


.end
