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


.param NMODES=1

% I wanted to split the souce to be input for multiple paths of rings.
% Meaning one light source feeding 1, 2 or more circuits.
% It is like one light source distrubuted between couple of circuits
%
%                 |-----> Path1
%                 |-----> Path2 
% light source ---|-----> Path3
%                 |-----> Path4 
%                 
%                 |     |     |     |     |     |     |     |       
% each path : ____|_____|_____|_____|_____|_____|_____|_____|_____
%                 |     |     |     |     |     |     |     |
%               R1|   R2|   R3|   R4|   R5|   R6|   R7|   R8|  
%                
% EACH path is an 8 channel filter using rings and wave crosses
% This circuit is an 16 channel filter, so the circuit will have
% 2 paths --2 paralle path of 8-channle filters. Path1 will filter the
% first half of wavelength channel window, and the path2 will filter the second
% half of wavelength channel window.
% In path1, the 8 rings will filter lambda1-lambda8
% In path2, the 8 rings will filter lambda9-lambda16
% Wavelength windown which is given as the desgin spec is [lambda1, lambda16]
% We also need a spec of how to choose channles, are they equaly spaced, or 
% they have specific delta-lambda between channels or .... 
% This won't effect our algorithm much.



* Voltage sources
v11 Mag1 0 DC = 1 
v12 Phi1 0 DC = 0

v21 Mag2 0 DC = 1 
v22 Phi2 0 DC = 0
* lambda sweep Voltage
vcar vc 0 DC=1530

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

** gain is for pwr so sqrt is taken 
.param gain='1'
.param C = '2.20423e-01'
.param Non = '1.65320e+00'
.param lam=1530

% dr is the radius diff between the rings. We don't necessarily need this param. 
% Instead of using dr we can just define the ring radiuses one by one.

% rij: Redius for Ring j in path i.

% I have a matlab algorithm which gives me the filter's structural parameters based on the given design spec.
% With structal paramers I mean: c and ring radius.

% neff is choosen as desgin spec.


.param dr1 = '0.018'
.param r11='13.846e+00'
.param r12='13.825'
.param r13='r12-dr1'
.param r14='r13-dr1'
.param r15='r14-dr1'
.param r16='r15-dr1'
.param r17='r16-dr1'
.param r18='r17-dr1'

%%%%%%%%%%%%%%%%%%%%%%%%
.param dr2 = '0.018'
.param r21='13.99e+00'
.param r22='13.969'
.param r23='r22-dr2'
.param r24='r23-dr2'
.param r25='r24-dr2'
.param r26='r25-dr2'
.param r27='r26-dr2'
.param r28='r27-dr2'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% circuit 1, 8 channel add-drop filter
% 1 cw source 8 rings, 8 cross,

