set terminal X11 noenhanced
set title "* gnetlist -l ../.. -g spice-noqsi -o frequency_trap.net frequency_trap.sch"
set xlabel "Hz"
set ylabel "V"
set grid
set logscale x
set xrange [1e+02:1e+05]
set mxtics 10
set grid mxtics
unset logscale y 
set yrange [-1.100000e+00:1.100000e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'vtest.data' using 1:2 with lines lw 1 title "db(vtest)"
set terminal push
set terminal postscript eps color noenhanced
set out 'vtest.eps'
replot
set term pop
replot