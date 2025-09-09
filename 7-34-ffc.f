*      7-34-ffc.f
************************************************************************
*     Simulación Montecarlo de paseo al azar. 
*     (Paseo del borracho)
*
*      Francisco Javier Fernández Caro       20.04.2024
************************************************************************
      include 'ran2.f'      ! llamamos a la subrutina que genera números aleatorios
      parameter (num=1000) ! pasos
      character nn*1
      pi=acos(-1.0)
      iseed=-28747433  ! semilla para iniciar los calculos
      p=0.9621            !para el apartado c) 
      n=5000
      open(1,file='7-34-a-drms-ffc.dat')
      write(1,*) '# n       sqrt(n)     drms   '
      drms = 0.0
      do j=1,5              !Bucle para escribir los datos x e y, así poder graficarlo
        write(nn,'(i1)') j
        open(10+j,file='7-34-a-'//nn//'-ffc.dat')
        write(10+j,*) '# x         y        '
        do l=1,n,50
        do k=1,l         !Bucle de cada trayectoria de 1000 pasos
          dx=0.0
          dy=0.0       
          do i=1,num         !Bucle para simular cada paso 
            x = ran2(iseed)
        
            if (x.lt.0.25) dx = dx + 1.0
        
            if (x.gt.0.25 .and. x.lt.0.5)  dx = dx - 1.0
        
            if (x.gt.0.5 .and. x.lt.0.75)  dy = dy + 1.0
        
            if (x.gt.0.75) dy = dy - 1.0
          
            d = dx**2 + dy**2
            

            
            if (k.eq.j .and. l.eq.1) then  !condición para escribir sólo las x e y hasta k=5 (5 primeras simulaciones)

               write(10+j,*) dx, dy

            end if
          
            if (k.eq.l) then !condición para ir sumando la drms después de cada simulación de 1000 pasos
            
              drms = drms + d
              
              write(1,*) k, sqrt(real(k)),sqrt(drms/real(num))
              
            end if
        
          end do
        end do
        end do
        close(10+j)
      end do
        
      close(1)
      
!A partir de aquí es el mismo procedimiento, sólo cambia la manera de calcular dx y dy según demanda el problema
                  
      dx=0.0      !distancia en x 
      dy=0.0      !distancia en y
      
      
      a=0.5      !l1
      b=0.7      !l2
      
      open(2,file='7-34-b-drms-ffc.dat')
      write(2,*) '# n       sqrt(n)     drms   '
      drms = 0.0
      do j=1,5
        write(nn,'(i1)') j
        open(20+j,file='7-34-b-'//nn//'-ffc.dat')
        write(20+j,*) '# x         y        '
        do k=1,num 
          dx=0.0
          dy=0.0 
                
          do i=1,num
          x = ran2(iseed)
          y = ran2(iseed)  
          along=a+(b-a)*x  
          alpha=2*pi*y
          
          dx=dx+along*cos(alpha)
      
          dy=dy+along*sin(alpha)
      
          d=dx**2+dy**2
        
          if (k.eq.j) then  

               write(20+j,*) dx, dy

            end if
          
            if (i.eq.num .and. j.eq.1) then !  
            
              drms = drms + d
              
              write(2,*) k, 0.6*sqrt(real(k)),sqrt(drms/real(num))
              
            end if
          end do
        end do
        close(20+j)
      end do
        
      close(2)
     
      
      open(3,file='7-34-a-acortado-drms-ffc.dat')
      write(3,*) '# n       sqrt(n)     drms   '
      drms = 0.0
      do j=1,5
        write(nn,'(i1)') j
        open(30+j,file='7-34-a-acortado-'//nn//'-ffc.dat')
        write(30+j,*) '# x         y        '
        do k=1,num 
          dx=0.0
          dy=0.0       
          do i=1,num
      x=ran2(iseed)
        
        if(x.lt.0.25)  dx=dx+1.0*p**i     !elegimos el camino de la derecha
        
        
        
        if(x.gt.0.25 .and. x.lt.0.5)  dy=dy+1.0*p**i  !de arriba
        
        
        if(x.gt.0.5 .and. x.lt.0.75) dx=dx-1.0*p**i   !de la izquierda
        
        
        if(x.gt.0.75) dy=dy-1.0*p**i                 !de abajo
        
        
        d=dx**2+dy**2
        
        if (k.eq.j) then  

               write(30+j,*) dx, dy

            end if
          
            if (i.eq.num .and. j.eq.1) then !   
            
              drms = drms + d
              
              write(3,*) k, 0.109*sqrt(real(k)),sqrt(drms/real(num))
              
            end if
          end do
        end do
        close(30+j)
      end do
        
      close(3)
      dx=0.0      !distancia en x 
      dy=0.0      !distancia en y 
      
      
      a=0.5
      b=0.7
      open(4,file='7-34-b-acortado-drms-ffc.dat')
      write(4,*) '# n       sqrt(n)     drms   '
      drms = 0.0
      do j=1,5
        write(nn,'(i1)') j
        open(40+j,file='7-34-b-acortado-'//nn//'-ffc.dat')
        write(40+j,*) '# x         y        '

        do k=1,num 
          dx=0.0
          dy=0.0 
                
          do i=1,num  
      x=ran2(iseed)
      y=ran2(iseed)          
      along=(a+(b-a)*x)*p**i  
      alpha=2*pi*y
      dx=dx+along*cos(alpha)
      
      dy=dy+along*sin(alpha)
      
      d=dx**2+dy**2
        
          if (k.eq.j) then  

               write(40+j,*) dx, dy

          end if
          
            if (i.eq.num .and. j.eq.1) then 
            
              drms = drms + d
              
              write(4,*) k, 0.0668*sqrt(real(k)),sqrt(drms/real(num))
              
            end if
          end do
        end do
        close(40+j)
      end do
        
      close(4)
      
      write(*,*) 'programa finalizado'
      
      end

