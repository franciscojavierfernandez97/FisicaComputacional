*      0-19-ffc.f
************************************************************************
*     Cálculo de la energía potencial de una carga debida a
*     su interacción con cargas puntuales idénticas, pero de
*     signo opuesto dispuestas alternadamente a lo largo de
*     una línea recta a una distancia d.
*
*     Cargas a considerar para que la interacción de un resultado
*     con un error relativo de 10**(-2) si el valor analítico
*     de la energía potencial es:
*                  Ep=-(2*log(2))*(q**(2)/d)
*
*     Francisco Javier Fernández Caro     30/01/2024
************************************************************************
      
      
       implicit real*8 (a-h,o-z)  !Declaramos todas nuestras variables con doble precisión
       parameter (nCargas = 200) !Número de cargas para hacer el bucle
       tol=1.0e-2    !Tolerancia de error 
       q=1.0d0          !carga que crea el potencial
       Qf=1.0d0         !Suponemos la carga 1C fija
       d=2.21d0    !Distancia fija con mi DNI en Amstrongs
       
       Ep0=0.0d0  !Iniciamos la energía potencial para comenzar a calcularla
       EpAnalit=-(2.0*log(2.0))*((Qf**(2)/d))  !Expresión de la Ep analítica
       open(10,file='0-19-ffc.dat',status='unknown')
       do i=1,nCargas  !Bucle para ir añadiendo cargas hasta alcanzar la tolerancia
        q=Qf*(-1)**i
        
       Ep= Ep0 + 2.0*(q*Qf)/(d*i)  ! Definimos el sumatorio que se va a ir haciendo en cada bucle
       
       
       dif=abs((EpAnalit-Ep)/(EpAnalit))  ! Comprobamos el error relativo entre Ep0 y Ep
       write(10,*) i,Ep0,Ep
       
       Ep0=Ep    ! Actualizo la suma recién calculada
       if (dif.le.tol) then  ! Bucle para ver si alcanzamos la convergencia 
        write(*,*) 'Se alcanzo la convergencia'
        write(*,*) 'Iteracion numero:', i ,'Ep=', Ep
        write(*,*) 'EpAnalit=',EpAnalit
        write(*,1000) '  con d=', d,'y tol=',tol
        goto 100
       end if
    
      
       end do
       close(10)
       write(*,*) 'No se alcanzo la convergencia'  ! Si no se alcanza la convergencia en las nCargas, indicamos que no hemos podido obtener esa tolerancia
       write(*,*) 'Iteracion=', nCargas, '   EP=', Ep
       write(*,1000) 'Con d=', d, 'y tol=', tol
1000   format (g10.3,g10.3)
100    write(*,*)
       write(*,*) 'Programa finalizado'
       stop
       end

