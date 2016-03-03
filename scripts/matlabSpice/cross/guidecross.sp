Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param NMODES=1

* Voltage sources
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0 
v3 Mag2 0 DC = 1 
v4 Phi2 0 DC = 0 pulse ( 0 20 1e-9 10e-9 1e-9 2e-9)

Osp CWSOURCE   Name=cw1 Nodes = [Mag1 Phi1 l1] MoName = CWmodel
Osp MIRROR     Name=mir1 Nodes = [l2] MoName = Mmodel 
Osp WaveGuide  Name=wg1 Nodes = [l1 l3] MoName=WGmodel
Osp WaveGuide  Name=wg2 Nodes = [l2 l4] MoName=WGmodel

Osp XCOUPLER    Name=wx1 Nodes = [l3 l4  l5 l6] MoName=WXmodel

Osp WaveGuide  Name=wg3 Nodes = [l5 l7] MoName=WGmodel
Osp WaveGuide  Name=wg4 Nodes = [l6 l8] MoName=WGmodel

Osp MIRROR      Name=mir2 Nodes = [l7] MoName = Mmodel 
Osp MIRROR      Name=mir3 Nodes = [l8] MoName = Mmodel 

Osp CWSOURCE   Name=cw21 Nodes = [Mag1 Phi1 l22] MoName = CWmodel
Osp MIRROR     Name=mir21 Nodes = [l21] MoName = Mmodel 
Osp WaveGuide  Name=wg21 Nodes = [l21 l23] MoName=WGmodel
Osp WaveGuide  Name=wg22 Nodes = [l22 l24] MoName=WGmodel

Osp XCOUPLER    Name=wx21 Nodes = [l23 l24 l25 l26] MoName=WXmodel

Osp WaveGuide  Name=wg23 Nodes = [l25 l27] MoName=WGmodel
Osp WaveGuide  Name=wg24 Nodes = [l26 l28] MoName=WGmodel

Osp MIRROR      Name=mir22 Nodes = [l27] MoName = Mmodel 
Osp MIRROR      Name=mir23 Nodes = [l28] MoName = Mmodel 

Osp CWSOURCE   Name=cw31 Nodes = [Mag1 Phi1 l37] MoName = CWmodel
Osp MIRROR     Name=mir31 Nodes = [l32] MoName = Mmodel 
Osp WaveGuide  Name=wg31 Nodes = [l31 l33] MoName=WGmodel
Osp WaveGuide  Name=wg32 Nodes = [l32 l34] MoName=WGmodel

Osp XCOUPLER    Name=wx31 Nodes = [l33 l34 l35 l36] MoName=WXmodel

Osp WaveGuide  Name=wg33 Nodes = [l35 l37] MoName=WGmodel
Osp WaveGuide  Name=wg34 Nodes = [l36 l38] MoName=WGmodel

Osp MIRROR      Name=mir32 Nodes = [l31] MoName = Mmodel 
Osp MIRROR      Name=mir33 Nodes = [l38] MoName = Mmodel 



Osp Model Name = Mmodel   type = MIRROR    Ref = 0
Osp Model Name = CWmodel  type = CWSOURCE NumModes = NMODES
Osp Model Name = XCmodel  type = XCOUPLER  NumModes = NMODES 
Osp Model Name = WGmodel  type = WaveGuide  Length=1 neff=[1.1] N0=1.1 NF=1.1 

Osp Model Name = WXmodel  type = XCOUPLER ElemType=WGUIDECROSS  NumModes = NMODES 
+                         Through=0.8 Right=0.4 Left=0.4 Ref=0.1
* Simulation statement
*.DC
% .op
.tran .01e-9 10e-9  SOLVER=BACKE

	
* Output

.Monitor OptPower  wx1 Port=1 dir=IN Pol=TE
.Monitor OptPower  wx1 Port=2 dir=IN Pol=TE
.Monitor OptPower  wx1 Port=3 dir=OUT Pol=TE
.Monitor OptPower  wx1 Port=4 dir=OUT Pol=TE

.Monitor OptPower  wx21 Port=1 dir=IN Pol=TE
.Monitor OptPower  wx21 Port=2 dir=IN Pol=TE
.Monitor OptPower  wx21 Port=3 dir=OUT Pol=TE
.Monitor OptPower  wx21 Port=4 dir=OUT Pol=TE

.Monitor OptPower  wx31 Port=1 dir=IN Pol=TE
.Monitor OptPower  wx31 Port=2 dir=IN Pol=TE
.Monitor OptPower  wx31 Port=3 dir=OUT Pol=TE
.Monitor OptPower  wx31 Port=4 dir=OUT Pol=TE


.end
