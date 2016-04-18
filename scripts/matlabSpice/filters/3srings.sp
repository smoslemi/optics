Title "subcircuit 3 ring in series "

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
% circuit 1
% 1 cw source 3 rings (in seriers)

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 Nc1r11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ringc1r1 Nodes = [Nc1r11 Nc1r12 Nc1r13 Nc1r14] MoName = RingModel1
Osp OpticalRing   Name = ringc1r2 Nodes = [Nc1r12 Nc1r22 Nc1r23 Nc1r24] MoName = RingModel1
Osp OpticalRing   Name = ringc1r3 Nodes = [Nc1r22 Nc1r32 Nc1r33 Nc1r34] MoName = RingModel1

Osp MIRROR        Name = mirR1P3 Nodes = [Nc1r13] MoName = Mmodel
Osp MIRROR        Name = mirR1P4 Nodes = [Nc1r14] MoName = Mmodel
Osp MIRROR        Name = mirR2P3 Nodes = [Nc1r23] MoName = Mmodel
Osp MIRROR        Name = mirR2P4 Nodes = [Nc1r24] MoName = Mmodel
Osp MIRROR        Name = mirR3P2 Nodes = [Nc1r32] MoName = Mmodel
Osp MIRROR        Name = mirR3P3 Nodes = [Nc1r33] MoName = Mmodel
Osp MIRROR        Name = mirR3P4 Nodes = [Nc1r34] MoName = Mmodel

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% circuit 2
% 1 cw source 3 rings (in Parallel)



