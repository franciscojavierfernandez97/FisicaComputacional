*     2-75-ffc.f
************************************************************************
* solucion del sistema de 14 ecuaciones lineales con las matrices A y 
* b dependientes de las columnas i y j conforme expone el ejercicio.
*
* Para ello utilizamos el método de descomposición LU y las subrutinas
* "ludcmp.f" y "lubksb.f"
*
*     Francisco Javier Fernández Caro         12/02/2024
*     DNI: 48337621Q
************************************************************************


          include 'ludcmp.f'
          include 'lubksb.f'
          parameter (n=14,np=14)     !D=4
          dimension a(np,np),indx(np),b(np)  !Declaramos las dimensiones de las matrices
      
          a=0.0 !Inicializo a cero ambas 
          b=0.0
          
          do i=1,n  
            do j=1, n
              a(i,j)=((-1.0)**real((i+j)))/real(i+j)  !Matriz que propone el ejercicio
            end do
            a(i,i)=1.0+real(i)      ! I=1
            b(i)=1.0/real(i)
          end do
        open (10, file='2-75-ffc.txt', status='unknown')
        open (20, file='2-75-ffc.dat', status='unknown')
          write(10,*)
          write(10,*) '                           Matriz a'
       write(10,*)
       do i=1,n
        write(10,100) (a(i,j), j=1,n) !Escribimos la matriz A en el .txt
       end do
       write(10,*)
       write(10,*)
       write(10,*) '                           Matriz b'
       write(10,*)
       do i=1,n
         write(10,200) b(i) !Escribimos la matriz b en el .txt
       end do
       write(*,*)
          
* procedemos a resolver el sistema  

          call ludcmp(a,n,np,indx,d) ! subrutina que descompone la matriz "A" en el producto de matrices "L*U"
          call lubksb(a,n,np,indx,b)
          
* escribo el vector columna con las soluciones a las incognitas
          
100    format((14(x,f9.3))) !formato para escribir la matriz A
200    format('                          |',x, f9.4, '   |') !Matriz b
300    format('X_',g9.4,x,'=',g9.3)          !Soluciones x_i
          write(10,*)
          do i=1,n
            write(10,300) indx(i),b(i)   !Escribimos en el .txt
            write(20,*) indx(i),b(i)   !Escribimos para graficar en gnuplot
            
          end do 
          
          close(10)   
          close(20)
          
          write(*,*) 'Programa finalizado'
          
          stop
          end

