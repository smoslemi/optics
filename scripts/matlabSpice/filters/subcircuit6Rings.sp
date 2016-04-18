
% circuit 2, 6 rings  (3 rings in series, 3 rings in parallel) using a sub circuit

Osp CWSOURCE  Name = Rcw2 Nodes = [Mag2 Phi2 inX] MoName = CWmodel lambda = lam CarrierFreqNode=vc

X1 inX drX thX adX X6rings

Osp MIRROR        Name = dr Nodes = [drX] MoName = Mmodel
Osp MIRROR        Name = th Nodes = [thX] MoName = Mmodel
Osp MIRROR        Name = ad Nodes = [adX] MoName = Mmodel



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
Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Eplicit
+         N0=Non NF=Non TotalAtten = gain Index = [Non] 

.param r1='10.35'
.param gain='1'
.param C = '0.65'
.ends X6rings
