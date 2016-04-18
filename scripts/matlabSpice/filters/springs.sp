Title "subcircuit 3 ring in series "

Osp Jobcontrol Verbosity=DEBUG  AllMon=0 AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

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


v41 Mag3T 0 DC = 1 
v42 Phi3T 0 DC = 0
* lambda sweep Voltage
vcar vc 0 DC=1513

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 1, 6 rings  (3 rings in series, 3 rings in parallel) 

Osp CWSOURCE  Name = Rcw1 Nodes = [Mag1 Phi1 in] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = sring1 Nodes = [in s12 s13 s14] MoName = RingModel1
Osp OpticalRing   Name = sring2 Nodes = [s12 s22 s23 s24] MoName = RingModel1
Osp OpticalRing   Name = sring3 Nodes = [s22 dr s33 ad] MoName = RingModel1


Osp MIRROR        Name = mirsring1P4 Nodes = [s14] MoName = Mmodel
Osp MIRROR        Name = mirsring2P3 Nodes = [s23] MoName = Mmodel
Osp MIRROR        Name = mirsring2P4 Nodes = [s24] MoName = Mmodel
Osp MIRROR        Name = mirsring3P2 Nodes = [s33] MoName = Mmodel


Osp OpticalRing   Name = pring1 Nodes = [s13 p12 p13 p14] MoName = RingModel1
Osp OpticalRing   Name = pring2 Nodes = [p13 p22 p23 p24] MoName = RingModel1
Osp OpticalRing   Name = pring3 Nodes = [p23 p32 th p34] MoName = RingModel1

Osp MIRROR        Name = mirpring1P2 Nodes = [p12] MoName = Mmodel
Osp MIRROR        Name = mirpring1P4 Nodes = [p14] MoName = Mmodel
Osp MIRROR        Name = mirpring2P2 Nodes = [p22] MoName = Mmodel
Osp MIRROR        Name = mirpring2P4 Nodes = [p24] MoName = Mmodel
Osp MIRROR        Name = mirpring3P2 Nodes = [p32] MoName = Mmodel
Osp MIRROR        Name = mirpring3P4 Nodes = [p34] MoName = Mmodel


Osp MIRROR        Name = dr Nodes = [dr] MoName = Mmodel
Osp MIRROR        Name = th Nodes = [th] MoName = Mmodel
Osp MIRROR        Name = ad Nodes = [ad] MoName = Mmodel

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 2, 6 rings  (3 rings in series, 3 rings in parallel) using a sub circuit

Osp CWSOURCE  Name = Rcw2 Nodes = [Mag2 Phi2 inX] MoName = CWmodel lambda = lam CarrierFreqNode=vc

X1 inX drX thX adX X6rings

Osp MIRROR        Name = drX Nodes = [drX] MoName = Mmodel
Osp MIRROR        Name = thX Nodes = [thX] MoName = Mmodel
Osp MIRROR        Name = adX Nodes = [adX] MoName = Mmodel


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

% Mirror Model
Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 

% Source Model
Osp Model Name = CWmodel  type = CWSOURCE NumModes = NMODES lambda=lam


% Ring related Models  START

%Ring general Model statment
Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r1
Osp Model Name = RingModel2 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r1
Osp Model Name = RingModel3 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r1

% Coupling Model
Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

% Filter model
Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
  
% Ring related Models  END


** gain is for pwr so sqrt is taken 
.param gain='1'
.param C = '0.65'
.param r1='10.35'
.param r2='10.30'
.param r3='10.05'
.param lam=1514
.op 
.DC vcar 1510 1580 1
%.tran .1e-9 10e-9 nsolver=BACKE 


.Monitor OptPower sring1 Port=1 dir=IN Pol=TE  P0db=1 % C2
.Monitor OptPower sring3 Port=2 dir=IN Pol=TE  P0db=1 % C3
.Monitor OptPower pring3 Port=3 dir=IN Pol=TE  P0db=1 % C4
.Monitor OptPower sring3 Port=4 dir=IN Pol=TE  P0db=1 % C5

.Monitor OptPower sring1 Port=1 dir=OUT Pol=TE  P0db=1 % C6
.Monitor OptPower sring3 Port=2 dir=OUT Pol=TE  P0db=1 % C7
.Monitor OptPower pring3 Port=3 dir=OUT Pol=TE  P0db=1 % C8
.Monitor OptPower sring3 Port=4 dir=OUT Pol=TE  P0db=1 % C9

.Monitor OptPower inX dir=BOTH Pol=TE  P0db=1 % C10(f,in),11(b,out)
.Monitor OptPower drX dir=BOTH Pol=TE  P0db=1 % C12(f,out),13(b,in)
.Monitor OptPower thX dir=BOTH Pol=TE  P0db=1 % C14(f,out),15(b,in)
.Monitor OptPower adX dir=BOTH Pol=TE  P0db=1 % C16(f,out),17(bin)


.end