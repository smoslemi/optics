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

* Voltage sources
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0 

* lambda sweep Voltage
vcar vc 0 DC=1513

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda=lam CarrierFreqNode=vc
Osp OpticalRing   Name = ring1 Nodes = [N11 N12 N13 N14] MoName = RingModel1
Osp MIRROR        Name = Rmir12 Nodes = [N12] MoName = Mmodel 
%Osp MIRROR        Name = Rmir13 Nodes = [N13] MoName = Mmodel 
Osp MIRROR        Name = Rmir14 Nodes = [N14] MoName = Mmodel 


Osp OpticalRing   Name = ring2 Nodes = [N13 N22 N23 N24] MoName = RingModel2
Osp MIRROR        Name = Rmir22 Nodes = [N22] MoName = Mmodel 
%Osp MIRROR        Name = Rmir23 Nodes = [N23] MoName = Mmodel 
Osp MIRROR        Name = Rmir24 Nodes = [N24] MoName = Mmodel 


Osp OpticalRing   Name = ring3 Nodes = [N23 N32 N33 N34] MoName = RingModel3
Osp MIRROR        Name = Rmir32 Nodes = [N32] MoName = Mmodel 
Osp MIRROR        Name = Rmir33 Nodes = [N33] MoName = Mmodel 
Osp MIRROR        Name = Rmir34 Nodes = [N34] MoName = Mmodel 


% Mirror Model
Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 

% Source Model
Osp Model Name = CWmodel  type = CWSOURCE lambda=lam


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



** gain is for pwr so sqrt is taken 
.param gain='1'
%.param gain='0.9'

.param r1='10.35'
.param r2='10.30'
.param r3='10.25'
.param C = '0.25'

.param lam=1513
% .op 
.DC vcar 1500 1580 .05


%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN
.Monitor OptPower ring1 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring1 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring1 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring1 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring1 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring1 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring1 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring1 Port=4 dir=OUT Pol=TE  P0db=1


.Monitor OptPower ring2 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring2 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring2 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring2 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring2 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring2 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring2 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring2 Port=4 dir=OUT Pol=TE  P0db=1

.Monitor OptPower ring3 Port=1 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring3 Port=2 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring3 Port=3 dir=IN Pol=TE  P0db=1
.Monitor OptPower ring3 Port=4 dir=IN Pol=TE  P0db=1

.Monitor OptPower ring3 Port=1 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring3 Port=2 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring3 Port=3 dir=OUT Pol=TE  P0db=1
.Monitor OptPower ring3 Port=4 dir=OUT Pol=TE  P0db=1

.end
