v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 44300 43900 1 270 1 asic-cap-2.sym
{
T 44700 44900 5 8 0 0 90 2 1
device=CAPACITOR
T 43900 44700 5 10 1 1 180 6 1
refdes=Ctest
T 44100 44100 5 10 1 1 180 6 1
value=1n
}
C 41300 42500 1 0 0 ground.sym
N 41500 43300 41500 42800 4
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
N 41500 44200 41500 45200 4
{
T 41500 44200 5 10 0 0 0 0 1
netname=Vtest
}
T 45100 44900 9 10 1 0 0 0 17
spice-epilog=.control
op
ac lin 10000 100 2000
write frequency_trap.raw
gnuplot vtest db(vtest)
gnuplot vout db(vout)
*plot Vtest Vout
tran 0.1p 400p
plot Vtest X1.IN X1.OUT
setplot
plot i(v.xgm2.v_ip3) i(v.xgm2.v_ip4) i(v.xgm2.v_ip5) i(v.xgm2.v_ip6)
noise v(Vtest) Vtest lin 100 1 10G
setplot noise1
let noise_figure=db(inoise_spectrum)/2-db(2*sqrt(boltz*290*50))
plot noise_figure
.endc

C 41300 44200 1 270 0 voltage-1.sym
{
T 41800 44100 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 41200 44100 5 10 1 1 180 0 1
refdes=Vtest
T 41300 43600 5 10 1 1 180 0 2
value=dc 0
+ac 1
}
C 49900 42200 1 270 1 asic-cap-2.sym
{
T 50300 43200 5 8 0 0 90 2 1
device=CAPACITOR
T 50600 42900 5 10 1 1 0 6 1
refdes=CL
T 50900 42300 5 10 1 1 0 6 1
value=0.07pF
}
C 48600 41500 1 0 1 Gm2.sym
{
T 47305 41000 5 10 0 0 0 6 1
device=GM2
T 47305 40400 5 10 0 0 0 6 1
numslots=0
T 47305 40200 5 10 0 0 0 6 1
source=Gm2.sch
T 48600 41500 5 10 0 0 0 0 1
model-name=GM2
T 48600 41500 5 10 0 0 0 0 1
footprint=none
T 47605 42200 5 10 1 1 0 6 1
refdes=Gm2
}
N 50100 43100 50100 43600 4
N 50100 42200 50100 41900 4
N 49100 43600 49100 41800 4
N 45700 41800 46300 41800 4
{
T 45700 41800 5 10 0 0 0 0 1
netname=Gm2.OUT
}
C 46900 43300 1 0 0 INV1-1.sym
{
T 47700 45000 5 10 0 1 0 0 1
device=INV1
T 47700 44800 5 10 0 0 0 0 1
model-name=INV1
T 47700 44000 5 10 0 0 0 0 1
symversion=1.0
T 47700 43300 5 10 0 0 0 0 1
footprint=none
T 46900 43300 5 10 0 0 0 0 1
source=CMOS_Inverter.sch
T 47300 43900 5 10 1 1 0 0 1
refdes=X1
}
N 48600 41800 49100 41800 4
{
T 48600 41800 5 10 0 0 0 0 1
netname=Gm2.IN
}
C 48300 43400 1 0 0 current_probe.sym
{
T 48300 43900 5 10 0 0 0 0 1
device=CURRENT_PROBE
T 48300 44100 5 10 0 0 0 0 1
value=DC 0V
T 48400 43870 5 6 1 1 0 0 1
refdes=V_IP_X1
}
C 45900 42400 1 90 0 current_probe.sym
{
T 45400 42400 5 10 0 0 90 0 1
device=CURRENT_PROBE
T 45200 42400 5 10 0 0 90 0 1
value=DC 0V
T 45500 42630 5 6 1 1 180 0 1
refdes=V_IP_Gm2
}
N 45700 42400 45700 41800 4
N 48300 43600 48000 43600 4
{
T 48300 43600 5 10 0 0 0 0 1
netname=X1.OUT
}
N 48900 43600 50100 43600 4
N 45700 43000 45700 43600 4
C 49900 41600 1 0 0 ground.sym
N 44500 43600 46900 43600 4
{
T 45700 43600 5 10 0 0 0 0 1
netname=X1.IN
}
N 44500 43600 44500 43900 4
N 44500 45200 44500 44800 4
{
T 44500 45200 5 10 0 0 0 0 1
netname=Vout
}
N 41500 45200 42500 45200 4
N 43400 45200 44500 45200 4
C 42500 45100 1 0 0 resistor-1.sym
{
T 42800 45500 5 10 0 0 0 0 1
device=RESISTOR
T 42700 45400 5 10 1 1 0 0 1
refdes=Rs
T 42500 44900 5 10 1 1 0 0 1
value=1e-6
}
