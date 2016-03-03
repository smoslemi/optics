Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param NMODES=1

* Voltage sources
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0 
%v3 Mag2 0 DC = 1 
%v4 Phi2 0 DC = 0 pulse ( 0 20 1e-9 10e-9 1e-9 2e-9)

Osp CWSOURCE   Name=cw1 Nodes = [Mag1 Phi1 l3] MoName = CWmodel lambda= 1000
Osp XCOUPLER    Name=wx1 Nodes = [l3 l4  l5 l6] MoName=WXmodel
 
%Osp WaveGuide  Name=wg1 Nodes = [l1 l3] MoName=WGmodel
%Osp WaveGuide  Name=wg2 Nodes = [l2 l4] MoName=WGmodel
%Osp WaveGuide  Name=wg3 Nodes = [l5 l7] MoName=WGmodel
%Osp WaveGuide  Name=wg4 Nodes = [l6 l8] MoName=WGmodel

Osp MIRROR      Name=mir1 Nodes = [l4] MoName = Mmodel
Osp MIRROR      Name=mir2 Nodes = [l5] MoName = Mmodel 
Osp MIRROR      Name=mir3 Nodes = [l6] MoName = Mmodel 




Osp Model Name = Mmodel   type = MIRROR    Ref = 0
Osp Model Name = CWmodel  type = CWSOURCE NumModes = NMODES
Osp Model Name = XCmodel  type = XCOUPLER  NumModes = NMODES 
Osp Model Name = WGmodel  type = WaveGuide  Length=1 neff=[1.1] N0=1.1 NF=1.1 

Osp Model Name = WXmodel  type = XCOUPLER ElemType=WGUIDECROSS  NumModes = NMODES 
+                         Through=0.8 Right=0.5 Left=0.3 Ref=0.1
* Simulation statement
*.DC
 .op
.tran .01e-9 10e-9  SOLVER=BACKE

	
* Output

.Monitor OptPower  wx1 Port=1 dir=IN Pol=TE
.Monitor OptPower  wx1 Port=2 dir=IN Pol=TE
.Monitor OptPower  wx1 Port=3 dir=OUT Pol=TE
.Monitor OptPower  wx1 Port=4 dir=OUT Pol=TE




.end
