*     3-31b-ffc.f
************************************************************************
*    Solución de una integral doble para luego graficar en función
*    de theta la intensidad mediante el método simpson.
*    APARTADO B)
*    No comento el código porque es exactamente el mismo que en 
*    el apartado a) sólo que cambiando los límites para la integral 
*    de rho
*     
*    Francisco Javier Fernández Caro         27/02/2024
*    DNI: 48337621Q
************************************************************************    
      
      include 'simpson.f'
      implicit real*8 (a-h,o-z)
      real*8 fr, fi, kappa , pi, R,eps,lambda,solr,soli,theta,soltotal
      real*8 intensidad,phiinf,phisup,rhosup,rhoinf,theta0,paso,suma
      integer nrho,nphi,n,i
      external fr, fi
      
      common/phis/phiinf,phisup,nphi
      common/rhos/rhoinf,rhosup,nrho
      common/pasarrho/rrho
      common/pasarphi/pphi
      common/pasartheta/ttheta
      common/const1/kappa
    
      pi = acos(-1.0d0)
      lambda = 5790.0d-10
      kappa = (2.0d0 * pi) / lambda
      R=1.0d-5
      eps=0.21d0
      n=500
      paso=0.5/real(n)
      theta0=-0.25
      nrho=500
      rhoinf=eps*R
      rhosup=R
      suma=0.0
      nphi=500
      phiinf=0.0d0
      phisup=2.0d0*pi
      
      open (10, file='3-31b-ffc.dat')
      
      do i=0,n
      
      theta=theta0+real(i)*paso
      solr=fr(theta)
      soli=fi(theta)
      
      soltotal=solr**(2.0)+soli**(2.0)
      
      intensidad=(1.0d0/(pi*R**(2.0)*(1.0-eps**(2)))**(2.0))*soltotal
      
      
      write(10,*) theta,intensidad
      
      end do
      close(10)
      
      write(*,*) 'Programa finalizado.'
      
      end program
      
      real*8 function fr(theta)
      implicit real*8 (a-h,o-z)
      real*8 gr
      external gr
      common/phis/phiinf,phisup,nphi
      common/pasartheta/ttheta
      
      ttheta=theta
      
      call simpson(gr,phiinf,phisup,nphi,sgr)
      
      fr=sgr
      
      end function
      
      real*8 function fi(theta)
      implicit real*8 (a-h,o-z)
      real*8 gi
      external gi
      common/phis/phiinf,phisup,nphi
      common/pasartheta/ttheta
      
      ttheta=theta 
      
      call simpson(gi,phiinf,phisup,nphi,sgi)
      
      fi=sgi
      
      end function
      
      real*8 function gr(phi)
      implicit real*8 (a-h,o-z)
      real*8 phi,hr
      external hr
      common/rhos/rhoinf,rhosup,nrho
      common/pasarphi/pphi
      
      pphi=phi
      
      call simpson(hr,rhoinf,rhosup,nrho,shr)
      
      gr=shr
      
      
      end function
      
      real*8 function gi(phi)
      implicit real*8 (a-h,o-z)
      real*8 phi,hi
      external hi
      common/rhos/rhoinf,rhosup,nrho
      common/pasarphi/pphi
      
      pphi=phi
      
      call simpson(hi,rhoinf,rhosup,nrho,shi)
      
      gi=shi
      end function
      
      real*8 function hr(rho)
      implicit real*8 (a-h,o-z)
      real*8 rho
      real*8 kappa
      common/pasarphi/pphi
      common/pasartheta/ttheta
      common/const1/kappa
      
      
      
      
      hr = rho*cos(kappa*rho*ttheta*cos(pphi))
      
      end function
      
      real*8 function hi(rho)
      implicit real*8 (a-h,o-z)
      real*8 rho
      real*8 kappa
      common/pasarphi/pphi
      common/pasartheta/ttheta
      common/const1/kappa
      
      
      
      hi = -rho*sin(kappa*rho*ttheta*cos(pphi))
      
      end function
