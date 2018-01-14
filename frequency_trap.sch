v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 44400 44400 1 180 0 asic-cap-2.sym
{
T 43400 44000 5 8 0 0 180 0 1
device=CAPACITOR
T 43700 44600 5 10 1 1 180 0 1
refdes=Cs
T 44400 44600 5 10 1 1 180 0 1
value=1n
}
N 42000 44200 43500 44200 4
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
ac lin 1000000 30Meg 35Meg
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
T 43100 43100 5 10 1 1 180 0 3
value=dc 1
+ac 1
+pulse 0 0.1 10n 200p 200p 10n
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
C 49000 42800 1 270 1 asic-cap-2.sym
{
T 49400 43800 5 8 0 0 90 2 1
device=CAPACITOR
T 49700 43500 5 10 1 1 0 6 1
refdes=CL
T 50000 42900 5 10 1 1 0 6 1
value=0.07pF
}
C 47700 42100 1 0 1 Gm2.sym
{
T 46405 41600 5 10 0 0 0 6 1
device=GM2
T 46405 41000 5 10 0 0 0 6 1
numslots=0
T 46405 40800 5 10 0 0 0 6 1
source=Gm2.sch
T 47700 42100 5 10 0 0 0 0 1
model-name=GM2
T 47700 42100 5 10 0 0 0 0 1
footprint=none
T 46705 42800 5 10 1 1 0 6 1
refdes=Gm2
}
N 49200 43700 49200 44200 4
N 49200 42800 49200 42500 4
N 48200 44200 48200 42400 4
N 44400 44200 46000 44200 4
{
T 44800 44200 5 10 0 0 0 0 1
netname=X1.IN
}
N 44800 42400 45400 42400 4
{
T 44800 42400 5 10 0 0 0 0 1
netname=Gm2.OUT
}
C 46000 43900 1 0 0 INV1-1.sym
{
T 46800 45600 5 10 0 1 0 0 1
device=INV1
T 46800 45400 5 10 0 0 0 0 1
model-name=INV1
T 46800 44600 5 10 0 0 0 0 1
symversion=1.0
T 46800 43900 5 10 0 0 0 0 1
footprint=none
T 46000 43900 5 10 0 0 0 0 1
source=CMOS_Inverter.sch
T 46400 44500 5 10 1 1 0 0 1
refdes=X1
}
N 47700 42400 48200 42400 4
{
T 47700 42400 5 10 0 0 0 0 1
netname=Gm2.IN
}
C 47400 44000 1 0 0 current_probe.sym
{
T 47400 44500 5 10 0 0 0 0 1
device=CURRENT_PROBE
T 47400 44700 5 10 0 0 0 0 1
value=DC 0V
T 47500 44470 5 6 1 1 0 0 1
refdes=V_IP_X1
}
C 45000 43000 1 90 0 current_probe.sym
{
T 44500 43000 5 10 0 0 90 0 1
device=CURRENT_PROBE
T 44300 43000 5 10 0 0 90 0 1
value=DC 0V
T 44600 43230 5 6 1 1 180 0 1
refdes=V_IP_Gm2
}
N 44800 43000 44800 42400 4
N 47400 44200 47100 44200 4
{
T 47400 44200 5 10 0 0 0 0 1
netname=X1.OUT
}
N 48000 44200 49200 44200 4
N 44800 43600 44800 44200 4
C 49000 42200 1 0 0 ground.sym
