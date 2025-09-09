set sample 10000
set terminal png
unset key
set xlabel "x(m)"
set ylabel "y(m)"
set title "Frecuencia fundamental ecuación inhomogénea: k_1=137.73"
set output "k1Inhomogenea.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-ffc.dat' with lines lc "red" lw 1
set title "Frecuencia fundamental ecuación inhomogénea: k_1=137.73 normalizada"
set output "k1Inhomogeneanorm.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-1-ffc.dat' with lines lc "red" lw 1
set title "Segunda frecuencia ecuación inhomogénea: k_2=286,28"
set output "k2Inhomogenea.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-2-ffc.dat' with lines lc "blue" lw 1
set title "Segunda frecuencia ecuación inhomogénea: k_2=286,28 normalizada"
set output "k2Inhomogeneanorm.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-1-2-ffc.dat' with lines lc "blue" lw 1
set title "Tercera frecuencia ecuación inhomogénea: k_3=435,19"
set output "k3Inhomogenea.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-3-ffc.dat' with lines lc "green" lw 1
set title "Tercera frecuencia ecuación inhomogénea: k_3=435,19 normalizada"
set output "k3Inhomogeneanorm.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-1-3-ffc.dat' with lines lc "green" lw 1
set key right top
set title "Tres primeras frecuencias para la ecuación diferencial inhomogénea normalizadas"
set output "ComparaciónInhomogenea.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-1-ffc.dat' with lines lc "red" lw 1 title "k1=137.73", 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-1-2-ffc.dat' with lines lc "blue" lw 1 title "k2=286,28", 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-1-3-ffc.dat' with lines lc "green" lw 1 title "k3=435,19"

unset key
set title "Frecuencia fundamental ecuación homogénea: w_1=4442.878"
set output "w1Homogenea.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h-ffc.dat' with lines lc "red" lw 1
set title "Frecuencia fundamental ecuación homogénea: w_1=4442.878 normalizada"
set output "w1Homogeneanorm.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h-1-ffc.dat' with lines lc "red" lw 1
set title "Segunda frecuencia ecuación homogénea: w_2=8885.758"
set output "w2Homogenea.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h2-ffc.dat' with lines lc "blue" lw 1
set title "Segunda frecuencia ecuación homogénea: w_2=8885.758 normalizada"
set output "w2Homogeneanorm.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h2-1-ffc.dat' with lines lc "blue" lw 1
set title "Tercera frecuencia ecuación homogénea: w_3=13328.644"
set output "w3Homogenea.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h3-ffc.dat' with lines lc "green" lw 1
set title "Tercera frecuencia ecuación homogénea: w_3=13328.644 normalizada"
set output "w3Homogeneanorm.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h3-1-ffc.dat' with lines lc "green" lw 1
set key right top
set title "Tres primeras frecuencias para la ecuación diferencial homogénea normalizadas"
set output "ComparaciónHomogenea.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h-1-ffc.dat' with lines lc "red" lw 1 title "w1=4442.878", 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h2-1-ffc.dat' with lines lc "blue" lw 1 title "w2=8885.758", 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h3-1-ffc.dat' with lines lc "green" lw 1 title "w3=13328.644"

set key right top
set title "Comparación de frecuencia fundamental entre solución homogénea e inhomogénea."
set output "Comparación1homoinhomo.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-1-ffc.dat' with lines lc "red" lw 1 title "k1=137.73", 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h-1-ffc.dat' with lines lc "blue" lw 1 title "w1=4442.878"
set key right top
set title "Comparación de segunda frecuencia entre solución homogénea e inhomogénea."
set output "Comparación2homoinhomo.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-1-2-ffc.dat' with lines lc "red" lw 1 title "k2=286,28", 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h2-1-ffc.dat' with lines lc "blue" lw 1 title "w2=8885.758"
set key right top
set title "Comparación de tercera frecuencia entre solución homogénea e inhomogénea."
set output "Comparación3homoinhomo.png"
plot 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-1-3-ffc.dat' with lines lc "red" lw 1 title "k3=435,19", 'C:\Users\FRAN\Desktop\FisicaComputacional\Tema5\5-17\5-17-h3-1-ffc.dat' with lines lc "blue" lw 1 title "w3=13328.644"
