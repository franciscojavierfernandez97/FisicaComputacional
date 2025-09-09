set terminal png size 1600,1200
set key left top
set xlabel 'n simulaciones de paseos'
set ylabel 'Drms de los datos generados'
set title 'Paseo por calles en cuadrícula de distancia l=1'
set output '7-34-a-drms.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-drms-ffc.dat' u 1:2 w l lc "red" title "sqrt(n)",'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-drms-ffc.dat' u 1:3 w l lc "blue" title "sqrt(drms/N)"
set xlabel 'n simulaciones de paseos'
set ylabel 'Drms de los datos generados'
set title 'Paseo sin restricciones en dirección con dist. uniforme [0.5,0.7]cm en módulo'
set output '7-34-b-drms.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-drms-ffc.dat' u 1:2 w l lc "red" title "0.6*sqrt(n)",'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-drms-ffc.dat' u 1:3 w l lc "blue" title "sqrt(drms/N)"
set xlabel 'n simulaciones de paseos'
set ylabel 'Drms de los datos generados'
set title 'Paseo por calles en cuadrícula acortando la distancia un factor p=0.9621'
set output '7-34-a-acortado-drms.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-drms-ffc.dat' u 1:2 w l lc "red" title "0.109*sqrt(n)",'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-drms-ffc.dat' u 1:3 w l lc "blue" title "sqrt(drms/N)"
set xlabel 'n simulaciones de paseos'
set ylabel 'Drms de los datos generados'
set title 'Paseo sin restricciones en dirección con dist. uniforme [0.5,0.7]cm en módulo reduciendo el paso en un factor p=0.9621'
set output '7-34-b-acortado-drms.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-drms-ffc.dat' u 1:2 w l lc "red" title "0.0668*sqrt(n)",'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-drms-ffc.dat' u 1:3 w l lc "blue" title "sqrt(drms/N)"
set key right top
set xlabel 'x(m)'
set ylabel 'y(m)'
set title 'Paseos por calles en cuadrícula de distancia l=1'

set style line 1 lt 1 lc rgb 'red' pt 7 ps 2
set style line 2 lt 1 lc rgb 'blue' pt 7 ps 2
set style line 3 lt 1 lc rgb 'green' pt 7 ps 2
set style line 4 lt 1 lc rgb 'purple' pt 7 ps 2
set style line 5 lt 1 lc rgb 'yellow' pt 7 ps 2

set output '7-34-a-paseos.png'

plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-1-ffc.dat' using 1:2 with lines lc "red" title 'Camino 1', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-2-ffc.dat' using 1:2 with lines lc "blue" title 'Camino 2', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-3-ffc.dat' using 1:2 with lines lc "green" title 'Camino 3', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-4-ffc.dat' using 1:2 with lines lc "purple" title 'Camino 4', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-5-ffc.dat' using 1:2 with lines lc "yellow" title 'Camino 5', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-1-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 1 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-2-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 2 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-3-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 3 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-4-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 4 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-5-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 5 notitle

set key right top
set xlabel 'x(m)'
set ylabel 'y(m)'
set title 'Paseos con dirección aleatoria y dist. uniforme [0.5,0.7] para el módulo'



set output '7-34-b-paseos.png'

plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-1-ffc.dat' using 1:2 with lines lc "red" title 'Camino 1', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-2-ffc.dat' using 1:2 with lines lc "blue" title 'Camino 2', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-3-ffc.dat' using 1:2 with lines lc "green" title 'Camino 3', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-4-ffc.dat' using 1:2 with lines lc "purple" title 'Camino 4', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-5-ffc.dat' using 1:2 with lines lc "yellow" title 'Camino 5', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-1-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 1 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-2-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 2 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-3-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 3 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-4-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 4 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-5-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 5 notitle

set key right top
set xlabel 'x(m)'
set ylabel 'y(m)'
set title 'Paseos en cuadrícula acortando el paso un factor p=0.9621'



set output '7-34-a-acortado-paseos.png'

plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-1-ffc.dat' using 1:2 with lines lc "red" title 'Camino 1', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-2-ffc.dat' using 1:2 with lines lc "blue" title 'Camino 2', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-3-ffc.dat' using 1:2 with lines lc "green" title 'Camino 3', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-4-ffc.dat' using 1:2 with lines lc "purple" title 'Camino 4', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado5-ffc.dat' using 1:2 with lines lc "yellow" title 'Camino 5', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-1-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 1 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-2-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 2 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-3-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 3 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-4-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 4 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-a-acortado-5-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 5 notitle

set key right top
set xlabel 'x(m)'
set ylabel 'y(m)'
set title 'Paseos con dirección aleatoria y dist. uniforme [0.5,0.7] acortando el paso un factor p=0.9621'



set output '7-34-b-acortado-paseos.png'

plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-1-ffc.dat' using 1:2 with lines lc "red" title 'Camino 1', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-2-ffc.dat' using 1:2 with lines lc "blue" title 'Camino 2', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-3-ffc.dat' using 1:2 with lines lc "green" title 'Camino 3', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-4-ffc.dat' using 1:2 with lines lc "purple" title 'Camino 4', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-5-ffc.dat' using 1:2 with lines lc "yellow" title 'Camino 5', \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-1-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 1 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-2-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 2 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-3-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 3 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-4-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 4 notitle, \
     'C:\Users\FRAN\Desktop\FisicaComputacional\Tema7\7-34-ffc\7-34-b-acortado-5-ffc.dat' using (column(1)):(column(2)) every ::999::999 with points ls 5 notitle
