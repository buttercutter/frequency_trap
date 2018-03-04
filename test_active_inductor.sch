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
C 41800 46900 1 0 0 spice-directive-1.sym
{
T 41900 47200 5 10 0 1 0 0 1
device=directive
T 41900 47300 5 10 1 1 0 0 1
refdes=A2
T 41800 46900 5 10 1 1 0 0 1
value=.GLOBAL Vdd Vss
}
C 45200 48100 1 0 0 spice-directive-1.sym
{
T 45300 48400 5 10 0 1 0 0 1
device=directive
T 45300 48500 5 10 1 1 0 0 1
refdes=A5
T 45300 48200 5 10 1 1 0 0 1
value=.PARAM SUPPLY=3.3v
}
C 45200 47000 1 0 0 spice-directive-1.sym
{
T 45300 47300 5 10 0 1 0 0 1
device=directive
T 45300 47400 5 10 1 1 0 0 1
refdes=A4
T 45200 46600 5 10 1 1 0 0 3
value=.options TEMP=25
.MODEL n1 NMOS
.MODEL p1 PMOS
}
C 41800 48100 1 0 0 spice-directive-1.sym
{
T 41800 48200 5 10 1 1 0 0 1
value=.INCLUDE active_inductor.net
T 41900 48400 5 10 0 1 0 0 1
device=directive
T 41900 48500 5 10 1 1 0 0 1
refdes=A1
}
C 51800 46700 1 0 0 vdc-1.sym
{
T 52500 47550 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 52500 47750 5 10 0 0 0 0 1
footprint=none
T 52500 47350 5 10 1 1 0 0 1
refdes=Vd
T 52500 47150 5 10 1 1 0 0 1
value='SUPPLY'
}
C 52000 46400 1 0 0 gnd-1.sym
C 54000 46700 1 0 0 vdc-1.sym
{
T 54700 47550 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 54700 47750 5 10 0 0 0 0 1
footprint=none
T 54700 47850 5 10 1 1 0 0 1
refdes=Vs
T 54700 47650 5 10 1 1 0 0 1
value=0V
}
C 54200 46400 1 0 0 gnd-1.sym
N 54300 48700 54300 47900 4
{
T 54300 48700 5 10 1 1 0 0 1
netname=Vss
}
N 52100 48700 52100 47900 4
{
T 52100 48700 5 10 1 1 0 0 1
netname=Vdd
}
T 46100 49600 9 16 1 0 0 0 1
S11 measurement of active inductor
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

print S11 > S11.log
*plot smithgrid S11
*wrs2p s3046.s2p $ write touchstone vers. 1 file s3046.s2p
.endc
N 46400 44100 45500 44100 4
{
T 46400 44100 5 10 0 0 0 0 1
netname=Ltest
}
N 50000 43000 50000 44100 4
C 49800 42700 1 0 0 ground.sym
N 49200 44100 50000 44100 4
C 46400 43800 1 0 0 active_inductor.sym
{
T 46095 43400 5 10 1 0 0 0 1
device=ACTIVE_INDUCTOR
T 46095 43200 5 10 1 0 0 0 1
description=Active_Inductor_using_gyrator
T 46095 43000 5 10 1 0 0 0 1
refdes=ACTIVE_INDUCTOR
T 46095 42800 5 10 1 0 0 0 1
numslots=0
T 46100 42600 5 10 1 0 0 0 1
source=active_inductor.sch
T 46400 43800 5 10 0 0 0 0 1
model-name=ACTIVE_INDUCTOR
}
