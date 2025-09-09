*6-24-ffc.f
************************************************************************
*  Distribucion estacionaria de temperaturas (en grados Celsius) en
*  una placa semicircular con las siguientes condiciones de contorno:
*     u(x,0)=0, u(x,y)=100 en el borde curvado del semicírculo
*
*  Resolvemos la ecuacion de Laplace en coordenadas polares.
*
*	
*  
*   Francisco Javier Fernández Caro       23/03/2024
************************************************************************
        
        parameter(nr=100,nth=100)
        dimension t(0:nr,0:nth), r(0:nr,0:nth), th(0:nth)
        parameter(itermax=5000)                               !Definimos parámetros y dimensiones del número de puntos que usaremos
        
                                                              !junto a las matrices t, r y th para calcular las soluciones en cada punto 
        pi=acos(-1.0)
        
        
        r0=0.0                      ! radio
        rf=10.0
        
        
        th0=0.0                     ! angulo theta
        thf=pi
        
        ! condiciones de contorno (temperatura de los bordes en grados celsius) 
        tc=100.0   ! temperatura en rf
        tp=0.0   ! temperatura en theta=0 y theta=pi
        
        
        
        hr=(rf-r0)/real(nr)
        hth=(thf-th0)/real(nth)       ! paso 
        
        
        hr2=hr**2
        hth2=hth**2       ! definimos los pasos al cuadrado para utilizarlos en la fórmula discretizada
        
        
        ! damos un valor incial a la temperatura (arbitrario)
        do i=0,nr-1
            do j=1,nth-1
                 t(i,j)=0.0
            end do
        end do
        
        ! valores para los vectores de r y theta
        do i=0, nr 
            do j=0, nth
                r(i,j)=r0+i*hr
                th(j)=th0+j*hth
            end do 
        end do 
        
        
        nn=nth          ! recorremos los bordes para fijar las condiciones de contorno
        
        
            
        do i=0,nn
            t(100,i)=tc       
        end do 
        
        do i=0,nn-1
            t(i,0)=tp
        end do 
        
        do i=0,nn-1
            t(i,100)=tp
        end do 
        
        
        ! comienza la resolucion de la ecuacion de derivadas parciales en coordenadas polares
        
        do iter=1, itermax
            do j=0, nth
                t(0,j)=t(1,j)
            end do
            do i=1, nr-1
                do j=1,nth-1
               

                ! definimos los valores para la temperatura en cada punto habiendo definido antes nuestras CC
                    t(i,j) = (hr2*hth2*r(i,j)*r(i,j)/(2.0*
     &  (hr2+hth2*r(i,j)*r(i,j))) ) 
     & *(t(i+1,j)*(1.0/hr2+1.0/(r(i,j)*2.0*hr))
     &  +t(i-1,j)*(1.0/hr2-1.0/(r(i,j)*2.0*hr))
     &  +(t(i,j+1)+t(i,j-1))/(r(i,j)*r(i,j)*hth2))
     

                   
                end do
            end do 
        end do 
        
        ! Escribimos los datos en coordenadas cartesianas para poder representar en gnuplot
        
        open(10,file='6-24-ffc.dat',status='unknown')
        
        do i=0,nr
            do j=0,nth
                write(10,*) r(i,j)*cos(th(j)), r(i,j)*sin(th(j)), t(i,j)
            end do
            write(10,*)
        end do

        close(10)
        write(*,*)'programa finalizado'
        
        end
          
