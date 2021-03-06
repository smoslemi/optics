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


% circuit 1, just a ring

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring1 Nodes = [N11 N12 N13 N14] MoName = RingModel1
Osp MIRROR        Name = mirN12 Nodes = [N12] MoName = Mmodel 
Osp MIRROR        Name = mirN13 Nodes = [N13] MoName = Mmodel 
Osp MIRROR        Name = mirN14 Nodes = [N14] MoName = Mmodel 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 2, just a cross

Osp CWSOURCE      Name = Rcw2 Nodes = [Mag2 Phi2 x11] MoName = CWmodel lambda = lam CarrierFreqNode=vc
Osp XCOUPLER      Name=wx1 Nodes = [x11 x12 x13 x14] MoName=WXmodel
Osp MIRROR        Name = mirx12 Nodes = [x12] MoName = Mmodel
Osp MIRROR        Name = mirx13 Nodes = [x13] MoName = Mmodel
Osp MIRROR        Name = mirx14 Nodes = [x14] MoName = Mmodel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 3, One ring and one cross

Osp CWSOURCE      Name = Rcw3 Nodes = [Mag3 Phi3 N21] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring2 Nodes = [N21 N22 N23 N24] MoName = RingModel1
Osp MIRROR        Name = mirN22 Nodes = [N22] MoName = Mmodel  

Osp XCOUPLER    Name=wx2 Nodes = [N23 N24  x23 x24] MoName=WXmodel  
Osp MIRROR        Name = Xmir23 Nodes = [x23] MoName = Mmodel 
Osp MIRROR        Name = Xmir24 Nodes = [x24] MoName = Mmodel 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 4, One ring and two crosses

Osp CWSOURCE      Name = Rcw4 Nodes = [Mag4 Phi4 N31] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring3 Nodes = [N31 N32 N33 N34] MoName = RingModel1
Osp MIRROR        Name = mirN32 Nodes = [N32] MoName = Mmodel 

Osp XCOUPLER    Name=wx3 Nodes = [N33 N34 x33 x34] MoName=WXmodel
Osp XCOUPLER    Name=wx4 Nodes = [x33  x42 x43 x44] MoName=WXmodel

Osp MIRROR        Name = mirx34 Nodes = [x34] MoName = Mmodel 
Osp MIRROR        Name = mirx42 Nodes = [x42] MoName = Mmodel 
Osp MIRROR        Name = mirx43 Nodes = [x43] MoName = Mmodel
Osp MIRROR        Name = mirx44 Nodes = [x44] MoName = Mmodel 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 5, Two rings and two crosses

Osp CWSOURCE      Name = Rcw5 Nodes = [Mag5 Phi5 N41] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring4 Nodes = [N41 N42 N43 N44] MoName = RingModel1
Osp MIRROR        Name = mirN42 Nodes = [N42] MoName = Mmodel 

Osp XCOUPLER      Name=wx5 Nodes = [N43 N44 N51 x54] MoName=WXmodel
Osp MIRROR        Name = mirN52 Nodes = [N52] MoName = Mmodel
%Osp MIRROR        Name = mirN53 Nodes = [N53] MoName = Mmodel
%Osp MIRROR        Name = mirN54 Nodes = [N54] MoName = Mmodel
Osp OpticalRing   Name = ring5 Nodes = [N51 N52 N53 N54] MoName = RingModel1
Osp XCOUPLER      Name=wx6 Nodes = [N53 N54 x63 x64] MoName=WXmodel

Osp MIRROR        Name = mirx54 Nodes = [x54] MoName = Mmodel 
Osp MIRROR        Name = mirx63 Nodes = [x63] MoName = Mmodel
Osp MIRROR        Name = mirx64 Nodes = [x64] MoName = Mmodel 
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

% Coupling Model
Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

% Filter model
Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
  
% Ring related Models  END

% Xcouple model
Osp Model Name = WXmodel  type = XCOUPLER ElemType=WGUIDECROSS  NumModes = NMODES 
+                         Through=0.8 Right=0.15 Left=0.4 Ref=0.1 


** gain is for pwr so sqrt is taken 
.param gain='1'
%.param gain='0.9'

.param r1='10.35'
.param r2='10.30'
.param r3='10.25'
.param C = '0.25'

.param lam=1513
%.op 
.DC vcar 1512 1518 0.01
%.tran .1e-9 10e-9 nsolver=BACKE 

%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN


%.Monitor OptFields l5 Format=MagPhi Port=1 dir=IN  Pol=TE

% Outputs for circut 1, Ring1
.Monitor OptPower ring1 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring1 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring1 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring1 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring1 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring1 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring1 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring1 Port=4 dir=OUT Pol=TE  P0db=1


% Outputs for circut 2, x1
.Monitor OptPower wx1 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx1 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx1 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx1 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower wx1 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx1 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx1 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx1 Port=4 dir=OUT Pol=TE  P0db=1


% Outputs for circut 3, (Ring2, x2)
.Monitor OptPower ring2 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring2 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring2 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring2 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring2 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring2 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring2 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring2 Port=4 dir=OUT Pol=TE  P0db=1

.Monitor OptPower wx2 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx2 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx2 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx2 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower wx2 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx2 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx2 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx2 Port=4 dir=OUT Pol=TE  P0db=1


% Outputs for circut 4, (Ring3, x3, x4)
.Monitor OptPower ring3 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring3 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring3 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring3 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring3 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring3 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring3 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring3 Port=4 dir=OUT Pol=TE  P0db=1

.Monitor OptPower wx3 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx3 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx3 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx3 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower wx3 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx3 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx3 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx3 Port=4 dir=OUT Pol=TE  P0db=1

.Monitor OptPower wx4 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx4 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx4 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx4 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower wx4 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx4 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx4 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx4 Port=4 dir=OUT Pol=TE  P0db=1

% Outputs for circut 5, (Ring4, Ring5, x5, x6)
.Monitor OptPower ring4 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring4 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring4 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring4 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring4 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring4 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring4 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring4 Port=4 dir=OUT Pol=TE  P0db=1

.Monitor OptPower wx5 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx5 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx5 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx5 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower wx5 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx5 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx5 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx5 Port=4 dir=OUT Pol=TE  P0db=1

.Monitor OptPower ring5 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring5 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring5 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring5 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring5 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring5 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring5 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring5 Port=4 dir=OUT Pol=TE  P0db=1

.Monitor OptPower wx6 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx6 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx6 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx6 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower wx6 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx6 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx6 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx6 Port=4 dir=OUT Pol=TE  P0db=1

.end
