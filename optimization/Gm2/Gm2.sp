* Asymmetric differential transconductance amplifier

.PARAM V_SUPPLY = 3.3
.PARAM V_BIAS = 1.8
*.PARAM INP_FREQ = '#INP_FREQ#'
*.PARAM INP_PERIOD = '1/INP_FREQ'
*.PARAM NO_PERIODS = '4'
*.PARAM TMEAS_START = '(NO_PERIODS-1)*INP_PERIOD'
*.PARAM TMEAS_STOP = '(NO_PERIODS)*INP_PERIOD'
.PARAM AC_POINTS = 10
.PARAM AC_START = 1000
.PARAM AC_STOP = 1E6

*** *** SUPPLY VOLTAGES *** ***
Vdd Vdd 0 'V_SUPPLY'
Vss Vss 0 0


**** Circuit ****
Vb g5 Vss 'V_BIAS'
V_IP6 s6 1 DC 0V  
V_IP5 s5 2 DC 0V  
V_IP4 Vdd s4 DC 0V  
V_IP3 Vdd s3 DC 0V  
Rs 2 1 #RS#

M6 g3 g6 s6 Vss N1  l=#LMIN# w=#WP#
M5 OUT g5 s5 Vss N1  l=#LMIN# w=#WP#         
M4 g3 g3 s4 s4 P1  l=#LMIN# w=#WP#     
M3 d5 g3 s3 s3 P1  l=#LMIN# w=#WP#        

I2 1 Vss #IS#
I1 2 Vss #IS#

**** Input Signal ****
Vin g6 Vss 'V_BIAS' 


*** *** ROUT TEST SIGNAL WITH FIXED 1A CURRENT *** ***
** this is a way to measure or plot the current source IOUT in spice using 0V voltage source
Vmeas VOUT OUT dc 0
*** *** IOUT flows into the output of the circuit under test, so negative terminal node of this current source is OUT instead of VSS
IOUT VSS VOUT AC 1


.include modelcard.nmos
.include modelcard.pmos

.control
op
options savecurrents

*AC dec 'AC_POINTS' 'AC_START' 'AC_STOP'
AC dec 10 1000 1E6

let ROUT=VOUT/i(Vmeas)
plot ROUT
print ROUT > ROUT.log
.endc

.END
