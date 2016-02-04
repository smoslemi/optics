Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param NMODES=4

* Voltage sources
v1 Mag1 0 DC = 1 pwl 0 .1 1p .1 1.1p 1.0 2.1p 1.0 2.2p .1
v2 Phi1 0 DC = 0 

Osp CWSOURCE   Name=cw1 Nodes = [Mag1 Phi1 l1] MoName = CWmodel
Osp WaveGuide  Name=wg1 Nodes = [l1 l2] MoName=WGmodel
Osp MIRROR     Name=mir1 Nodes = [l2] MoName = Mmodel 

Osp Model Name = Mmodel   type = MIRROR    Ref = 0 
Osp Model Name = CWmodel  type = CWSOURCE NumModes = NMODES ModeCoeff = [.35 .2 .15 .10]  
+         ModeType = BESSEL_0_MODE
Osp Model Name = WGmodel  type = WaveGuide  Length=1000 N0=1.1 NF=1.1 InputType=SingleLayer
+ NumModes = NMODES  ModeType = BESSEL_0_MODE
+ neff=[1.1 1.2 1.3 1.4] 
+ N0List=[1.1 1.2 1.3 1.4] 
+ NFList=[1.1 1.2 1.1 1.4] 
+ atten=[1.0 .8 .6 .4]

* Simulation statement
*.DC
*.op
.tran .01p 10p 

	
* Output


.Monitor OptFields wg1 Format=MagPhi Port=1 dir=BOTH  Pol=TE
.Monitor OptFields wg1 Format=MagPhi Port=2 dir=BOTH  Pol=TE

.end
