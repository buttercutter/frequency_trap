v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 45900 47800 1 0 0 vdc-1.sym
{
T 46600 48650 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 46600 48850 5 10 0 0 0 0 1
footprint=none
T 46600 48450 5 10 1 1 0 0 1
refdes=Vd
T 46600 48250 5 10 1 1 0 0 1
value='SUPPLY'
}
C 46100 47500 1 0 0 gnd-1.sym
N 46200 49800 46200 49000 4
{
T 46200 49800 5 10 1 1 0 0 1
netname=Vdd
}
C 42400 47900 1 0 0 spice-directive-1.sym
{
T 42500 48200 5 10 0 1 0 0 1
device=directive
T 42500 48300 5 10 1 1 0 0 1
refdes=A2
T 42400 47900 5 10 1 1 0 0 1
value=.GLOBAL Vdd Vss
}
C 42300 49000 1 0 0 spice-directive-1.sym
{
T 42400 49300 5 10 0 1 0 0 1
device=directive
T 42400 49400 5 10 1 1 0 0 1
refdes=A1
T 42400 49100 5 10 1 1 0 0 1
value=.PARAM SUPPLY=3.3v
}
T 48100 47600 9 10 1 0 0 0 7
spice-epilog=.control
ac lin 100 1 10G
let Gm=(i(v_ip_out))/Vin
plot Gm
print Gm > Transconductance_of_vccs.log
.endc

T 41500 50600 9 14 1 0 0 0 1
Measurement of Transconductance for voltage-controlled current source simulation component
C 49000 46000 1 270 0 voltage-1.sym
{
T 49500 45900 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49500 45600 5 10 1 1 0 0 1
refdes=Vin
T 49500 45200 5 10 1 1 0 0 1
value=AC 1 DC 'SUPPLY'
}
N 47100 46300 49200 46300 4
{
T 48300 46300 5 10 0 0 0 0 1
netname=Vin
}
N 49200 46300 49200 46000 4
C 49100 44300 1 0 0 gnd-1.sym
N 49200 45100 49200 44600 4
N 47500 45700 47500 45400 4
N 47500 45700 47100 45700 4
N 45300 45700 45300 45400 4
N 45300 45700 45600 45700 4
N 45100 46300 45600 46300 4
{
T 45100 46300 5 10 0 0 0 6 1
netname=G1_out
}
C 47600 45100 1 0 1 gnd-1.sym
C 45400 45100 1 0 1 gnd-1.sym
C 47100 45600 1 0 1 vccs-1.sym
{
T 46900 46650 5 10 0 0 0 6 1
device=SPICE-vccs
T 46900 46850 5 10 0 0 0 6 1
symversion=0.1
T 46500 46450 5 10 1 1 0 6 1
refdes=G1
T 46400 45550 5 10 1 0 0 5 1
value=20m
}
C 44000 44200 1 0 0 gnd-1.sym
C 44300 45000 1 90 0 asic-cap-2.sym
{
T 43900 46000 5 8 0 0 90 0 1
device=CAPACITOR
T 43700 45800 5 10 1 1 180 0 1
refdes=Cout
T 43700 45300 5 10 1 1 180 0 1
value=1n
}
N 42400 46300 44500 46300 4
N 44100 46300 44100 45900 4
{
T 44100 46300 5 10 0 0 0 0 1
netname=Cout
}
N 44100 45000 44100 44500 4
C 42500 45000 1 90 0 resistor-1.sym
{
T 42100 45300 5 10 0 0 90 0 1
device=RESISTOR
T 42200 45800 5 10 1 1 180 0 1
refdes=R1
T 41700 45300 5 10 1 1 0 0 1
value=100G
}
N 42400 46300 42400 45900 4
C 42300 44200 1 0 0 gnd-1.sym
N 42400 45000 42400 44500 4
C 44500 46100 1 0 0 current_probe.sym
{
T 44500 46600 5 10 0 0 0 0 1
device=CURRENT_PROBE
T 44700 46470 5 6 1 1 0 0 1
refdes=V_IP_out
T 44500 46800 5 10 0 0 0 0 1
value=DC 0V
}
