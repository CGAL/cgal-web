#generate a png with transparent background that support rotation by 45 degrees
set terminal pngcairo transparent rounded linewidth 1.5 size 800,400 font "Helvetica,10"
set out 'release_history_sloccount.png'

plot [1996.7:2017.8] [0:739000] 'release_history_sloccount.dat'\
   using 5:2 with lines notitle,\
'' using 5:2 with points lc rgb "black" pt 7 notitle,\
'' using 5:2:1 with labels offset -1.6,0.8 rotate by -45 notitle

set terminal pop
