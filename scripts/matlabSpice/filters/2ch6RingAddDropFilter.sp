Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG  AllMon=0 AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27


.param Noff = '1.6532'
.param Non = '1.6532'
.param NonWG = '1.4'

.param NMODES=1
.param lam=1514

* Voltage sources
v11 Mag1 0 DC = 1 
v12 Phi1 0 DC = 0

v21 Mag2 0 DC = 1 
v22 Phi2 0 DC = 0

* lambda sweep Voltage
vcar vc 0 DC=1513

%%%%%%%%%%%%%%%%%%%%%%%% START SUBCKT %%%%%%%%%%%%%%%%%%%%%%%%

.SUBCKT X6rings inS drS thS adS

Osp OpticalRing   Name = Xsring1 Nodes = [inS s12 s13 s14] MoName = RingModelx1
%Osp OpticalRing   Name = Xsring1 Nodes = [inS s12 thS s14] MoName = RingModelx1
Osp OpticalRing   Name = Xsring2 Nodes = [s12 s22 s23 s24] MoName = RingModelx1
Osp OpticalRing   Name = Xsring3 Nodes = [s22 drS s33 adS] MoName = RingModelx1


Osp MIRROR        Name = mirXsring1P4 Nodes = [s14] MoName = Mmodel
Osp MIRROR        Name = mirXsring2P3 Nodes = [s23] MoName = Mmodel
Osp MIRROR        Name = mirXsring2P4 Nodes = [s24] MoName = Mmodel
Osp MIRROR        Name = mirXsring3P2 Nodes = [s33] MoName = Mmodel


Osp OpticalRing   Name = Xpring1 Nodes = [s13 p12 p13 p14] MoName = RingModelx1
Osp OpticalRing   Name = Xpring2 Nodes = [p13 p22 p23 p24] MoName = RingModelx1
Osp OpticalRing   Name = Xpring3 Nodes = [p23 p32 thS p34] MoName = RingModelx1

Osp MIRROR        Name = mirXpring1P2 Nodes = [p12] MoName = Mmodel
Osp MIRROR        Name = mirXpring1P4 Nodes = [p14] MoName = Mmodel
Osp MIRROR        Name = mirXpring2P2 Nodes = [p22] MoName = Mmodel
Osp MIRROR        Name = mirXpring2P4 Nodes = [p24] MoName = Mmodel
Osp MIRROR        Name = mirXpring3P2 Nodes = [p32] MoName = Mmodel
Osp MIRROR        Name = mirXpring3P4 Nodes = [p34] MoName = Mmodel


.param gain='1'
.param C = '0.25'



% Mirror Model
Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
%Ring general Model statment
Osp Model Name = RingModelx1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = xr1
% Coupling Model
Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

% Filter model
Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non] 

.ends X6rings
%%%%%%%%%%%%%%%%%%%%%%%% END SUBCKT %%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%% START CIR1 %%%%%%%%%%%%%%%%%%%%

% circuit 1, 2 channel add-drop filter
% 1 cw source using subs

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 c1N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

X1 c1N11 c1N12 c1N13 c1N14 X6rings xr1='10.35'
X2 c1N21 c1N22 c1N23 c1N24 X6rings xr1='10.30'
X3 c1N31 c1N32 c1N33 c1N34 X6rings xr1='10.25'
X4 c1N41 c1N42 c1N43 c1N44 X6rings xr1='10.20'


Osp XCOUPLER    Name=wx1 Nodes = [c1N13 c1N14 c1N21 c1x14] MoName=WXmodel  
Osp XCOUPLER    Name=wx2 Nodes = [c1N23 c1N24 c1N31 c1x24] MoName=WXmodel
Osp XCOUPLER    Name=wx3 Nodes = [c1N33 c1N34 c1N41 c1x34] MoName=WXmodel  
Osp XCOUPLER    Name=wx4 Nodes = [c1N43 c1N44 c1x43 c1x44] MoName=WXmodel 

Osp MIRROR        Name = mirR1P2 Nodes = [c1N12] MoName = Mmodel
Osp MIRROR        Name = mirR2P2 Nodes = [c1N22] MoName = Mmodel
Osp MIRROR        Name = mirR3P2 Nodes = [c1N32] MoName = Mmodel
Osp MIRROR        Name = mirR4P2 Nodes = [c1N42] MoName = Mmodel

Osp MIRROR        Name = mirWx1P4 Nodes = [c1x14] MoName = Mmodel
Osp MIRROR        Name = mirWx2P4 Nodes = [c1x24] MoName = Mmodel
Osp MIRROR        Name = mirWx3P4 Nodes = [c1x34] MoName = Mmodel
Osp MIRROR        Name = mirWx4P4 Nodes = [c1x44] MoName = Mmodel

% extras
%Osp MIRROR        Name = mirx2P3 Nodes = [c1x23] MoName = Mmodel
Osp MIRROR        Name = mirx2P3 Nodes = [c1x43] MoName = Mmodel

%%%%%%%%%%%%%%%%%% END CIR1 %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% START CIR2 %%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 2, 2 channel add-drop filter
% 1 cw source just rings

Osp CWSOURCE      Name = Rcw2 Nodes = [Mag2 Phi2 rN11] MoName = CWmodel lambda = lam CarrierFreqNode=vc


Osp OpticalRing   Name = c2ring1 Nodes = [rN11 rN12 rN13 rN14] MoName = RingModel1
Osp OpticalRing   Name = c2ring2 Nodes = [rN21 rN22 rN23 rN24] MoName = RingModel2
Osp OpticalRing   Name = c2ring3 Nodes = [rN31 rN32 rN33 rN34] MoName = RingModel3
Osp OpticalRing   Name = c2ring4 Nodes = [rN41 rN42 rN43 rN44] MoName = RingModel4

