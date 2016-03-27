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
.param NonWG = '1.4'

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

v3p51 Mag3p5 0 DC = 1 
v3p52 Phi3p5 0 DC = 0 

* lambda sweep Voltage
vcar vc 0 DC=1513

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 3.5, One ring and one cross with waveguides

Osp CWSOURCE      Name = Rcw3p5 Nodes = [Mag3p5 Phi3p5 N61] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring6 Nodes = [N61 N62 N63 N64] MoName = RingModel1
Osp MIRROR        Name = mirN62 Nodes = [N62] MoName = Mmodel

Osp WaveGuide  Name=wg1 Nodes = [N63 x71] MoName=WGmodel  
Osp WaveGuide  Name=wg2 Nodes = [N64 x72] MoName=WGmodel
  
Osp XCOUPLER    Name=wx7 Nodes = [x71 x72 x73 x74] MoName=WXmodel  

Osp WaveGuide  Name=wg3 Nodes = [x73 w3e] MoName=WGmodel  
Osp WaveGuide  Name=wg4 Nodes = [x74 w4n] MoName=WGmodel 

Osp MIRROR        Name = WGmir3e Nodes = [w3e] MoName = Mmodel 
Osp MIRROR        Name = WGmir4n Nodes = [w4n] MoName = Mmodel 
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
+                         Through=0.7 Right=0.0 Left=0.0 Ref=0.1 



% WGuide model
Osp Model Name = WGmodel  type = WaveGuide  Length=1   neff=[Non]  N0=Non NF=Non
%Osp Model Name = WGmodel  type = WaveGuide  Length=1   neff=[NonWG]  N0=Non NF=Non

** gain is for pwr so sqrt is taken 
%.param gain='1'
.param gain='0.85'

.param r1='10.35'
.param r2='10.30'
.param r3='10.25'
.param C = '0.25'

.param lam=1513
.op 
.DC vcar 1510 1580 0.1
%.tran .1e-9 10e-9 nsolver=BACKE 

%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN


%.Monitor OptFields l5 Format=MagPhi Port=1 dir=IN  Pol=TE


% Outputs for circut 3.5, (Ring6, x7, x1-4) // 20 outputs c90-c109
.Monitor OptPower ring6 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring6 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring6 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring6 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring6 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring6 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring6 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring6 Port=4 dir=OUT Pol=TE  P0db=1

.Monitor OptPower wx7 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx7 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx7 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower wx7 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower wx7 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx7 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx7 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wx7 Port=4 dir=OUT Pol=TE  P0db=1

.Monitor OptPower wg3 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower wg4 Port=2 dir=IN Pol=TE  P0db=1

.Monitor OptPower wg3 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower wg4 Port=2 dir=OUT Pol=TE  P0db=1

.end
