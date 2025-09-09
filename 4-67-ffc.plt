set sample 10000
set terminal png
cd 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc'
set xlabel 't'
set ylabel 'x'
set title 'x frente a t'
set key right top
set output 'xt1-4-67-ffc.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\4-67-ffc.dat' using 1:2 title "DNI=621" with lines lc "red"
set xlabel 't'
set ylabel 'x'
set title 'x frente a t'
set key right top
set output 'xt2-4-67-ffc.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\4-67-2-ffc.dat' using 1:2 title "DNI=622" with lines lc "blue"
set xlabel 't'
set ylabel 'x'
set title 'x frente a t'
set key right top
set output 'xt12-4-67-ffc.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\4-67-ffc.dat' using 1:2 title "DNI=621" with lines lc "red", 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\4-67-2-ffc.dat' using 1:2 title "DNI=622" with lines lc "blue"
set xlabel 'z'
set ylabel 'y'
set title 'Espacio de fases (y frente a z)'
set key right top
set output 'yz1-4-67-ffc.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\4-67-ffc.dat' using 4:3 title "DNI=621" with lines lc "red"
set xlabel 'z'
set ylabel 'y'
set title 'Espacio de fases (y frente a z)'
set key right top
set output 'yz2-4-67-ffc.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\4-67-2-ffc.dat' using 4:3 title "DNI=622" with lines lc "blue"
set xlabel 'z'
set ylabel 'y'
set title 'Espacio de fases (y frente a z)'
set key right top
set output 'yz12-4-67-ffc.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\4-67-ffc.dat' using 4:3 title "DNI=621" with lines lc "red", 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\4-67-2-ffc.dat' using 4:3 title "DNI=622" with lines lc "blue"
set xlabel 't'
set ylabel 'Distancia entre trayectorias'
set title 'Separación entre trayectorias en función de t (Escala lineal)'
unset key
set output 'distlineal-4-67-ffc.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\dist-4-67-ffc.dat' using 1:2  with lines lc "red"
set logscale y
set title 'Separación entre trayectorias en función de t (Escala logaritmica)'
set output 'distlog-4-67-ffc.png'
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema4\4-67-ffc\dist-4-67-ffc.dat' using 1:2  with lines lc "red"
