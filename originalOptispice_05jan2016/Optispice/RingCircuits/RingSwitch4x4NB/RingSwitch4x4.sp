Title 'CW Source check'

.include 'TwoBySw.sp'

Osp Jobcontrol Verbosity=DEBUG  AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param PI=3.14159265358979
.param FourPI='4*3.1415926'
.param PIover2='3.1415926/2.0'

.param Non = 3.0 
.param Noff = 3.012  
.param gain=0.97
.param r=10
.param C = 0.3
.param moptl='2.5*r*Non*2*PI'
.param Von = 0
.param Voff = 0.012

% Voltage sources
v1 Mag1 0 DC = 1  pulse 0 1 .04n .005n .005n .01n .08n

v3 Phi1 0 DC = 0 
VN1 vnTL 0 Voff
VN2 vnTR 0 Von 
VN3 vnBL 0 Voff 
VN4 vnBR 0 Von

Osp CWSOURCE      Name = cw1 Nodes = [Mag1 Phi1 Left1] MoName = CWmodel lambda=lam 

xSwTL top1 left1  L T vnTL TwoBySw C=C r=r Non=Non gain=gain 
xSwTR top2 right1 R T vnTR TwoBySw C=C r=r Non=Non gain=gain 
xSwBL bot1 left2  L B vnBL TwoBySw C=C r=r Non=Non gain=gain 
xSwBR bot2 right2 R B vnBR TwoBySw C=C r=r Non=Non gain=gain 

Osp MIRROR        Name = mtop1 Nodes = [top1] MoName = Mmodel 
Osp MIRROR        Name = mtop2 Nodes = [top2] MoName = Mmodel 

Osp MIRROR        Name = mleft2 Nodes = [left2] MoName = Mmodel 

Osp MIRROR        Name = mbot1 Nodes = [bot1] MoName = Mmodel 
Osp MIRROR        Name = mbot2 Nodes = [bot2] MoName = Mmodel 

Osp MIRROR        Name = mright1 Nodes = [right1] MoName = Mmodel 
Osp MIRROR        Name = mright2 Nodes = [right2] MoName = Mmodel 


Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
Osp Model Name = CWmodel  type = CWSOURCE lambda=lam

% gain is for pwr so sqrt is taken 
.param lam=1557.81
% .op 

.tran .001n 0.2n MaxSt=.01e-9

.Monitor OptFields left1 Format=Mag dir=BOTH Pol=TE  
.Monitor OptFields left2 Format=Mag dir=BOTH Pol=TE  

.Monitor OptFields top1 Format=Mag dir=BOTH Pol=TE  
.Monitor OptFields top2 Format=Mag dir=BOTH Pol=TE  

.Monitor OptFields bot1 Format=Mag dir=BOTH Pol=TE  
.Monitor OptFields bot2 Format=Mag dir=BOTH Pol=TE  

.Monitor OptFields right1 Format=Mag dir=BOTH Pol=TE  
.Monitor OptFields right2 Format=Mag dir=BOTH Pol=TE  

.Monitor V Mag1

.end