Osp CWSOURCE      Name = Rcw1 Nodes = [Mag1 Phi1 P1N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc
Osp CWSOURCE      Name = Rcw2 Nodes = [Mag2 Phi2 P2N11] MoName = CWmodel lambda = lam CarrierFreqNode=vc

Osp OpticalRing   Name = ring11 Nodes = [P1N11 P1N12 P1N13 P1N14] MoName = RingModel11
Osp OpticalRing   Name = ring12 Nodes = [P1N21 P1N22 P1N23 P1N24] MoName = RingModel12
Osp OpticalRing   Name = ring13 Nodes = [P1N31 P1N32 P1N33 P1N34] MoName = RingModel13
Osp OpticalRing   Name = ring14 Nodes = [P1N41 P1N42 P1N43 P1N44] MoName = RingModel14
Osp OpticalRing   Name = ring15 Nodes = [P1N51 P1N52 P1N53 P1N54] MoName = RingModel15
Osp OpticalRing   Name = ring16 Nodes = [P1N61 P1N62 P1N63 P1N64] MoName = RingModel16
Osp OpticalRing   Name = ring17 Nodes = [P1N71 P1N72 P1N73 P1N74] MoName = RingModel17
Osp OpticalRing   Name = ring18 Nodes = [P1N81 P1N82 P1N83 P1N84] MoName = RingModel18
  
Osp XCOUPLER    Name=wx11 Nodes = [P1N13 P1N14 P1N21 P1x14] MoName=WXmodel  
Osp XCOUPLER    Name=wx12 Nodes = [P1N23 P1N24 P1N31 P1x24] MoName=WXmodel 
Osp XCOUPLER    Name=wx13 Nodes = [P1N33 P1N34 P1N41 P1x34] MoName=WXmodel 
Osp XCOUPLER    Name=wx14 Nodes = [P1N43 P1N44 P1N51 P1x44] MoName=WXmodel 
Osp XCOUPLER    Name=wx15 Nodes = [P1N53 P1N54 P1N61 P1x54] MoName=WXmodel 
Osp XCOUPLER    Name=wx16 Nodes = [P1N63 P1N64 P1N71 P1x64] MoName=WXmodel 
Osp XCOUPLER    Name=wx17 Nodes = [P1N73 P1N74 P1N81 P1x74] MoName=WXmodel 
Osp XCOUPLER    Name=wx18 Nodes = [P1N83 P1N84 P1x83 P1x84] MoName=WXmodel

Osp MIRROR        Name = mirP1R1P2 Nodes = [P1N12] MoName = Mmodel
Osp MIRROR        Name = mirP1R2P2 Nodes = [P1N22] MoName = Mmodel
Osp MIRROR        Name = mirP1R3P2 Nodes = [P1N32] MoName = Mmodel
Osp MIRROR        Name = mirP1R4P2 Nodes = [P1N42] MoName = Mmodel
Osp MIRROR        Name = mirP1R5P2 Nodes = [P1N52] MoName = Mmodel
Osp MIRROR        Name = mirP1R6P2 Nodes = [P1N62] MoName = Mmodel
Osp MIRROR        Name = mirP1R7P2 Nodes = [P1N72] MoName = Mmodel
Osp MIRROR        Name = mirP1R8P2 Nodes = [P1N82] MoName = Mmodel
Osp MIRROR        Name = mirP1Wx1P4 Nodes = [P1x14] MoName = Mmodel
Osp MIRROR        Name = mirP1Wx2P4 Nodes = [P1x24] MoName = Mmodel
Osp MIRROR        Name = mirP1Wx3P4 Nodes = [P1x34] MoName = Mmodel
Osp MIRROR        Name = mirP1Wx4P4 Nodes = [P1x44] MoName = Mmodel
Osp MIRROR        Name = mirP1Wx5P4 Nodes = [P1x54] MoName = Mmodel
Osp MIRROR        Name = mirP1Wx6P4 Nodes = [P1x64] MoName = Mmodel
Osp MIRROR        Name = mirP1Wx7P4 Nodes = [P1x74] MoName = Mmodel 
Osp MIRROR        Name = mirP1Wx8P3 Nodes = [P1x83] MoName = Mmodel
Osp MIRROR        Name = mirP1Wx8P4 Nodes = [P1x84] MoName = Mmodel 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Osp OpticalRing   Name = ring21 Nodes = [P2N11 P2N12 P2N13 P2N14] MoName = RingModel21
Osp OpticalRing   Name = ring22 Nodes = [P2N21 P2N22 P2N23 P2N24] MoName = RingModel22
Osp OpticalRing   Name = ring23 Nodes = [P2N31 P2N32 P2N33 P2N34] MoName = RingModel23
Osp OpticalRing   Name = ring24 Nodes = [P2N41 P2N42 P2N43 P2N44] MoName = RingModel24
Osp OpticalRing   Name = ring25 Nodes = [P2N51 P2N52 P2N53 P2N54] MoName = RingModel25
Osp OpticalRing   Name = ring26 Nodes = [P2N61 P2N62 P2N63 P2N64] MoName = RingModel26
Osp OpticalRing   Name = ring27 Nodes = [P2N71 P2N72 P2N73 P2N74] MoName = RingModel27
Osp OpticalRing   Name = ring28 Nodes = [P2N81 P2N82 P2N83 P2N84] MoName = RingModel28

  
Osp XCOUPLER    Name=wx21 Nodes = [P2N13 P2N14 P2N21 P2x14] MoName=WXmodel  
Osp XCOUPLER    Name=wx22 Nodes = [P2N23 P2N24 P2N31 P2x24] MoName=WXmodel 
Osp XCOUPLER    Name=wx23 Nodes = [P2N33 P2N34 P2N41 P2x34] MoName=WXmodel 
Osp XCOUPLER    Name=wx24 Nodes = [P2N43 P2N44 P2N51 P2x44] MoName=WXmodel 
Osp XCOUPLER    Name=wx25 Nodes = [P2N53 P2N54 P2N61 P2x54] MoName=WXmodel 
Osp XCOUPLER    Name=wx26 Nodes = [P2N63 P2N64 P2N71 P2x64] MoName=WXmodel 
Osp XCOUPLER    Name=wx27 Nodes = [P2N73 P2N74 P2N81 P2x74] MoName=WXmodel 
Osp XCOUPLER    Name=wx28 Nodes = [P2N83 P2N84 P2x83 P2x84] MoName=WXmodel

Osp MIRROR        Name = mirP2R1P2 Nodes = [P2N12] MoName = Mmodel
Osp MIRROR        Name = mirP2R2P2 Nodes = [P2N22] MoName = Mmodel
Osp MIRROR        Name = mirP2R3P2 Nodes = [P2N32] MoName = Mmodel
Osp MIRROR        Name = mirP2R4P2 Nodes = [P2N42] MoName = Mmodel
Osp MIRROR        Name = mirP2R5P2 Nodes = [P2N52] MoName = Mmodel
Osp MIRROR        Name = mirP2R6P2 Nodes = [P2N62] MoName = Mmodel
Osp MIRROR        Name = mirP2R7P2 Nodes = [P2N72] MoName = Mmodel
Osp MIRROR        Name = mirP2R8P2 Nodes = [P2N82] MoName = Mmodel
Osp MIRROR        Name = mirP2Wx1P4 Nodes = [P2x14] MoName = Mmodel
Osp MIRROR        Name = mirP2Wx2P4 Nodes = [P2x24] MoName = Mmodel
Osp MIRROR        Name = mirP2Wx3P4 Nodes = [P2x34] MoName = Mmodel
Osp MIRROR        Name = mirP2Wx4P4 Nodes = [P2x44] MoName = Mmodel
Osp MIRROR        Name = mirP2Wx5P4 Nodes = [P2x54] MoName = Mmodel
Osp MIRROR        Name = mirP2Wx6P4 Nodes = [P2x64] MoName = Mmodel
Osp MIRROR        Name = mirP2Wx7P4 Nodes = [P2x74] MoName = Mmodel 
Osp MIRROR        Name = mirP2Wx8P3 Nodes = [P2x83] MoName = Mmodel
Osp MIRROR        Name = mirP2Wx8P4 Nodes = [P2x84] MoName = Mmodel 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Mirror Model
Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 

% Source Model
Osp Model Name = CWmodel  type = CWSOURCE NumModes = NMODES lambda=lam



% Ring related Models  START

%Ring general Model statment
Osp Model Name = RingModel11 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r11
Osp Model Name = RingModel12 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r12
Osp Model Name = RingModel13 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r13
Osp Model Name = RingModel14 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r14
Osp Model Name = RingModel15 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r15
Osp Model Name = RingModel16 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r16
Osp Model Name = RingModel17 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r17
Osp Model Name = RingModel18 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r18

Osp Model Name = RingModel21 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r21
Osp Model Name = RingModel22 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r22
Osp Model Name = RingModel23 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r23
Osp Model Name = RingModel24 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r24
Osp Model Name = RingModel25 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r25
Osp Model Name = RingModel26 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r26
Osp Model Name = RingModel27 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r27
Osp Model Name = RingModel28 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = r28


% Coupling Model
Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

% Filter model
Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non]  
  
