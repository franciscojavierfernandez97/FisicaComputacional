*     3-31a-ffc.f
************************************************************************
*    Solución de una integral doble para luego graficar en función
*    de theta la intensidad mediante el método simpson.
*
*     Francisco Javier Fernández Caro         27/02/2024
*     DNI: 48337621Q
************************************************************************
      
      include 'simpson.f'
      implicit real*8 (a-h,o-z)
      real*8 fr, fi, kappa , pi, R,eps,lambda,solr,soli,theta,soltotal
      real*8 intensidad,phiinf,phisup,rhosup,rhoinf,theta0,paso,suma
      integer nrho,nphi,n,i
      external fr, fi                           !Definimos variables, funciones, constantes,etc...
      
      common/phis/phiinf,phisup,nphi
      common/rhos/rhoinf,rhosup,nrho
      common/pasarrho/rrho
      common/pasarphi/pphi
      common/pasartheta/ttheta
      common/const1/kappa                       !Para pasar las variables y constantes a las funciones usamos commons
    
      pi = acos(-1.0d0)
      lambda = 5790.0d-10
      kappa = (2.0d0 * pi) / lambda
      R=1.0d-5
      eps=0.21d0
      n=500
      paso=0.5/real(n)                          !Damos valor a las variables en SI
      theta0=-0.25                              !Hemos puesto un paso pequeño con muchas n, ya que es una función difícil de graficar
      nrho=500                                  !Lo haremos para valores pequeños de theta
      rhoinf=0.0d0
      rhosup=R
      suma=0.0
      nphi=500
      phiinf=0.0d0                              !Definimos los límites de las integrales y las n para la subrutina simpson
      phisup=2.0d0*pi
      
      open (10, file='3-31a-ffc.dat')
      
      do i=0,n
      
      theta=theta0+real(i)*paso
      solr=fr(theta)
      soli=fi(theta)
      
      soltotal=solr**(2.0)+soli**(2.0)
      
      intensidad=(1.0d0/((pi*R**(2.0))**(2.0)))*soltotal   !Realizamos el cálculo de la intensidad 
      
      
      write(10,*) theta,intensidad            !Escribimos theta y el valor de la intensidad para cada paso del bucle para graficarlo más tarde
      
      end do
      close(10)
      
      write(*,*) 'Programa finalizado.'     !Para saber cuándo termina de correr el programa
      
      end program
      
      real*8 function fr(theta)                 !definimos la función que depende sólo de theta
      implicit real*8 (a-h,o-z)
      real*8 gr
      external gr
      common/phis/phiinf,phisup,nphi
      common/pasartheta/ttheta
      
      ttheta=theta
      
      call simpson(gr,phiinf,phisup,nphi,sgr)    !viene dada por la integral de la función g
      
      fr=sgr
      
      end function
      
      real*8 function fi(theta)          !Lo mismo para la parte imaginaria
      implicit real*8 (a-h,o-z)
      real*8 gi
      external gi
      common/phis/phiinf,phisup,nphi
      common/pasartheta/ttheta
      
      ttheta=theta 
      
      call simpson(gi,phiinf,phisup,nphi,sgi)
      
      fi=sgi
      
      end function
      
      real*8 function gr(phi)           !Definimos la función g
      implicit real*8 (a-h,o-z)
      real*8 phi,hr
      external hr
      common/rhos/rhoinf,rhosup,nrho
      common/pasarphi/pphi
      
      pphi=phi
      
      call simpson(hr,rhoinf,rhosup,nrho,shr)     !Que viene dada por la integral de la función h
      
      gr=shr
      
      
      end function
      
      real*8 function gi(phi)            !Lo mismo para la parte imaginaria
      implicit real*8 (a-h,o-z)
      real*8 phi,hi
      external hi
      common/rhos/rhoinf,rhosup,nrho
      common/pasarphi/pphi
      
      pphi=phi
      
      call simpson(hi,rhoinf,rhosup,nrho,shi)
      
      gi=shi
      end function
      
      real*8 function hr(rho)                !h es nuestra función a integrar de un principio, pero le hacemos depender sólo de 1 variable
      implicit real*8 (a-h,o-z)
      real*8 rho
      real*8 kappa
      common/pasarphi/pphi
      common/pasartheta/ttheta
      common/const1/kappa                    !Pasamos los valores de las constantes y de phi y theta para la función
      
      
      
      
      hr = rho*cos(kappa*rho*ttheta*cos(pphi))
      
      end function
      
      real*8 function hi(rho)         !Lo mismo para la parte imaginaria
      implicit real*8 (a-h,o-z)
      real*8 rho
      real*8 kappa
      common/pasarphi/pphi
      common/pasartheta/ttheta
      common/const1/kappa
      
      
      
      hi = -rho*sin(kappa*rho*ttheta*cos(pphi))
      
      end function
