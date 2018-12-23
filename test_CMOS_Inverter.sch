v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 48500 47800 1 0 0 vdc-1.sym
{
T 49200 48650 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 49200 48850 5 10 0 0 0 0 1
footprint=none
T 49200 48450 5 10 1 1 0 0 1
refdes=Vd
T 49200 48250 5 10 1 1 0 0 1
value='SUPPLY'
}
C 48700 47500 1 0 0 gnd-1.sym
C 50700 47800 1 0 0 vdc-1.sym
{
T 51400 48650 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 51400 48850 5 10 0 0 0 0 1
footprint=none
T 51400 48950 5 10 1 1 0 0 1
refdes=Vs
T 51400 48750 5 10 1 1 0 0 1
value=0V
}
C 50900 47500 1 0 0 gnd-1.sym
N 51000 49300 51000 49000 4
{
T 51000 49300 5 10 1 1 0 0 1
netname=Vss
}
N 48800 49400 48800 49000 4
{
T 48800 49400 5 10 1 1 0 0 1
netname=Vdd
}
C 45600 47900 1 0 0 spice-directive-1.sym
{
T 45700 48200 5 10 0 1 0 0 1
device=directive
T 45700 48300 5 10 1 1 0 0 1
refdes=A2
T 45600 47900 5 10 1 1 0 0 1
value=.GLOBAL Vdd Vss
}
C 45600 49000 1 0 0 spice-directive-1.sym
{
T 45700 49300 5 10 0 1 0 0 1
device=directive
T 45700 49400 5 10 1 1 0 0 1
refdes=A1
T 45600 49000 5 10 1 1 0 0 1
value=.INCLUDE CMOS_Inverter.net
}
C 42300 49000 1 0 0 spice-directive-1.sym
{
T 42400 49300 5 10 0 1 0 0 1
device=directive
T 42400 49400 5 10 1 1 0 0 1
refdes=A5
T 42400 49100 5 10 1 1 0 0 1
value=.PARAM SUPPLY=3.3v
}
C 42300 47900 1 0 0 spice-directive-1.sym
{
T 42400 48200 5 10 0 1 0 0 1
device=directive
T 42400 48300 5 10 1 1 0 0 1
refdes=A4
T 42300 47300 5 10 1 1 0 0 3
value=.options TEMP=25
.MODEL n1 NMOS
.MODEL p1 PMOS
}
T 40900 44700 9 10 1 0 0 0 11
spice-epilog=.control
save all @@m.x1.m1[gm]
save all @@m.x1.m4[gm]
ac lin 100 1 10G
print @@m.x1.m1[gm]
print @@m.x1.m4[gm]
let Gm=(i(v_ip_out))/Vin
plot Gm
print Gm > Transconductance_of_CMOS_inverter.log
.endc

T 42700 50100 9 14 1 0 0 0 1
Measurement of Transconductance for X1 (CMOS Inverter) circuit block
N 48900 46000 49600 46000 4
C 50700 46300 1 180 0 INV1-1.sym
{
T 50100 45600 5 10 1 1 180 0 1
refdes=X1
T 49900 44600 5 10 0 1 180 0 1
device=INV1
T 49900 44800 5 10 0 0 180 0 1
model-name=INV1
T 49900 45600 5 10 0 0 180 0 1
symversion=1.0
T 49900 46300 5 10 0 0 180 0 1
footprint=none
T 50700 46300 5 10 0 0 0 0 1
source=CMOS_Inverter.sch
}
C 47800 44300 1 0 0 gnd-1.sym
C 48100 44800 1 90 0 asic-cap-2.sym
{
T 47700 45800 5 8 0 0 90 0 1
device=CAPACITOR
T 47500 45600 5 10 1 1 180 0 1
refdes=Cout
T 47500 45100 5 10 1 1 180 0 1
value=1n
}
N 46200 46000 48300 46000 4
N 47900 46000 47900 45700 4
{
T 47900 46000 5 10 0 0 0 0 1
netname=Cout
}
N 47900 44800 47900 44600 4
C 46300 44800 1 90 0 resistor-1.sym
{
T 45900 45100 5 10 0 0 90 0 1
device=RESISTOR
T 46000 45600 5 10 1 1 180 0 1
refdes=R1
T 45500 45100 5 10 1 1 0 0 1
value=100G
}
N 46200 46000 46200 45700 4
C 46100 44300 1 0 0 gnd-1.sym
N 46200 44800 46200 44600 4
C 48300 45800 1 0 0 current_probe.sym
{
T 48300 46300 5 10 0 0 0 0 1
device=CURRENT_PROBE
T 48300 46500 5 10 0 0 0 0 1
value=DC 0V
T 48500 46170 5 6 1 1 0 0 1
refdes=V_IP_out
}
N 50700 46000 51300 46000 4
{
T 50700 46000 5 10 0 0 0 0 1
netname=Vin
}
C 51100 45700 1 270 0 voltage-1.sym
{
T 51600 45600 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 51500 45400 5 10 1 1 0 0 1
refdes=Vin
T 51600 45000 5 10 1 1 0 0 1
value=DC 'SUPPLY/2' AC 1
}
C 51200 44300 1 0 0 gnd-1.sym
N 51300 44800 51300 44600 4
N 51300 46000 51300 45700 4