% Ring related Models  END

% Xcouple model
Osp Model Name = WXmodel  type = XCOUPLER ElemType=WGUIDECROSS  NumModes = NMODES Through=0.98 Right=0.1 Left=0.1 Ref=0.1


% WGuide model
Osp Model Name = WGmodel  type = WaveGuide  Length=0.125   neff=[Non]  N0=Non NF=Non
%Osp Model Name = WGmodel  type = WaveGuide  Length=0.125   neff=[NonWG]  N0=NonWG NF=NonWG



.op 
.DC vcar 1520 1580 0.2
%.tran .1e-9 10e-9 nsolver=BACKE 

%.Monitor V Mag1 
%.Monitor V ring1 port=1 dir=IN
%.Monitor OptFields l5 Format=MagPhi Port=1 dir=IN  Pol=TE

% Ring1
.Monitor OptPower ring11 Port=1 dir=IN Pol=TE  P0db=1 % C2
.Monitor OptPower ring11 Port=2 dir=IN Pol=TE  P0db=1 % C3
.Monitor OptPower ring11 Port=3 dir=IN Pol=TE  P0db=1 % C4
.Monitor OptPower ring11 Port=4 dir=IN Pol=TE  P0db=1 % C5

.Monitor OptPower ring11 Port=1 dir=OUT Pol=TE  P0db=1 % C6
.Monitor OptPower ring11 Port=2 dir=OUT Pol=TE  P0db=1 % C7
.Monitor OptPower ring11 Port=3 dir=OUT Pol=TE  P0db=1 % C8
.Monitor OptPower ring11 Port=4 dir=OUT Pol=TE  P0db=1 % C9