Osp CWSOURCE      Name = Rcw2 Nodes = [Mag2 Phi2 Nc2r11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ringc2r1 Nodes = [Nc2r11 Nc2r12 Nc2r13 Nc2r14] MoName = RingModel1
Osp OpticalRing   Name = ringc2r2 Nodes = [Nc2r13 Nc2r22 Nc2r23 Nc2r24] MoName = RingModel2
Osp OpticalRing   Name = ringc2r3 Nodes = [Nc2r23 Nc2r32 Nc2r33 Nc2r34] MoName = RingModel3

Osp MIRROR        Name = mirc2R1P2 Nodes = [Nc2r12] MoName = Mmodel
Osp MIRROR        Name = mirc2R1P4 Nodes = [Nc2r14] MoName = Mmodel
Osp MIRROR        Name = mirc2R2P2 Nodes = [Nc2r22] MoName = Mmodel
Osp MIRROR        Name = mirc2R2P4 Nodes = [Nc2r24] MoName = Mmodel
Osp MIRROR        Name = mirc2R3P2 Nodes = [Nc2r32] MoName = Mmodel
Osp MIRROR        Name = mirc2R3P3 Nodes = [Nc2r33] MoName = Mmodel
Osp MIRROR        Name = mirc2R3P4 Nodes = [Nc2r34] MoName = Mmodel

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 3, 6 rings  (3 rings in series, 3 rings in parallel) 
% 1 cw source 3 rings (in series)

%Osp CWSOURCE  Name = Rcw3 Nodes = [Mag3 Phi3 s11] MoName = CWmodel lambda = lam CarrierFreqNode=vc
Osp CWSOURCE  Name = Rcw3 Nodes = [Mag3 Phi3 in] MoName = CWmodel lambda = lam CarrierFreqNode=vc

%X1 s11 s12 s13 s14 X6rings

%Osp MIRROR        Name = mirs12 Nodes = [s12] MoName = Mmodel
%Osp MIRROR        Name = mirs13 Nodes = [s13] MoName = Mmodel
%Osp MIRROR        Name = mirs14 Nodes = [s14] MoName = Mmodel



%.SUBCKT X6rings in dr th ad

Osp OpticalRing   Name = sring1 Nodes = [in xs12 xs13 xs14] MoName = RingModel1
Osp OpticalRing   Name = sring2 Nodes = [xs12 xs22 xs23 xs24] MoName = RingModel1
Osp OpticalRing   Name = sring3 Nodes = [xs22 dr xs33 ad] MoName = RingModel1


Osp MIRROR        Name = mirsring1P4 Nodes = [xs14] MoName = Mmodel
Osp MIRROR        Name = mirsring2P3 Nodes = [xs23] MoName = Mmodel
Osp MIRROR        Name = mirsring2P4 Nodes = [xs24] MoName = Mmodel
Osp MIRROR        Name = mirsring3P2 Nodes = [xs33] MoName = Mmodel


Osp OpticalRing   Name = pring1 Nodes = [xs13 xp12 xp13 xp14] MoName = RingModel1
Osp OpticalRing   Name = pring2 Nodes = [xp13 xp22 xp23 xp24] MoName = RingModel1
Osp OpticalRing   Name = pring3 Nodes = [xp23 xp32 th xp34] MoName = RingModel1

Osp MIRROR        Name = mirpring1P2 Nodes = [xp12] MoName = Mmodel
Osp MIRROR        Name = mirpring1P4 Nodes = [xp14] MoName = Mmodel
Osp MIRROR        Name = mirpring2P2 Nodes = [xp22] MoName = Mmodel
Osp MIRROR        Name = mirpring2P4 Nodes = [xp24] MoName = Mmodel
Osp MIRROR        Name = mirpring3P2 Nodes = [xp32] MoName = Mmodel
Osp MIRROR        Name = mirpring3P4 Nodes = [xp34] MoName = Mmodel


Osp MIRROR        Name = dr Nodes = [dr] MoName = Mmodel
Osp MIRROR        Name = th Nodes = [th] MoName = Mmodel
Osp MIRROR        Name = ad Nodes = [ad] MoName = Mmodel

%% Mirror Model
%Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
%%Ring general Model statment
%Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r1
%% Coupling Model
%Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

%% Filter model
%Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
%+         N0=Non NF=Non TotalAtten = gain Index = [Non] 

%.param r1='10.35'
%.ends X3srings

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 4, 6 rings  (3 rings in series, 3 rings in parallel) using a sub circuit
% 1 cw source 3 rings (in series)

%Osp CWSOURCE  Name = Rcw3 Nodes = [Mag3 Phi3 s11] MoName = CWmodel lambda = lam CarrierFreqNode=vc
Osp CWSOURCE  Name = Rcw3T Nodes = [Mag3T Phi3T inT] MoName = CWmodel lambda = lam CarrierFreqNode=vc

X1 inT drT thT adT X6rings

%Osp MIRROR        Name = mirs12 Nodes = [s12] MoName = Mmodel
%Osp MIRROR        Name = mirs13 Nodes = [s13] MoName = Mmodel
%Osp MIRROR        Name = mirs14 Nodes = [s14] MoName = Mmodel



.SUBCKT X6rings inS drS thS adS

Osp OpticalRing   Name = sring1 Nodes = [inS xs12 xs13 xs14] MoName = RingModel1
Osp OpticalRing   Name = sring2 Nodes = [xs12 xs22 xs23 xs24] MoName = RingModel1
Osp OpticalRing   Name = sring3 Nodes = [xs22 drS xs33 adS] MoName = RingModel1


Osp MIRROR        Name = mirsring1P4 Nodes = [xs14] MoName = Mmodel
Osp MIRROR        Name = mirsring2P3 Nodes = [xs23] MoName = Mmodel
Osp MIRROR        Name = mirsring2P4 Nodes = [xs24] MoName = Mmodel
Osp MIRROR        Name = mirsring3P2 Nodes = [xs33] MoName = Mmodel


Osp OpticalRing   Name = pring1 Nodes = [xs13 xp12 xp13 xp14] MoName = RingModel1
Osp OpticalRing   Name = pring2 Nodes = [xp13 xp22 xp23 xp24] MoName = RingModel1
Osp OpticalRing   Name = pring3 Nodes = [xp23 xp32 thS xp34] MoName = RingModel1

Osp MIRROR        Name = mirpring1P2 Nodes = [xp12] MoName = Mmodel
Osp MIRROR        Name = mirpring1P4 Nodes = [xp14] MoName = Mmodel
Osp MIRROR        Name = mirpring2P2 Nodes = [xp22] MoName = Mmodel
Osp MIRROR        Name = mirpring2P4 Nodes = [xp24] MoName = Mmodel
Osp MIRROR        Name = mirpring3P2 Nodes = [xp32] MoName = Mmodel
Osp MIRROR        Name = mirpring3P4 Nodes = [xp34] MoName = Mmodel


Osp MIRROR        Name = dr Nodes = [drS] MoName = Mmodel
Osp MIRROR        Name = th Nodes = [thS] MoName = Mmodel
Osp MIRROR        Name = ad Nodes = [adS] MoName = Mmodel

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
.ends X6rings


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
.param r3='10.35'
.param r2='10.30'
.param r1='10.25'
.param lam=1514
.op 
.DC vcar 1510 1580 1
%.tran .1e-9 10e-9 nsolver=BACKE 


% Outputs for circut 1 3 ring in series
% Ring 1
.Monitor OptPower ringc1r1 Port=1 dir=IN Pol=TE  P0db=1 % C2
.Monitor OptPower ringc1r1 Port=2 dir=IN Pol=TE  P0db=1 % C3
.Monitor OptPower ringc1r1 Port=3 dir=IN Pol=TE  P0db=1 % C4
.Monitor OptPower ringc1r1 Port=4 dir=IN Pol=TE  P0db=1 % C5

.Monitor OptPower ringc1r1 Port=1 dir=OUT Pol=TE  P0db=1 % C6
.Monitor OptPower ringc1r1 Port=2 dir=OUT Pol=TE  P0db=1 % C7
.Monitor OptPower ringc1r1 Port=3 dir=OUT Pol=TE  P0db=1 % C8
.Monitor OptPower ringc1r1 Port=4 dir=OUT Pol=TE  P0db=1 % C9
% Ring 2
.Monitor OptPower ringc1r2 Port=1 dir=IN Pol=TE  P0db=1 % C10
.Monitor OptPower ringc1r2 Port=2 dir=IN Pol=TE  P0db=1 % C11
.Monitor OptPower ringc1r2 Port=3 dir=IN Pol=TE  P0db=1 % C12
.Monitor OptPower ringc1r2 Port=4 dir=IN Pol=TE  P0db=1 % C13

.Monitor OptPower ringc1r2 Port=1 dir=OUT Pol=TE  P0db=1 % C14
.Monitor OptPower ringc1r2 Port=2 dir=OUT Pol=TE  P0db=1 % C15
.Monitor OptPower ringc1r2 Port=3 dir=OUT Pol=TE  P0db=1 % C16
.Monitor OptPower ringc1r2 Port=4 dir=OUT Pol=TE  P0db=1 % C17
% Ring 3
.Monitor OptPower ringc1r3 Port=1 dir=IN Pol=TE  P0db=1 % C18
.Monitor OptPower ringc1r3 Port=2 dir=IN Pol=TE  P0db=1 % C19
.Monitor OptPower ringc1r3 Port=3 dir=IN Pol=TE  P0db=1 % C20
.Monitor OptPower ringc1r3 Port=4 dir=IN Pol=TE  P0db=1 % C21

.Monitor OptPower ringc1r3 Port=1 dir=OUT Pol=TE  P0db=1 % C22
.Monitor OptPower ringc1r3 Port=2 dir=OUT Pol=TE  P0db=1 % C23
.Monitor OptPower ringc1r3 Port=3 dir=OUT Pol=TE  P0db=1 % C24
.Monitor OptPower ringc1r3 Port=4 dir=OUT Pol=TE  P0db=1 % C25


% Outputs for circut 2 3 ring in Parallel
% Ring 1
.Monitor OptPower ringc2r1 Port=1 dir=IN Pol=TE  P0db=1 % C26
.Monitor OptPower ringc2r1 Port=2 dir=IN Pol=TE  P0db=1 % C27
.Monitor OptPower ringc2r1 Port=3 dir=IN Pol=TE  P0db=1 % C28
.Monitor OptPower ringc2r1 Port=4 dir=IN Pol=TE  P0db=1 % C29

.Monitor OptPower ringc2r1 Port=1 dir=OUT Pol=TE  P0db=1 % C30
.Monitor OptPower ringc2r1 Port=2 dir=OUT Pol=TE  P0db=1 % C31
.Monitor OptPower ringc2r1 Port=3 dir=OUT Pol=TE  P0db=1 % C32
.Monitor OptPower ringc2r1 Port=4 dir=OUT Pol=TE  P0db=1 % C33
% Ring 2
.Monitor OptPower ringc2r2 Port=1 dir=IN Pol=TE  P0db=1 % C34
.Monitor OptPower ringc2r2 Port=2 dir=IN Pol=TE  P0db=1 % C35
.Monitor OptPower ringc2r2 Port=3 dir=IN Pol=TE  P0db=1 % C36
.Monitor OptPower ringc2r2 Port=4 dir=IN Pol=TE  P0db=1 % C37

.Monitor OptPower ringc2r2 Port=1 dir=OUT Pol=TE  P0db=1 % C38
.Monitor OptPower ringc2r2 Port=2 dir=OUT Pol=TE  P0db=1 % C39
.Monitor OptPower ringc2r2 Port=3 dir=OUT Pol=TE  P0db=1 % C40
.Monitor OptPower ringc2r2 Port=4 dir=OUT Pol=TE  P0db=1 % C41
% Ring 3
.Monitor OptPower ringc2r3 Port=1 dir=IN Pol=TE  P0db=1 % C42
.Monitor OptPower ringc2r3 Port=2 dir=IN Pol=TE  P0db=1 % C43
.Monitor OptPower ringc2r3 Port=3 dir=IN Pol=TE  P0db=1 % C44
.Monitor OptPower ringc2r3 Port=4 dir=IN Pol=TE  P0db=1 % C45

.Monitor OptPower ringc2r3 Port=1 dir=OUT Pol=TE  P0db=1 % C46
.Monitor OptPower ringc2r3 Port=2 dir=OUT Pol=TE  P0db=1 % C47
.Monitor OptPower ringc2r3 Port=3 dir=OUT Pol=TE  P0db=1 % C48
.Monitor OptPower ringc2r3 Port=4 dir=OUT Pol=TE  P0db=1 % C49

.Monitor OptPower sring1 Port=1 dir=IN Pol=TE  P0db=1 % C50
.Monitor OptPower sring3 Port=2 dir=IN Pol=TE  P0db=1 % C51
.Monitor OptPower pring3 Port=3 dir=IN Pol=TE  P0db=1 % C52
.Monitor OptPower sring3 Port=4 dir=IN Pol=TE  P0db=1 % C53

.Monitor OptPower sring1 Port=1 dir=OUT Pol=TE  P0db=1 % C54
.Monitor OptPower sring3 Port=2 dir=OUT Pol=TE  P0db=1 % C55
.Monitor OptPower pring3 Port=3 dir=OUT Pol=TE  P0db=1 % C56
.Monitor OptPower sring3 Port=4 dir=OUT Pol=TE  P0db=1 % C57


.Monitor OptPower X1 Port=1 dir=IN Pol=TE  P0db=1 % C58
.Monitor OptPower X1 Port=2 dir=IN Pol=TE  P0db=1 % C59
.Monitor OptPower X1 Port=3 dir=IN Pol=TE  P0db=1 % C60
.Monitor OptPower X1 Port=4 dir=IN Pol=TE  P0db=1 % C61

.Monitor OptPower X1 Port=1 dir=OUT Pol=TE  P0db=1 % C62
.Monitor OptPower X1 Port=2 dir=OUT Pol=TE  P0db=1 % C63
.Monitor OptPower X1 Port=3 dir=OUT Pol=TE  P0db=1 % C64
.Monitor OptPower X1 Port=4 dir=OUT Pol=TE  P0db=1 % C65

.end