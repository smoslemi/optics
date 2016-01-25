Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG  AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param PI=3.14159265358979
.param FourPI='4*3.1415926'
.param PIover2='3.1415926/2.0'

.param Non = 3.0 
.param Noff = 3.012

% Voltage sources
v1 Mag1 0 DC = 1
% pulse 0 1 .04n .005n .005n .01n .08n
v2 Mag2 0 DC = 1 
% pulse 0 1 .04n .005n .005n .01n .08n

v3 Phi1 0 DC = 0 
vN vn 0 0.012
% pulse 0 0.02 0.1n .005n .005n 1n

Osp CWSOURCE      Name = cw1 Nodes = [Mag1 Phi1 in1] MoName = CWmodel lambda=lam 
Osp CWSOURCE      Name = cw2 Nodes = [Mag2 Phi1 out1] MoName = CWmodel lambda=lam 

Osp OpticalRing   Name = ring1 Nodes = [in1 in2 I1 I2] MoName = RingModel1
+ LayerCNodes = [{vn 0} {vn 0}] InitialVs = [0.0]
Osp OpticalRing   Name = ring2 Nodes = [I2 I1 out1 out2] MoName = RingModel2
+ LayerCNodes = [{vn 0} {vn 0}] InitialVs = [0.0]

Osp MIRROR        Name = mir1 Nodes = [in2] MoName = Mmodel 
% Osp MIRROR        Name = mir2 Nodes = [out1] MoName = Mmodel 
Osp MIRROR        Name = mir3 Nodes = [out2] MoName = Mmodel 


Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
Osp Model Name = CWmodel  type = CWSOURCE lambda=lam

Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
+         dNdV = [1.0] MaxOptLen=[moptl]

Osp Model Name = RingFilter2 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
+         dNdV = [1.0] MaxOptLen=[moptl]

Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r

Osp Model Name = RingModel2 type = OptRing XC_model = XCmodel1 RingModel=RingFilter2 Radius = r


% gain is for pwr so sqrt is taken 
.param gain='0.97'
.param r='10'
.param C = '0.3'
.param moptl='2.5*r*Non*2*PI'
.param lam=1557.81
.op 

*.tran .001n 0.2n MaxSt=.01e-9

.Monitor OptFields in1 Format=Mag dir=FWD Pol=TE  
.Monitor OptFields in2 Format=Mag dir=REV Pol=TE  
.Monitor OptFields I1 Format=Mag dir=FWD Pol=TE  
.Monitor OptFields I2 Format=Mag dir=REV Pol=TE  
.Monitor OptFields cw2 port=3 Format=Mag dir=OUT Pol=TE 
.Monitor OptFields out2 Format=Mag dir=FWD Pol=TE 
.end
