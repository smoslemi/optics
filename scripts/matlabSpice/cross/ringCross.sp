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
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0

v3 Mag2 0 DC = 1 
v4 Phi2 0 DC = 0 

* lambda sweep Voltage
vcar vc 0 DC=1513

%Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda=lam CarrierFreqNode=vc
Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc
Osp CWSOURCE      Name = Rcw2 Nodes = [Mag2 Phi2 l3] MoName = CWmodel lambda = lam


Osp OpticalRing   Name = ring1 Nodes = [N11 N12 N13 N14] MoName = RingModel1
Osp MIRROR        Name = Rmir12 Nodes = [N12] MoName = Mmodel 
Osp MIRROR        Name = Rmir13 Nodes = [N13] MoName = Mmodel 
Osp MIRROR        Name = Rmir14 Nodes = [N14] MoName = Mmodel 


Osp XCOUPLER    Name=wx1 Nodes = [l3 l4  l5 l6] MoName=WXmodel
Osp MIRROR        Name = Xmir13 Nodes = [l4] MoName = Mmodel 
Osp MIRROR        Name = Xmir14 Nodes = [l5] MoName = Mmodel 
Osp MIRROR        Name = Xmir15 Nodes = [l6] MoName = Mmodel 

 

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
+                         Through=0.8 Right=0.3 Left=0.5 Ref=0.1 


** gain is for pwr so sqrt is taken 
.param gain='1'
%.param gain='0.9'

.param r1='10.35'
.param r2='10.30'
.param r3='10.25'
.param C = '0.25'

.param lam=1513
%.op 
.DC vcar 1500 1580 .05
%.tran .1e-9 10e-9 nsolver=BACKE 

%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN


%.Monitor OptFields l5 Format=MagPhi Port=1 dir=IN  Pol=TE

.Monitor OptPower ring1 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring1 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring1 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring1 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring1 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring1 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring1 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring1 Port=4 dir=OUT Pol=TE  P0db=1


.Monitor OptPower wx1 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx1 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx1 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx1 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower wx1 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx1 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx1 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx1 Port=4 dir=OUT Pol=TE  P0db=1

%.Monitor OptPower ring3 Port=1 dir=IN Pol=TE  P0db=1
%.Monitor OptPower ring3 Port=2 dir=IN Pol=TE  P0db=1
%.Monitor OptPower ring3 Port=3 dir=IN Pol=TE  P0db=1
%.Monitor OptPower ring3 Port=4 dir=IN Pol=TE  P0db=1

%.Monitor OptPower ring3 Port=1 dir=OUT Pol=TE  P0db=1
%.Monitor OptPower ring3 Port=2 dir=OUT Pol=TE  P0db=1
%.Monitor OptPower ring3 Port=3 dir=OUT Pol=TE  P0db=1
%.Monitor OptPower ring3 Port=4 dir=OUT Pol=TE  P0db=1

.end
