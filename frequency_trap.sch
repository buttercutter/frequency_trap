v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 43600 44400 1 180 0 asic-cap-2.sym
{
T 42600 44000 5 8 0 0 180 0 1
device=CAPACITOR
T 42900 44600 5 10 1 1 180 0 1
refdes=Cs
T 43600 44600 5 10 1 1 180 0 1
value=1n
}
N 42000 44200 42700 44200 4
{
T 42000 44200 5 10 0 0 0 0 1
netname=Vtest
}
C 41800 42000 1 0 0 ground.sym
N 42000 42800 42000 42300 4
C 48900 47800 1 0 0 vdc-1.sym
{
T 49600 48650 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 49600 48850 5 10 0 0 0 0 1
footprint=none
T 49600 48450 5 10 1 1 0 0 1
refdes=Vd
T 49600 48250 5 10 1 1 0 0 1
value='SUPPLY'
}
C 49100 47500 1 0 0 gnd-1.sym
C 51100 47800 1 0 0 vdc-1.sym
{
T 51800 48650 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 51800 48850 5 10 0 0 0 0 1
footprint=none
T 51800 48950 5 10 1 1 0 0 1
refdes=Vs
T 51800 48750 5 10 1 1 0 0 1
value=0V
}
C 51300 47500 1 0 0 gnd-1.sym
N 51400 49800 51400 49000 4
{
T 51400 49800 5 10 1 1 0 0 1
netname=Vss
}
N 49200 49800 49200 49000 4
{
T 49200 49800 5 10 1 1 0 0 1
netname=Vdd
}
C 45300 48600 1 0 0 spice-directive-1.sym
{
T 45400 48900 5 10 0 1 0 0 1
device=directive
T 45400 49000 5 10 1 1 0 0 1
refdes=A2
T 45300 48600 5 10 1 1 0 0 1
value=.GLOBAL Vdd Vss
}
C 45200 50000 1 0 0 spice-directive-1.sym
{
T 45300 50300 5 10 0 1 0 0 1
device=directive
T 45300 50400 5 10 1 1 0 0 1
refdes=A1
T 45100 49700 5 10 1 1 0 0 3
value=.INCLUDE CMOS_Inverter.net
.INCLUDE Gm2.net
.INCLUDE active_inductor.net
}
C 42000 49700 1 0 0 spice-directive-1.sym
{
T 42100 50000 5 10 0 1 0 0 1
device=directive
T 42100 50100 5 10 1 1 0 0 1
refdes=A5
T 42100 49800 5 10 1 1 0 0 1
value=.PARAM SUPPLY=3.3v
}
C 42000 48600 1 0 0 spice-directive-1.sym
{
T 42100 48900 5 10 0 1 0 0 1
device=directive
T 42100 49000 5 10 1 1 0 0 1
refdes=A4
T 42000 48000 5 10 1 1 0 0 3
value=.options TEMP=25
.MODEL n1 NMOS
.MODEL p1 PMOS
}
T 40500 40800 9 10 1 0 0 0 1
https://www.reddit.com/r/chipdesign/comments/6j8834/gyrator_implementation_of_chip_inductor/
N 42000 43700 42000 44200 4
T 45100 45300 9 10 1 0 0 0 14
spice-epilog=.control
op
ac lin 1000000 5000 5100
plot Vtest
tran 0.1p 400p
plot Vtest X1.IN X1.OUT
setplot
plot i(v.xgm2.v_ip3) i(v.xgm2.v_ip4) i(v.xgm2.v_ip5) i(v.xgm2.v_ip6)
noise v(Vtest) Vtest lin 100 1 10G
setplot noise1
let noise_figure=db(inoise_spectrum)/2-db(2*sqrt(boltz*290*50))
plot noise_figure
.endc

