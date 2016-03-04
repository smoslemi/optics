Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param NMODES=2

* Voltage sources
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0 
v3 Mag2 0 DC = 1 
v4 Phi2 0 DC = 0 pulse ( 0 20 1e-9 10e-9 1e-9 2e-9)

Osp CWSOURCE   Name=cw1 Nodes = [Mag1 Phi1 lightin1] MoName = CWmodel
Osp CWSOURCE   Name=cw2 Nodes = [Mag2 Phi2 lightin2] MoName = CWmodel

Osp XCOUPLER    Name=xc1 Nodes = [lightin1 lightin2 lightout1 lightout2] MoName=XCmodel

Osp MIRROR      Name=mir1 Nodes = [lightout1] MoName = Mmodel 
Osp MIRROR      Name=mir2 Nodes = [lightout2] MoName = Mmodel 

Osp Model Name = Mmodel   type = MIRROR    Ref = 0
Osp Model Name = CWmodel  type = CWSOURCE NumModes = NMODES SigmaX = 1 SigmaY = 1 ModeType = BESSEL_0_MODE
+         ModeCoeff = [1.0 0.2]
Osp Model Name = XCmodel  type = XCOUPLER  NumModes = NMODES SigmaX = 1 SigmaY = 1 ModeType = BESSEL_0_MODE

* Simulation statement
*.DC
*.op
.tran .01e-9 10e-9  SOLVER=BACKE

	
* Output

* .Monitor OptFields xc1 Port=1 dir=IN Pol=TE
* .Monitor OptFields xc1 Port=2 dir=IN Pol=TE
* .Monitor OptFields xc1 Port=3 dir=OUT Pol=TE
* .Monitor OptFields xc1 Port=4 dir=OUT Pol=TE

.Monitor OptPower  xc1 Port=1 dir=IN Pol=TE
.Monitor OptPower  xc1 Port=2 dir=IN Pol=TE
.Monitor OptPower  xc1 Port=3 dir=OUT Pol=TE
.Monitor OptPower  xc1 Port=4 dir=OUT Pol=TE

.Monitor OptPhase  xc1 Port=1 dir=IN Pol=TE
.Monitor OptPhase  xc1 Port=2 dir=IN Pol=TE
.Monitor OptPhase  xc1 Port=3 dir=OUT Pol=TE
.Monitor OptPhase  xc1 Port=4 dir=OUT Pol=TE

.end
