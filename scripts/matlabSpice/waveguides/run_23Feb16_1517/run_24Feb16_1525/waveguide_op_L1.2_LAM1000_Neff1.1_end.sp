Title "CW Source check "

Osp Jobcontrol Verbosity=DEBUG2

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param NMODES=1

* Voltage sources
v1 Mag1 0 DC = 1 
v2 Phi1 0 DC = 0 

Osp CWSOURCE   Name=cw1 Nodes = [Mag1 Phi1 l1] MoName = CWmodel lambda = 1.000000e+03
Osp WaveGuide  Name=wg1 Nodes = [l1 l2] MoName=WGmodel
Osp MIRROR     Name=mir1 Nodes = [l2] MoName = Mmodel 

Osp Model Name = Mmodel   type = MIRROR    Ref = 0
Osp Model Name = CWmodel  type = CWSOURCE 
Osp Model Name = WGmodel  type = WaveGuide  Length=1.200000e+00  IncludeTimeDelay=1  neff=[1.100000e+00]  N0=1.1 NF=1.1

% IncludeTimeDelay=1 
%.tran .0001e-9 10e-9 nsolver=BACKE nmaxst=.05n nminst=.05n
.op
	
.Monitor OptFields wg1 Format=MagPhi Port=1 dir=IN  Pol=TE
.Monitor OptFields wg1 Format=MagPhi Port=2 dir=OUT Pol=TE
%.Monitor OptFields wg2 Format=MagPhi Port=2 dir=OUT Pol=TE
.end
