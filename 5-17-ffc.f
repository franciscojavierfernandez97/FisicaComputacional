*     5-17-ffc.f
************************************************************************
*
*      Obtener las frecuencias de vibración de una cuerda
*      con el método del disparo y la autofunción resolviendo la e.d.
*      
*
*      Francisco Javier Fernández Caro                  18.03.2024
************************************************************************
      include 'rk4-r8.f'
      implicit real*8 (a-h,o-z)
      parameter (n=2)   ! orden de la ecuacion diferencial
      parameter (npuntos=100) ! numero de intervalos en que divido el intervalo [x0, xf]
      parameter (nautovalor=1) ! orden del autovalor que se esta buscando
      
      dimension y(n),dydx(n),yout(n)
      
      character*1 nautoval
      
      external derivs
      
      common/ene/nn       
      common/autovalor/c  ! commons para pasar los valores a derivs
      nn=n

      write(nautoval,'(i1.1)') nautovalor



      x0=0.0
      xf=1.0     !valores iniciales y finales de x
      

      y0=0.0      
      yf=0.0      ! valor de la funcion en el inicio y final del dominio

      yder=1.0    ! valor (fijo) de la pendiente con el que se resuelve la ec. dif.
      h=(xf-x0)/real(npuntos) ! paso con el que recorro x

      
      !COMENTAMOS Y DESCOMENTAMOS LOS CMIN Y CMAX PARA OBTENER CADA
      !AUTOVALOR DEPENDIENDO DE LA SOLUCIÓN QUE BUSCAMOS

************************************************************************
*     CMIN Y CMAX PARA LA SOLUCIÓN NO HOMOGÉNEA 
************************************************************************
*     cmin=130   
*     cmax=140  ! valor mínimo y máximo para buscar el 1er autovalor 
     
*     cmin=280 
*     cmax=290  ! valor mínimo y máximo para buscar el 2o autovalor
      
*     cmin=430   
*     cmax=440  ! valor mínimo y máximo para buscar el 3er autovalor

************************************************************************
*     CMIN Y CMAX PARA LA SOLUCIÓN HOMOGÉNEA
************************************************************************
*      cmin=4400   
*      cmax=4500  ! valor mínimo y máximo para buscar el 1er autovalor 
     
*       cmin=8800 
*       cmax=8900  ! valor mínimo y máximo para buscar el 2o autovalor
      
       cmin=13300   
       cmax=13400  ! valor mínimo y máximo para buscar el 3er autovalor
************************************************************************


      tol=1.0e-6  ! tolerancia
      
      nautov=1000000    ! numero de puntos en los que discretizo 
      hautov=(cmax-cmin)/real(nautov)   ! paso con el que recorro el intervalo de autovalores
                  

      do iautov=0,nautov     ! recorremos los posibles autovalores
        c=cmin+iautov*hautov

        x=x0         ! fijo el valor inicial de la variable independiente x
        y(1)=y0      ! fijo el valor inicial de la funcion y
        y(2)=yder    ! fijo el valor inicial de la derivada y'

        do i=1,npuntos   
          call derivs(x,y,dydx)               ! llamamos a la subrutina derivs
          call rk4(y,dydx,n,x,h,yout,derivs)  ! llamamos a la subrutina rk4                                              
          x=x0+i*h       
          do j=1,n       
            y(j)=yout(j) 
          end do
        end do           

        dif=abs(y(1)-yf)   
 

        if (dif.le.tol) then  ! si y(1)=yf con cierta tolerancia entonces consideramos "c" autovalor.
          open(10,file='5-17-h3-ffc.dat') 
          write(10,*) '# num. puntos=',npuntos,'tol=', tol,'yder=',yder
          write(10,*) '# cmin=',cmin,' cmax=',cmax,'  Delta_c=',hautov
          write(10,*) '# (autovalor) k =', c


            x=x0         
            y(1)=y0     
            y(2)=yder    ! fijo los valores de x, y(1) e y(2)
            ymax=0.0     ! inicializamos ymax para normalizar la solucion

            write(10,1000) x,y(1),y(2)  ! Vamos escribiendo los resultados
            ymax=max(abs(y(1)),abs(ymax)) ! definimos ymax para normalizarla

            do i=1,npuntos  
              call derivs(x,y,dydx)
              call rk4(y,dydx,n,x,h,yout,derivs) 
                                                 

              x=x0+i*h  
              do j=1,n       
                y(j)=yout(j)    !Mismo proceso que antes llamando a las subrutinas derivs y rk4
              end do
              ymax=max(abs(y(1)),abs(ymax)) ! ymax para normalizar
              write(10,1000) x,y(1),y(2) ! escribimos los resultados
            end do  
            close (10)
          
            open(10,file='5-17-h3-ffc.dat')   ! abro fichero para leer los datos del autovalor 
            read(10,*)  
            read(10,*)  
            read(10,*)  ! lee 3 lineas en blanco

            open(20,file='5-17-h3-'//nautoval//'-ffc.dat') !abro fichero para escribir datos normalizados con su orden de autovalor
                                             
            write(20,*) '# num. puntos=',npuntos,'tol=',tol,'yder=',yder
            write(20,*) '# cmin=',cmin,' cmax=',cmax,'  Delta_c=',hautov
            write(20,*) '# (autovalor) k =', c

            do ii=0,npuntos
              read(10,*) x,y(1),y(2)      ! leemos la solucion sin normalizar
              write(20,*)x,y(1)/ymax,y(2) ! y la escribimos normalizada
            end do
            close(10)
            close(20)
          
          write(*,*) 'Encontrado autovalor c=',c
          write(*,*) 'programa finalizado exitosamente'
          stop 
        end if     !Si y(1) es distinto de yf, sigo buscando autovalor
      end do    

      write(*,*) 'no se ha encontrado ningun autovalor'
      write(*,*) 'programa finalizado'
 1000 format(3(2x,e15.7))
      stop
      end

    !DESCOMENTAR LA PRIMERA SUBRUTINA DERIVS PARA OBTENER LA SOLUCIÓN
    !NO HOMOGENEA, DESCOMENTAR LA SEGUNDA PARA OBTENER LA SOLUCIÓN 
    !HOMOGENEA. SIMPLEMENTE CAMBIAMOS EL NOMBRE DEL ARCHIVO .DAT DE SALIDA
    
************************************************************************
*      SUBRUTINA DERIVS 1: SOLUCIÓN HOMOGENEA
************************************************************************
*      subroutine derivs(x,y,dy) 

*      implicit real*8 (a-h,o-z)
*      dimension y(nn),dy(nn)
*      common/ene/nn     
*      common/autovalor/c  
*      
*      T=1000.0
*      delta=0.9e-3
*      ele0=0.5e-3     !Definimos constantes para nuestra ecuación diferencial en SI
*      dist=1.0


*       dy(1)=y(2)  
*       dy(2)=-(ele0+(x-(dist/2.0)*delta))*(1.0/T)*(c**2)*y(1) !Escribimos nuestra ecuación diferencial
*       return                     
*       end
************************************************************************

************************************************************************
*     SUBRUTINA DERIVS 2: SOLUCIÓN HOMOGÉNEA
************************************************************************
      subroutine derivs(x,y,dy) 

      implicit real*8 (a-h,o-z)
      dimension y(nn),dy(nn)
      common/ene/nn     
      common/autovalor/c  
      
      T=1000.0
      ele0=0.5e-3     !Definimos constantes para nuestra ecuación diferencial
      

       dy(1)=y(2)  
       dy(2)=-(ele0/T)*c**(2)*y(1) !Escribimos nuestra ecuación diferencial
       return                     
       end
************************************************************************
