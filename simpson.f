*
*      integraci¢n por el m‚todo de simpson
*       damos funci¢n, extremos, y numero de trozos a discretizar
*
*
      subroutine simpson(f,a,b,n,s)
      implicit real*8 (a-h,o-z)
      external f
      real*8 f
      
      h=(b-a)/real(n)
************************************************************************
*                              suma impar
************************************************************************
      si=0.0d0
      do i=1,n-1,2
        si=si+f(a+i*h)
      end do
************************************************************************
*                              suma par
************************************************************************
      sp=0.0d0
       
      do i=2,n-2,2
      sp= sp+f(a+i*h)
      end do
************************************************************************
*                              suma total
************************************************************************
      s=(h/3.0d0)*(2.0d0*sp+4.0d0*si+f(a)+f(b))

      return
      end subroutine