% Ring 2
.Monitor OptPower ring12 Port=1 dir=IN Pol=TE  P0db=1 % C10
.Monitor OptPower ring12 Port=2 dir=IN Pol=TE  P0db=1 % C11
.Monitor OptPower ring12 Port=3 dir=IN Pol=TE  P0db=1 % C12
.Monitor OptPower ring12 Port=4 dir=IN Pol=TE  P0db=1 % C13

.Monitor OptPower ring12 Port=1 dir=OUT Pol=TE  P0db=1 % C14
.Monitor OptPower ring12 Port=2 dir=OUT Pol=TE  P0db=1 % C15
.Monitor OptPower ring12 Port=3 dir=OUT Pol=TE  P0db=1 % C16
.Monitor OptPower ring12 Port=4 dir=OUT Pol=TE  P0db=1 % C17

% Ring 3
.Monitor OptPower ring13 Port=1 dir=IN Pol=TE  P0db=1 % C22
.Monitor OptPower ring13 Port=2 dir=IN Pol=TE  P0db=1 % C23
.Monitor OptPower ring13 Port=3 dir=IN Pol=TE  P0db=1 % C24
.Monitor OptPower ring13 Port=4 dir=IN Pol=TE  P0db=1 % C25

.Monitor OptPower ring13 Port=1 dir=OUT Pol=TE  P0db=1 % C26
.Monitor OptPower ring13 Port=2 dir=OUT Pol=TE  P0db=1 % C27
.Monitor OptPower ring13 Port=3 dir=OUT Pol=TE  P0db=1 % C28
.Monitor OptPower ring13 Port=4 dir=OUT Pol=TE  P0db=1 % C29

% Ring 4
.Monitor OptPower ring14 Port=1 dir=IN Pol=TE  P0db=1 % C32
.Monitor OptPower ring14 Port=2 dir=IN Pol=TE  P0db=1 % C33
.Monitor OptPower ring14 Port=3 dir=IN Pol=TE  P0db=1 % C34
.Monitor OptPower ring14 Port=4 dir=IN Pol=TE  P0db=1 % C35

.Monitor OptPower ring14 Port=1 dir=OUT Pol=TE  P0db=1 % C36
.Monitor OptPower ring14 Port=2 dir=OUT Pol=TE  P0db=1 % C37
.Monitor OptPower ring14 Port=3 dir=OUT Pol=TE  P0db=1 % C38
.Monitor OptPower ring14 Port=4 dir=OUT Pol=TE  P0db=1 % C39

