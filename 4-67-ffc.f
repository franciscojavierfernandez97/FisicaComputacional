*     4-67-ffc.f
************************************************************************
*    Ejercicio para resolver ecuaciones diferenciales de primer orden
*    (atractor de Lorenz) con el método de Runge-Kutta en doble 
*    precisión.
*
*    Francisco Javier Fernández Caro           02/03/2024
************************************************************************

        include 'rk4-r8.f'
        implicit real*8 (a-h,o-z)
        parameter(n=3)                                      
        parameter (xi=1.0d0,yi=1.0d0,zi=20.000621d0,zi2=20.000622d0)   !Definimos el valor de nuestras C.I
        dimension y(n),dydx(n),yout(n),cal1(2501,n),cal2(2501,n),
     &  calfin(2501)
        external derivs
        common/ene/ nn
        common/const/ sigma,r,b
        
        nn=n
        cal1=0.0d0
        cal2=0.0d0                !Inicializamos nuestras matrices que guardarán nuestros resultados para calcular la distancia entre trayectorias
        calfin=0.0d0
        sigma = 10.0d0
        r = 28.0d0                  !Definimos constantes
        b = 8.0d0/3.0d0
        
        cal1(1,1)= xi
        cal1(1,2)= yi
        cal1(1,3)= zi
        
        cal2(1,1)= xi
        cal2(1,2)= yi
        cal2(1,3)= zi2
        
        y(1) = xi  
        y(2) = yi              !Nuestras variables en las C.I
        y(3) = zi  
        
        


        x0 = 0.0d0
        xf = 30.0d0           !El tiempo inicial y final
         
        npasos = 2500                !Definimos el paso
        h = (xf-x0)/real(npasos)
        
        x=x0
    

        open(10,file='4-67-ffc.dat')
        
        write(10,*) x, y(1),y(2),y(3)          !Escribimos antes los valores de las C.I
        
        do j=1,npasos                                !Bucle que llama a las subrutinas derivs y rk4-r8 para cada paso
            call derivs(x,y,dydx)
            call rk4(y,dydx,n,x,h,yout,derivs) 
            x=x0+j*h                            
            do i=1,n                            
                y(i)=yout(i) 
                cal1(j+1,i)=yout(i)      !Vamos rellenando nuestra matriz con los resultados que vamos obteniendo
            end do
            
        write(10,*) x,y(1),y(2),y(3)    !Una vez nos devuelve el resultado lo vamos escribiendo en el fichero

        end do
        close(10)
        
        y(1) = xi  
        y(2) = yi              !Nuestras variables en las C.I
        y(3) = zi2
         
        x=x0
        
        open(20,file='4-67-2-ffc.dat')
        
        write(20,*) x, y(1),y(2),y(3)
        
        do j=1,npasos                                !Bucle que llama a las subrutinas derivs y rk4-r8 para cada paso
            call derivs(x,y,dydx)
            call rk4(y,dydx,n,x,h,yout,derivs) 
            x=x0+j*h                            
            do i=1,n                            
                y(i)=yout(i) 
                cal2(j+1,i)=yout(i)               !Volvemos a rellenar nuestra 2a matriz con los resultados del 2o valor de DNI
            end do
        write(20,*) x,y(1),y(2),y(3)
        end do    
        
        close(20) 
        
        x=x0
        
        open(30,file='dist-4-67-ffc.dat')
        
        do j=1,npasos+1
        
        calfin(j)= sqrt((cal1(j,1)-cal2(j,1))**(2)+(cal1(j,2)-cal2(j,2))
     & **(2) +(cal1(j,3)-cal2(j,3))**(2))                 !Con nuestras 2 matrices, calculamos la distancia 
        write(30,*) x,calfin(j)                           !..que hay entre las trayectorias para cada paso
          x=x0+j*h
          
        
        end do
        
        write(*,*) 'Programa finalizado'
        
        end
        
        
        subroutine derivs(x,y,dy)                !Subrutina derivs para calcular la derivada en cada paso
        implicit real*8 (a-h,o-z) 
        dimension y(nn), dy(nn)
        common/ene/nn  
        common/const/ sigma,r,b 
        
        dy(1) = sigma*(y(2)-y(1))             !Definimos las derivadas
        dy(2) = r*y(1)-y(2)-y(1)*y(3)    
        dy(3) = y(1)*y(2)-b*y(3) 
        
        return 
        end 

