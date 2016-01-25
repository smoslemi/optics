.subckt TwoBySwWin top left bottom right vn C=.1 radius=10 N=3 gain=1 

.param moptl='2.5*radius*N*2*3.14159265358979'

Osp OpticalRing   Name = ring1 Nodes = [top left I1 I2] MoName = RingModel1
+ LayerCNodes = [{vn 0}{vn 0}] InitialVs = [0.0]
Osp OpticalRing   Name = ring2 Nodes = [I2 I1 right bottom] MoName = RingModel2
+ LayerCNodes = [{vn 0}{vn 0}] InitialVs = [0.0]


Osp Model Name = XCmodel1  type = XCOUPLER Conjugate=0 c = C

Osp Model Name = RingFilter1 type = MultiLayerFilter FilterType=Explicit
+         N0=N NF=N TotalAtten = gain Index = [N]  
+         dNdV = [1.0] MaxOptLen=[moptl]

Osp Model Name = RingFilter2 type = MultiLayerFilter FilterType=Explicit
+         N0=N NF=N TotalAtten = gain Index = [N]  
+         dNdV = [1.0] MaxOptLen=[moptl]

Osp Model Name = RingModel1 type = OptRing XC_model = XCmodel1 RingModel=RingFilter1 Radius = radius

Osp Model Name = RingModel2 type = OptRing XC_model = XCmodel1 RingModel=RingFilter2 Radius = radius



.ends TwoBySw
