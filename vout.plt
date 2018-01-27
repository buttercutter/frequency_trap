set terminal X11 noenhanced
set title "* gnetlist -l ../.. -g spice-noqsi -o frequency_trap.net frequency_trap.sch"
set xlabel "Hz"
set ylabel "V"
set grid
unset logscale x 
set xrange [1.380000e+02:2.000000e+02]
unset logscale y 
set yrange [-2.048232e-13:-9.026105e-14]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'vout.data' using 1:2 with lines lw 1 title "db(vout)"
set terminal push
set terminal postscript eps color noenhanced
set out 'vout.eps'
replot
set term pop
replot