% Ring 5
.Monitor OptPower ring15 Port=1 dir=IN Pol=TE  P0db=1 % C42
.Monitor OptPower ring15 Port=2 dir=IN Pol=TE  P0db=1 % C43
.Monitor OptPower ring15 Port=3 dir=IN Pol=TE  P0db=1 % C44
.Monitor OptPower ring15 Port=4 dir=IN Pol=TE  P0db=1 % C45

.Monitor OptPower ring15 Port=1 dir=OUT Pol=TE  P0db=1 % C46
.Monitor OptPower ring15 Port=2 dir=OUT Pol=TE  P0db=1 % C47
.Monitor OptPower ring15 Port=3 dir=OUT Pol=TE  P0db=1 % C48
.Monitor OptPower ring15 Port=4 dir=OUT Pol=TE  P0db=1 % C49

% Ring 6
.Monitor OptPower ring16 Port=1 dir=IN Pol=TE  P0db=1 % C52
.Monitor OptPower ring16 Port=2 dir=IN Pol=TE  P0db=1 % C53
.Monitor OptPower ring16 Port=3 dir=IN Pol=TE  P0db=1 % C54
.Monitor OptPower ring16 Port=4 dir=IN Pol=TE  P0db=1 % C55

.Monitor OptPower ring16 Port=1 dir=OUT Pol=TE  P0db=1 % C56
.Monitor OptPower ring16 Port=2 dir=OUT Pol=TE  P0db=1 % C57
.Monitor OptPower ring16 Port=3 dir=OUT Pol=TE  P0db=1 % C58
.Monitor OptPower ring16 Port=4 dir=OUT Pol=TE  P0db=1 % C59

% Ring 7
.Monitor OptPower ring17 Port=1 dir=IN Pol=TE  P0db=1 % C62
.Monitor OptPower ring17 Port=2 dir=IN Pol=TE  P0db=1 % C63
.Monitor OptPower ring17 Port=3 dir=IN Pol=TE  P0db=1 % C64
.Monitor OptPower ring17 Port=4 dir=IN Pol=TE  P0db=1 % C65

.Monitor OptPower ring17 Port=1 dir=OUT Pol=TE  P0db=1 % C66
.Monitor OptPower ring17 Port=2 dir=OUT Pol=TE  P0db=1 % C67
.Monitor OptPower ring17 Port=3 dir=OUT Pol=TE  P0db=1 % C68
.Monitor OptPower ring17 Port=4 dir=OUT Pol=TE  P0db=1 % C69

% Ring 8
.Monitor OptPower ring18 Port=1 dir=IN Pol=TE  P0db=1 % C72
.Monitor OptPower ring18 Port=2 dir=IN Pol=TE  P0db=1 % C73
.Monitor OptPower ring18 Port=3 dir=IN Pol=TE  P0db=1 % C74
.Monitor OptPower ring18 Port=4 dir=IN Pol=TE  P0db=1 % C75

.Monitor OptPower ring18 Port=1 dir=OUT Pol=TE  P0db=1 % C76
.Monitor OptPower ring18 Port=2 dir=OUT Pol=TE  P0db=1 % C77
.Monitor OptPower ring18 Port=3 dir=OUT Pol=TE  P0db=1 % C78
.Monitor OptPower ring18 Port=4 dir=OUT Pol=TE  P0db=1 % C79


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ring 21
.Monitor OptPower ring21 Port=1 dir=IN Pol=TE  P0db=1 % C2
.Monitor OptPower ring21 Port=2 dir=IN Pol=TE  P0db=1 % C3
.Monitor OptPower ring21 Port=3 dir=IN Pol=TE  P0db=1 % C4
.Monitor OptPower ring21 Port=4 dir=IN Pol=TE  P0db=1 % C5

.Monitor OptPower ring21 Port=1 dir=OUT Pol=TE  P0db=1 % C6
.Monitor OptPower ring21 Port=2 dir=OUT Pol=TE  P0db=1 % C7
.Monitor OptPower ring21 Port=3 dir=OUT Pol=TE  P0db=1 % C8
.Monitor OptPower ring21 Port=4 dir=OUT Pol=TE  P0db=1 % C9

