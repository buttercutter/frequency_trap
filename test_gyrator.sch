v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 44600 44000 1 0 0 resistor-1.sym
{
T 44900 44400 5 10 0 0 0 0 1
device=RESISTOR
T 44900 44500 5 10 1 1 180 0 1
refdes=R1
T 45500 44500 5 10 1 1 180 0 1
value=50
}
N 43800 42700 43800 42400 4
C 43600 42100 1 0 0 ground.sym
C 43600 43600 1 270 0 voltage-1.sym
{
T 44100 43500 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 43500 43500 5 10 1 1 180 0 1
refdes=Vtest
T 43600 43000 5 10 1 1 180 0 2
value=dc 1
+ac 1
}
N 44600 44100 43800 44100 4
N 43800 44100 43800 43600 4
{
T 43800 44100 5 10 0 1 0 0 1
netname=Vtest
}
C 44100 47600 1 0 0 spice-directive-1.sym
{
T 44100 47700 5 10 1 1 0 0 1
value=.INCLUDE gyrator.net
T 44200 47900 5 10 0 1 0 0 1
device=directive
T 44200 48000 5 10 1 1 0 0 1
refdes=A1
}
T 46100 49600 9 16 1 0 0 0 1
S11 measurement of gyrator
T 47800 45200 9 10 1 0 0 0 20
spice-epilog=.control
set noaskquit
AC LIN 1000 100Meg 200Meg
run
let S11=(2*v(Ltest)/v(Vtest)-1)
settype s-param S11

let S11db=db(S11)
settype decibel S11db

let P11=180*ph(s11)/pi
settype phase P11

plot s11db ylimit -0.5 0
plot P11

print S11 > S11_gyrator.log
*plot smithgrid S11
*wrs2p s3046.s2p $ write touchstone vers. 1 file s3046.s2p
.endc
N 46400 44100 45500 44100 4
{
T 46400 44100 5 10 0 0 0 0 1
netname=Ltest
}
C 46400 43800 1 0 0 gyrator.sym
{
T 45595 43500 5 10 1 0 0 0 1
device=GYRATOR
T 45595 43300 5 10 1 0 0 0 1
description=Active_Inductor_using_gyrator_VCCS_simulation_elements
T 45595 43100 5 10 1 0 0 0 1
refdes=GYRATOR
T 45595 42900 5 10 1 0 0 0 1
numslots=0
T 45600 42700 5 10 1 0 0 0 1
source=gyrator.sch
T 46400 43800 5 10 0 0 0 0 1
model-name=GYRATOR
}
