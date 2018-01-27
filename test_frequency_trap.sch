v 20130925 2
C 40000 40000 0 0 0 title-B.sym
C 45300 44100 1 90 0 asic-cap-2.sym
{
T 44900 45100 5 8 0 0 90 0 1
device=CAPACITOR
T 45700 44900 5 10 1 1 180 0 1
refdes=Ctest
T 45500 44300 5 10 1 1 180 0 1
value=1n
}
C 41900 42700 1 0 0 ground.sym
N 42100 43500 42100 43000 4
N 42100 44400 42100 45400 4
{
T 42100 44400 5 10 0 0 0 0 1
netname=Vtest
}
C 41900 44400 1 270 0 voltage-1.sym
{
T 42400 44300 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 41800 44300 5 10 1 1 180 0 1
refdes=Vtest
T 41900 43800 5 10 1 1 180 0 2
value=dc 0
+ac 1
}
N 45100 43800 45100 44100 4
N 45100 45400 45100 45000 4
{
T 45100 45400 5 10 0 0 0 0 1
netname=Vout
}
N 42100 45400 43100 45400 4
N 44000 45400 45100 45400 4
C 43100 45300 1 0 0 resistor-1.sym
{
T 43400 45700 5 10 0 0 0 0 1
device=RESISTOR
T 43300 45600 5 10 1 1 0 0 1
refdes=Rs
T 43100 45100 5 10 1 1 0 0 1
value=1e99 ac=1e-6
}
C 45000 43800 1 270 0 inductor-1.sym
{
T 45500 43600 5 10 0 0 270 0 1
device=INDUCTOR
T 45300 43400 5 10 1 1 0 0 1
refdes=Ltest
T 45700 43600 5 10 0 0 270 0 1
symversion=0.1
T 45500 43000 5 10 1 1 0 0 1
value=1
}
C 44900 42100 1 0 0 ground.sym
N 45100 42900 45100 42400 4
T 47000 45900 9 10 1 0 0 0 11
spice-epilog=.control
op
ac lin 100000 5032.92 5032.93
write frequency_trap.raw
gnuplot vtest db(vtest)
gnuplot vout db(vout)
*plot Vtest Vout
tran 0.1p 400p
plot vtest vout
.endc