% Ring 22
.Monitor OptPower ring22 Port=1 dir=IN Pol=TE  P0db=1 % C10
.Monitor OptPower ring22 Port=2 dir=IN Pol=TE  P0db=1 % C11
.Monitor OptPower ring22 Port=3 dir=IN Pol=TE  P0db=1 % C12
.Monitor OptPower ring22 Port=4 dir=IN Pol=TE  P0db=1 % C13

.Monitor OptPower ring22 Port=1 dir=OUT Pol=TE  P0db=1 % C14
.Monitor OptPower ring22 Port=2 dir=OUT Pol=TE  P0db=1 % C15
.Monitor OptPower ring22 Port=3 dir=OUT Pol=TE  P0db=1 % C16
.Monitor OptPower ring22 Port=4 dir=OUT Pol=TE  P0db=1 % C17

% Ring 23
.Monitor OptPower ring23 Port=1 dir=IN Pol=TE  P0db=1 % C22
.Monitor OptPower ring23 Port=2 dir=IN Pol=TE  P0db=1 % C23
.Monitor OptPower ring23 Port=3 dir=IN Pol=TE  P0db=1 % C24
.Monitor OptPower ring23 Port=4 dir=IN Pol=TE  P0db=1 % C25

.Monitor OptPower ring23 Port=1 dir=OUT Pol=TE  P0db=1 % C26
.Monitor OptPower ring23 Port=2 dir=OUT Pol=TE  P0db=1 % C27
.Monitor OptPower ring23 Port=3 dir=OUT Pol=TE  P0db=1 % C28
.Monitor OptPower ring23 Port=4 dir=OUT Pol=TE  P0db=1 % C29

% Ring 24
.Monitor OptPower ring24 Port=1 dir=IN Pol=TE  P0db=1 % C32
.Monitor OptPower ring24 Port=2 dir=IN Pol=TE  P0db=1 % C33
.Monitor OptPower ring24 Port=3 dir=IN Pol=TE  P0db=1 % C34
.Monitor OptPower ring24 Port=4 dir=IN Pol=TE  P0db=1 % C35

.Monitor OptPower ring24 Port=1 dir=OUT Pol=TE  P0db=1 % C36
.Monitor OptPower ring24 Port=2 dir=OUT Pol=TE  P0db=1 % C37
.Monitor OptPower ring24 Port=3 dir=OUT Pol=TE  P0db=1 % C38
.Monitor OptPower ring24 Port=4 dir=OUT Pol=TE  P0db=1 % C39

% Ring 25
.Monitor OptPower ring25 Port=1 dir=IN Pol=TE  P0db=1 % C42
.Monitor OptPower ring25 Port=2 dir=IN Pol=TE  P0db=1 % C43
.Monitor OptPower ring25 Port=3 dir=IN Pol=TE  P0db=1 % C44
.Monitor OptPower ring25 Port=4 dir=IN Pol=TE  P0db=1 % C45

.Monitor OptPower ring25 Port=1 dir=OUT Pol=TE  P0db=1 % C46
.Monitor OptPower ring25 Port=2 dir=OUT Pol=TE  P0db=1 % C47
.Monitor OptPower ring25 Port=3 dir=OUT Pol=TE  P0db=1 % C48
.Monitor OptPower ring25 Port=4 dir=OUT Pol=TE  P0db=1 % C49

% Ring 26
.Monitor OptPower ring26 Port=1 dir=IN Pol=TE  P0db=1 % C52
.Monitor OptPower ring26 Port=2 dir=IN Pol=TE  P0db=1 % C53
.Monitor OptPower ring26 Port=3 dir=IN Pol=TE  P0db=1 % C54
.Monitor OptPower ring26 Port=4 dir=IN Pol=TE  P0db=1 % C55

