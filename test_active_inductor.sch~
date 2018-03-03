v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 44900 43800 1 0 0 resistor-1.sym
{
T 45200 44200 5 10 0 0 0 0 1
device=RESISTOR
T 45200 44300 5 10 1 1 180 0 1
refdes=Z1
T 45800 44300 5 10 1 1 180 0 1
value=50
}
N 44100 42500 44100 42200 4
C 43900 41900 1 0 0 ground.sym
C 43900 43400 1 270 0 voltage-1.sym
{
T 44400 43300 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 43800 43300 5 10 1 1 180 0 1
refdes=Vtest
T 43900 42800 5 10 1 1 180 0 2
value=dc 1
+ac 1
}
N 44900 43900 44100 43900 4
N 44100 43900 44100 43400 4
{
T 44100 43900 5 10 0 1 0 0 1
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
T 41700 47900 5 10 1 1 0 0 2
value=.INCLUDE CMOS_Inverter.net
.INCLUDE Gm2.net
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
C 46700 43800 1 0 0 inductor-1.sym
{
T 46900 44300 5 10 0 0 0 0 1
device=INDUCTOR
T 46700 44100 5 10 1 1 0 0 1
refdes=Ltest
T 46900 44500 5 10 0 0 0 0 1
symversion=0.1
T 47400 44100 5 10 1 1 0 0 1
value=1n
}
N 46700 43900 45800 43900 4
{
T 46700 43900 5 10 0 0 0 0 1
netname=Ltest
}
N 48400 42800 48400 43900 4
C 48200 42500 1 0 0 ground.sym
N 47600 43900 48400 43900 4
