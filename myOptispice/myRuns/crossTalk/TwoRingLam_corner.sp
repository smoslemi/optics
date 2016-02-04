Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG  AllMon=0 AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param PI=3.14159265358979
.param FourPI='4*3.1415926'
.param PIover2='3.1415926/2.0'
.param Noffset = 3.0e-4
.param Non = '3.0  + Noffset'
.param Noff = '3.012 + Noffset'

* Voltage sources
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0 

* lambda sweep Voltage
vcar vc 0 DC=1557.81 

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 N11] MoName = CWmodel lambda=lam CarrierFreqNode=vc
Osp OpticalRing   Name = ring1 Nodes = [N11 N12 N13 N14] MoName = RingModel1
%Osp MIRROR        Name = Rmir1 Nodes = [N12] MoName = Mmodel 
Osp MIRROR        Name = Rmir2 Nodes = [N13] MoName = Mmodel 
Osp MIRROR        Name = Rmir3 Nodes = [N14] MoName = Mmodel 


Osp OpticalRing   Name = ring2 Nodes = [N12 N22 N23 N24] MoName = RingModel1
Osp MIRROR        Name = Rmir21 Nodes = [N22] MoName = Mmodel 
Osp MIRROR        Name = Rmir22 Nodes = [N23] MoName = Mmodel 
Osp MIRROR        Name = Rmir23 Nodes = [N24] MoName = Mmodel 


Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
Osp Model Name = CWmodel  type = CWSOURCE lambda=lam

Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
  


Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r

** gain is for pwr so sqrt is taken 
.param gain='1'
.param r='10'
.param C = '0.25'

.param lam=1557.81
% .op 
.DC vcar 1550 1600 .005



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

.end