C 41800 43700 1 270 0 voltage-1.sym
{
T 42300 43600 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 41700 43600 5 10 1 1 180 0 1
refdes=Vtest
T 41800 43100 5 10 1 1 180 0 2
value=dc 0
+ac 1
}
N 51900 45000 52400 45000 4
N 55200 45000 56100 45000 4
N 56100 44500 56100 45000 4
{
T 56000 44500 5 10 1 1 180 0 1
netname=Vss
}
C 52400 44700 1 0 0 active_inductor.sym
{
T 52400 44700 5 10 0 0 0 0 1
source=active_inductor.sch
T 52400 44700 5 10 0 0 0 0 1
model-name=active_inductor
T 53095 46100 5 10 1 0 0 0 1
device=AC_INDUCTOR
T 53095 45900 5 10 1 0 0 0 1
description=Active_Inductor_using_gyrator
T 53095 45700 5 10 1 0 0 0 1
refdes=U1
T 53095 45500 5 10 1 0 0 0 1
numslots=0
}
N 51900 44500 51900 45000 4
{
T 51800 44500 5 10 1 1 180 0 1
netname=Vss
}
C 55800 41800 1 270 1 asic-cap-2.sym
{
T 56200 42800 5 8 0 0 90 2 1
device=CAPACITOR
T 56500 42500 5 10 1 1 0 6 1
refdes=CL
T 56800 41900 5 10 1 1 0 6 1
value=0.07pF
}
C 54500 41100 1 0 1 Gm2.sym
{
T 53205 40600 5 10 0 0 0 6 1
device=GM2
T 53205 40000 5 10 0 0 0 6 1
numslots=0
T 53205 39800 5 10 0 0 0 6 1
source=Gm2.sch
T 54500 41100 5 10 0 0 0 0 1
model-name=GM2
T 54500 41100 5 10 0 0 0 0 1
footprint=none
T 53505 41800 5 10 1 1 0 6 1
refdes=Gm2
}
N 56000 42700 56000 43200 4
N 56000 41800 56000 41500 4
N 55000 43200 55000 41400 4
N 51600 41400 52200 41400 4
{
T 51600 41400 5 10 0 0 0 0 1
netname=Gm2.OUT
}
C 52800 42900 1 0 0 INV1-1.sym
{
T 53600 44600 5 10 0 1 0 0 1
device=INV1
T 53600 44400 5 10 0 0 0 0 1
model-name=INV1
T 53600 43600 5 10 0 0 0 0 1
symversion=1.0
T 53600 42900 5 10 0 0 0 0 1
footprint=none
T 52800 42900 5 10 0 0 0 0 1
source=CMOS_Inverter.sch
T 53200 43500 5 10 1 1 0 0 1
refdes=X1
}
N 54500 41400 55000 41400 4
{
T 54500 41400 5 10 0 0 0 0 1
netname=Gm2.IN
}
C 54200 43000 1 0 0 current_probe.sym
{
T 54200 43500 5 10 0 0 0 0 1
device=CURRENT_PROBE
T 54200 43700 5 10 0 0 0 0 1
value=DC 0V
T 54300 43470 5 6 1 1 0 0 1
refdes=V_IP_X1
}
C 51800 42000 1 90 0 current_probe.sym
{
T 51300 42000 5 10 0 0 90 0 1
device=CURRENT_PROBE
T 51100 42000 5 10 0 0 90 0 1
value=DC 0V
T 51400 42230 5 6 1 1 180 0 1
refdes=V_IP_Gm2
}
N 51600 42000 51600 41400 4
N 54200 43200 53900 43200 4
{
T 54200 43200 5 10 0 0 0 0 1
netname=X1.OUT
}
N 54800 43200 56000 43200 4
N 51600 42600 51600 43200 4
C 55800 41200 1 0 0 ground.sym
N 50400 43200 52800 43200 4
{
T 51600 43200 5 10 0 0 0 0 1
netname=X1.IN
}
C 44400 44100 1 0 0 inductor-1.sym
{
T 44600 44600 5 10 0 0 0 0 1
device=INDUCTOR
T 44600 44400 5 10 1 1 0 0 1
refdes=Ltest
T 44600 44800 5 10 0 0 0 0 1
symversion=0.1
T 44500 43900 5 10 1 1 0 0 1
value=1
}
C 45800 42800 1 0 0 ground.sym
N 46000 43100 46000 44200 4
N 45300 44200 46000 44200 4
N 44400 44200 43600 44200 4
C 50200 41800 1 0 0 ground.sym
N 50400 42100 50400 43200 4
