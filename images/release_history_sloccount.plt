#generate a png with transparent background that support rotation by 45 degrees
#set terminal pngcairo transparent rounded linewidth 1.5 size 800,400 font "Helvetica,10"
set terminal svg linewidth 1.5 size 800,400 dynamic rounded
set out 'release_history_sloccount.svg'

plot [1995.4:2027.0] [0:920000] 'release_history_sloccount.dat'\
   using 5:2 with lines notitle,\
'' using 5:2 with points lc rgb "black" pt 7 notitle,\
'' using 5:2:1 with labels offset -1.8,0.9 rotate by -45 notitle

set terminal pop
