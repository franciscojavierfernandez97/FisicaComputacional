*     1-29-ffc.f
************************************************************************
*    Cálculo de las frecuencias de vibración para una barra de acero
*    y sección cuadrada. Para ello buscamos ceros de una función 
*    con el método de bisección.
*
*     Francisco Javier Fernández Caro     06/02/2024
************************************************************************


          include 'bisecc-r8-rgm.f'
          implicit real*8 (a-h,o-z)
          parameter (nceros=4)   ! numero = (nceros - 1), 'numero' de ceros que pretendo obtener
          dimension cero(nceros),xleft(nceros),frec(nceros)
          external f
          real*8 f
          common /constantes/ pi
          
          
          D=0.01d0    !D en metros
          Long=1.0d0
          Cs=5130.0d0
          rg=D/sqrt(12.0d0)  !DNI impar (Sección cuadrada)
          pi=acos(-1.0d0)
          tol=1.0d-3   ! tolerancia
          kmax=200     ! maximo numero de iteraciones
          
          xleft(1)=2.0d0     !valores propuestos para comenzar a buscar los ceros
          xleft(2)=4.0d0
          xleft(3)=6.0d0
          xleft(4)=8.0d0
          open(10,file='1-29-ffc.dat')    !Abrimos fichero para escribir los resultados
          do n=1,nceros-1
             xl=xleft(n)
             xr=xleft(n+1)
             call bisecc(f,xl,xr,kmax,tol,k,x) ! utilizo la subrutina del metodo de la bisección
             cero(n)=x
             write(10,1000) n,cero(n)  !escribimos los resultados en el fichero que hemos abierto
             frec(n)=cero(n)**(2.0)*((pi*rg*Cs)/8.0*Long**(2.0))  !calculamos la frecuencia con cada cero obtenido
          write(*,*)'Cero numero',n,'nu_n=',cero(n),'frec=',frec(n),'Hz'
          end do
          close(10)
          write(*,2000)  'Con tol=',tol
          
          write(*,*) 'programa finalizado'
          stop
1000   format(x,i3,x,f9.5)
2000   format (g10.3,g10.3)
          end
************************************************************************
          real*8 function f(x)   ! defino la funcion cuyos ceros busco
************************************************************************
          implicit real*8 (a-h,o-z)
          common /constantes/ pi
          f = cosh(x*pi*0.5)*cos(x*pi*0.5)- 1.0    ! funcion original 
          return                  ! devolvemos el control al programa principal
          end
          