.Monitor OptPower ring26 Port=1 dir=OUT Pol=TE  P0db=1 % C56
.Monitor OptPower ring26 Port=2 dir=OUT Pol=TE  P0db=1 % C57
.Monitor OptPower ring26 Port=3 dir=OUT Pol=TE  P0db=1 % C58
.Monitor OptPower ring26 Port=4 dir=OUT Pol=TE  P0db=1 % C59

% Ring 27
.Monitor OptPower ring27 Port=1 dir=IN Pol=TE  P0db=1 % C62
.Monitor OptPower ring27 Port=2 dir=IN Pol=TE  P0db=1 % C63
.Monitor OptPower ring27 Port=3 dir=IN Pol=TE  P0db=1 % C64
.Monitor OptPower ring27 Port=4 dir=IN Pol=TE  P0db=1 % C65

.Monitor OptPower ring27 Port=1 dir=OUT Pol=TE  P0db=1 % C66
.Monitor OptPower ring27 Port=2 dir=OUT Pol=TE  P0db=1 % C67
.Monitor OptPower ring27 Port=3 dir=OUT Pol=TE  P0db=1 % C68
.Monitor OptPower ring27 Port=4 dir=OUT Pol=TE  P0db=1 % C69

% Ring 28
.Monitor OptPower ring28 Port=1 dir=IN Pol=TE  P0db=1 % C72
.Monitor OptPower ring28 Port=2 dir=IN Pol=TE  P0db=1 % C73
.Monitor OptPower ring28 Port=3 dir=IN Pol=TE  P0db=1 % C74
.Monitor OptPower ring28 Port=4 dir=IN Pol=TE  P0db=1 % C75

.Monitor OptPower ring28 Port=1 dir=OUT Pol=TE  P0db=1 % C76
.Monitor OptPower ring28 Port=2 dir=OUT Pol=TE  P0db=1 % C77
.Monitor OptPower ring28 Port=3 dir=OUT Pol=TE  P0db=1 % C78
.Monitor OptPower ring28 Port=4 dir=OUT Pol=TE  P0db=1 % C79


%.Monitor OptFields ring1 Format=MagPhi Port=1 dir=IN  Pol=TE %C22,23
%.Monitor OptFields ring1 Format=MagPhi Port=2 dir=IN  Pol=TE %C24,25
%.Monitor OptFields ring1 Format=MagPhi Port=3 dir=IN  Pol=TE %C26,27
%.Monitor OptFields ring1 Format=MagPhi Port=4 dir=IN  Pol=TE %C28,29

%.Monitor OptFields ring1 Format=MagPhi Port=1 dir=OUT  Pol=TE %C30,31
%.Monitor OptFields ring1 Format=MagPhi Port=2 dir=OUT  Pol=TE %C32,33
%.Monitor OptFields ring1 Format=MagPhi Port=3 dir=OUT  Pol=TE %C34,35
%.Monitor OptFields ring1 Format=MagPhi Port=4 dir=OUT  Pol=TE %C36,37

%.Monitor OptFields wx1 Format=MagPhi Port=1 dir=IN  Pol=TE %C38,39
%.Monitor OptFields wx1 Format=MagPhi Port=2 dir=IN  Pol=TE %C40,41
%.Monitor OptFields wx1 Format=MagPhi Port=3 dir=IN  Pol=TE %C42,43
%.Monitor OptFields wx1 Format=MagPhi Port=4 dir=IN  Pol=TE %C44,45

%.Monitor OptFields wx1 Format=MagPhi Port=1 dir=OUT  Pol=TE %C46,47
%.Monitor OptFields wx1 Format=MagPhi Port=2 dir=OUT  Pol=TE %C48,49
%.Monitor OptFields wx1 Format=MagPhi Port=3 dir=OUT  Pol=TE %C50,51
%.Monitor OptFields wx1 Format=MagPhi Port=4 dir=OUT  Pol=TE %C52,53

%.Monitor OptFields wg4 Format=MagPhi Port=2 dir=IN  Pol=TE %C56,57
%.Monitor OptFields wg4 Format=MagPhi Port=2 dir=Out  Pol=TE %C60,61

.end
