Title 'CW Source check'

.include 'TwoBySw_21jan2016_1351.sp'

Osp Jobcontrol Verbosity=DEBUG  AllMon=0

.option ingold=2 DELMAX=.1e-10 ACCURATE=1 RUNLVL=6 NUMDGT=8
.OPTION DCCAP=1 TNOM=27

.param Non = 3.0 
.param gain=0.97
.param r=10
.param C = 0.3


% Voltage sources

%v1 Mag1 0 DC = 1 pulse 0 1 .04n .005n .005n .01n .08n
%v2 Mag2 0 DC = 1 pulse 0 1 .0n .005n .005n .01n .08n
v1 Mag1 0 DC = 1 
v2 Mag2 0 DC = 1 

* lambda sweep Voltage
vcar vc 0 DC=1557.81

v3 Phi1 0 DC = 0 
%VN vn 0 0.012 pulse 0 0.012 0.1n .005n .005n 1n
VN vn 0 DC = 0.012
 

Osp CWSOURCE      Name = cw1 Nodes = [Mag1 Phi1 top] MoName = CWmodel lambda=lam CarrierFreqNode=vc 
Osp CWSOURCE      Name = cw2 Nodes = [Mag2 Phi1 right] MoName = CWmodel lambda=lam CarrierFreqNode=vc

xSw top left right bottom vn TwoBySw C=C r=r Non=Non gain=gain 

Osp MIRROR        Name = mir1 Nodes = [left] MoName = Mmodel 
Osp MIRROR        Name = mir3 Nodes = [bottom] MoName = Mmodel 


Osp Model Name = Mmodel   type = MIRROR Ref = 0.0 
Osp Model Name = CWmodel  type = CWSOURCE lambda=lam

% gain is for pwr so sqrt is taken 
.param lam=1557.81

%*.op 
%.tran .001n 0.2n MaxSt=.01e-9
.DC vcar 1550 1566 .005

%.Monitor OptFields top Format=Mag dir=FWD Pol=TE  
%.Monitor OptFields left Format=Mag dir=REV Pol=TE  
%% .Monitor OptFields I1 Format=Mag dir=FWD Pol=TE  
%% .Monitor OptFields I2 Format=Mag dir=REV Pol=TE  
%.Monitor OptFields cw2 port=3 Format=Mag dir=OUT Pol=TE 
%.Monitor OptFields bottom Format=Mag dir=FWD Pol=TE 

.Monitor OptPower top dir=IN Pol=TE P0db=1
.Monitor Optpower left dir=IN Pol=TE P0db=1
.Monitor OptPower bottom dir=IN Pol=TE P0db=1

.Monitor OptPower top dir=OUT Pol=TE P0db=1
.Monitor Optpower left dir=OUT Pol=TE P0db=1
.Monitor OptPower bottom dir=OUT Pol=TE P0db=1


.end
