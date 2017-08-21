v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 44200 45000 1 90 0 asic-cap-2.sym
{
T 43800 46000 5 8 0 0 90 0 1
device=CAPACITOR
T 43500 45700 5 10 1 1 0 0 1
refdes=Cs
T 43500 45200 5 10 1 1 0 0 1
value=1n
}
C 42700 44600 1 90 0 voltage-1.sym
{
T 42200 44700 5 10 0 0 90 0 1
device=VOLTAGE_SOURCE
T 41900 45200 5 10 1 1 0 0 1
refdes=Vtest
T 40900 44800 5 10 1 1 0 0 3
value=dc 0
+ac 1
+sin 0 1 10G
}
N 42500 46300 44000 46300 4
{
T 42500 46300 5 10 0 0 0 0 1
netname=Vtest
}
N 44000 45900 44000 46300 4
C 42300 43800 1 0 0 ground.sym
N 42500 44600 42500 44100 4
C 48200 43100 1 270 1 asic-cap-2.sym
{
T 48600 44100 5 8 0 0 90 2 1
device=CAPACITOR
T 48900 43800 5 10 1 1 0 6 1
refdes=CL
T 48900 43300 5 10 1 1 0 6 1
value=1n
}
C 46900 42400 1 0 1 Gm2.sym
{
T 45605 41900 5 10 0 0 0 6 1
device=GM2
T 45905 43100 5 10 1 1 0 6 1
refdes=U2
T 45605 41300 5 10 0 0 0 6 1
numslots=0
T 45605 41100 5 10 0 0 0 6 1
source=Gm2.sch
T 46900 42400 5 10 0 0 0 0 1
model-name=GM2
T 46900 42400 5 10 0 0 0 0 1
footprint=none
}
C 48200 42500 1 0 0 ground.sym
N 48400 44000 48400 44500 4
N 46300 44500 48400 44500 4
N 48400 43100 48400 42800 4
N 47400 44500 47400 42700 4
N 44000 42700 44000 45000 4
N 44000 44500 45200 44500 4
N 44000 42700 44600 42700 4
{
T 44000 42700 5 10 0 0 0 0 1
netname=OUT
}
C 45200 44200 1 0 0 INV1-1.sym
{
T 45600 44800 5 10 1 1 0 0 1
refdes=X1
T 46000 45900 5 10 0 1 0 0 1
device=INV1
T 46000 45700 5 10 0 0 0 0 1
model-name=INV1
T 46000 44900 5 10 0 0 0 0 1
symversion=1.0
T 46000 44200 5 10 0 0 0 0 1
footprint=none
T 45200 44200 5 10 0 0 0 0 1
source=CMOS_Inverter.sch
}
N 46900 42700 47400 42700 4
{
T 46900 42700 5 10 0 0 0 0 1
netname=IN
}
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
T 45200 49800 5 10 1 1 0 0 2
value=.INCLUDE CMOS_Inverter.net
.INCLUDE Gm2.net
}
C 42000 49700 1 0 0 spice-directive-1.sym
{
T 42100 50000 5 10 0 1 0 0 1
device=directive
T 42100 50100 5 10 1 1 0 0 1
refdes=A5
T 42100 49800 5 10 1 1 0 0 1
value=.PARAM SUPPLY=3v
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
N 42500 45500 42500 46300 4
T 45100 45300 9 10 1 0 0 0 11
spice-epilog=.control
ac lin 100 1 10G
plot db(Vtest)
tran 0.1p 400p
plot Vtest IN OUT
noise v(Vtest) Vtest lin 100 1 10G
setplot noise1
let noise_figure=db(inoise_spectrum)/2-db(2*sqrt(boltz*290*50))
plot noise_figure
.endc

