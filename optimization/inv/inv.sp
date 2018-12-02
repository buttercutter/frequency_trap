*CMOS inverter https://electronics.stackexchange.com/questions/383552/measurement-of-output-impedance-of-a-cmos-inverter

.PARAM V_SUPPLY = 3.3
*.PARAM INP_FREQ = '#INP_FREQ#'
*.PARAM INP_PERIOD = '1/INP_FREQ'
*.PARAM NO_PERIODS = '4'
*.PARAM TMEAS_START = '(NO_PERIODS-1)*INP_PERIOD'
*.PARAM TMEAS_STOP = '(NO_PERIODS)*INP_PERIOD'
.PARAM AC_POINTS = 10
.PARAM AC_START = 1000
.PARAM AC_STOP = 1E6

*** *** SUPPLY VOLTAGES *** ***
VDD VDD 0 'V_SUPPLY'
VSS VSS 0 0

*** *** INPUT SIGNAL *** *** 
** VSIG IN VSS 0
** VSIG IN VSS AC 1 DC 0
** VSIG IN VSS AC 1 DC 'V_SUPPLY/2'

*** *** CIRCUIT UNDER TEST *** ***
MP OUT IN VDD VDD P1 W='#WP#' L=#LMIN#
MN OUT IN VSS VSS N1 W='#WP#/2' L=#LMIN# 

** CL OUT VSS 3p
** RIN IN VSS 1G

CIN IN VSS 1E9
Rf OUT IN 1E9
** Lf OUT IN 1E-15
** The input can be either biased with a DC source, or a DC feedback circuit. Using a DC feedback circuit (RC, inductor, whatsoever) makes only sense if there's no DC voltage source, see https://www.edaboard.com/showthread.php?377214-Noise-in-CMOS-Inverter&p=1617292&viewfull=1#post1617292  


*** *** ROUT TEST SIGNAL WITH FIXED 1A CURRENT *** ***
** this is a way to measure or plot the current source IOUT in spice using 0V voltage source
*VOUT OUT VOUT 0
*VOUT VOUT 0 '#V_OUT#'
*** *** IOUT flows into the output of the circuit under test, so negative terminal node of this current source is OUT instead of VSS
IOUT VSS OUT AC 1
*IOUT OUT VOUT AC 1


*** *** ANALYSIS *** ***
.AC dec 'AC_POINTS' 'AC_START' 'AC_STOP'
*.TRAN 'INP_PERIOD/1000' 'NO_PERIODS*INP_PERIOD'
*
*.PROBE TRAN V(IN)
*.PROBE TRAN V(OUT)
.OPTION POST PROBE ACCURATE
.include modelcard.nmos
.include modelcard.pmos

*.control
*AC dec 'AC_POINTS' 'AC_START' 'AC_STOP'
*AC dec 10 1000 1E6

*let ROUT=OUT/abs(i(VOUT))
*plot ROUT
*print ROUT > ROUT.log
*.endc

.END