Osp XCOUPLER    Name=c2wx1 Nodes = [rN13 rN14 rN21 rx14] MoName=WXmodel  
Osp XCOUPLER    Name=c2wx2 Nodes = [rN23 rN24 rN31 rx24] MoName=WXmodel
Osp XCOUPLER    Name=c2wx3 Nodes = [rN33 rN34 rN41 rx34] MoName=WXmodel  
Osp XCOUPLER    Name=c2wx4 Nodes = [rN43 rN44 rx43 rx44] MoName=WXmodel 

Osp MIRROR        Name = mirc2R1P2 Nodes = [rN12] MoName = Mmodel
Osp MIRROR        Name = mirc2R2P2 Nodes = [rN22] MoName = Mmodel
Osp MIRROR        Name = mirc2R3P2 Nodes = [rN32] MoName = Mmodel
Osp MIRROR        Name = mirc2R4P2 Nodes = [rN42] MoName = Mmodel

Osp MIRROR        Name = mirc2Wx1P4 Nodes = [rx14] MoName = Mmodel
Osp MIRROR        Name = mirc2Wx2P4 Nodes = [rx24] MoName = Mmodel
Osp MIRROR        Name = mirc2Wx3P4 Nodes = [rx34] MoName = Mmodel
Osp MIRROR        Name = mirc2Wx4P4 Nodes = [rx44] MoName = Mmodel

% extras
%Osp MIRROR        Name = mirc2Wx2P3 Nodes = [rx23] MoName = Mmodel
Osp MIRROR        Name = mirc2Wx2P3 Nodes = [rx43] MoName = Mmodel
%%%%%%%%%%%%%%%%%% END CIR2 %%%%%%%%%%%%%%%%%%%%%%%%%%

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

.param gain='1'
.param C = '0.25'
.param r1='10.35'
.param r2='10.30'
.param r3='10.25'
.param r4='10.20'
.param lam=1514
.op 
.DC vcar 1500 1580 0.1

% Outputs for circut 1, (2 subs, 2 cross) // 8x2=16 outputs c2-17

.Monitor OptPower c1N11 dir=BOTH Pol=TE  P0db=1 % C2,6
.Monitor OptPower c1N12 dir=BOTH Pol=TE  P0db=1 % C3,7
.Monitor OptPower c1N13 dir=BOTH Pol=TE  P0db=1 % C4,8
.Monitor OptPower c1N14 dir=BOTH Pol=TE  P0db=1 % C5,9

.Monitor OptPower c1N21 dir=BOTH Pol=TE  P0db=1 % C10,11
.Monitor OptPower c1N22 dir=BOTH Pol=TE  P0db=1 % C12,13
.Monitor OptPower c1N23 dir=BOTH Pol=TE  P0db=1 % C14,15
.Monitor OptPower c1N24 dir=BOTH Pol=TE  P0db=1 % C16,17

% Outputs for circut 2, (2 rings , 2 cross) // 8x2=16 outputs c18-33

.Monitor OptPower rN11 dir=BOTH Pol=TE  P0db=1 % C18,19
.Monitor OptPower rN12 dir=BOTH Pol=TE  P0db=1 % C20,21
.Monitor OptPower rN13 dir=BOTH Pol=TE  P0db=1 % C22,23
.Monitor OptPower rN14 dir=BOTH Pol=TE  P0db=1 % C24,25

.Monitor OptPower rN21 dir=BOTH Pol=TE  P0db=1 % C26,27
.Monitor OptPower rN22 dir=BOTH Pol=TE  P0db=1 % C28,29
.Monitor OptPower rN23 dir=BOTH Pol=TE  P0db=1 % C30,31
.Monitor OptPower rN24 dir=BOTH Pol=TE  P0db=1 % C32,33

% Outputs for circut 1, (2 subs, 2 cross) // 8x2=16 outputs c2-17

.Monitor OptPower c1N31 dir=BOTH Pol=TE  P0db=1 % C2,6
.Monitor OptPower c1N32 dir=BOTH Pol=TE  P0db=1 % C3,7
.Monitor OptPower c1N33 dir=BOTH Pol=TE  P0db=1 % C4,8
.Monitor OptPower c1N34 dir=BOTH Pol=TE  P0db=1 % C5,9

.Monitor OptPower c1N41 dir=BOTH Pol=TE  P0db=1 % C10,11
.Monitor OptPower c1N42 dir=BOTH Pol=TE  P0db=1 % C12,13
.Monitor OptPower c1N43 dir=BOTH Pol=TE  P0db=1 % C14,15
.Monitor OptPower c1N44 dir=BOTH Pol=TE  P0db=1 % C16,17

% Outputs for circut 2, (2 rings , 2 cross) // 8x2=16 outputs c18-33

.Monitor OptPower rN41 dir=BOTH Pol=TE  P0db=1 % C18,19
.Monitor OptPower rN42 dir=BOTH Pol=TE  P0db=1 % C20,21
.Monitor OptPower rN43 dir=BOTH Pol=TE  P0db=1 % C22,23
.Monitor OptPower rN44 dir=BOTH Pol=TE  P0db=1 % C24,25

.Monitor OptPower rN41 dir=BOTH Pol=TE  P0db=1 % C26,27
.Monitor OptPower rN42 dir=BOTH Pol=TE  P0db=1 % C28,29
.Monitor OptPower rN43 dir=BOTH Pol=TE  P0db=1 % C30,31
.Monitor OptPower rN44 dir=BOTH Pol=TE  P0db=1 % C32,33


.end
