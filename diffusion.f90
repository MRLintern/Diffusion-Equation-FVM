!     PROGRAM TO SOLVE 2D DIFFUSION EQUATION OVER DOMAIN
!     0<=x<=1,  0<=y<=1
!     with boundary conditions phi=x*y
!*********************************************************************************  
program diffusion
       
      implicit none
      integer, parameter :: nx=25, ny=25
      integer :: i,j,iterations
      real :: x,y,z,dx,dy,omega
      real, dimension(1:nx,1:ny) :: AE,AW,AN,AS,AP,SP,SU
      real, dimension(0:nx+1,0:ny+1) :: phi
!**********************************************************************************
!     x and y-dimension space steps
      dx=1./float(nx);  dy=1./float(ny)

!     initialize SU and SP to interior cell values of zero
      SU=0;  SP=0
      phi=0.0

!     initialize AE,AW,AN,AS,AP over all cells to
!     the values over the interior cells
      AE=1.; AW=1.; AN=1.; AS=1.
!**********************************************************************************
!     set wall boundary values (overwrite initialization values)
!     west boundary
      AW(1,:)=0.    !cut link
      SU(1,:)=0.
      SP(1,:)=-2.

!     east boundary
      AE(NX,:)=0.    !cut link
      SP(NX,:)=-2.
      do j=1,NY
         SU(NX,j)=2.*( (dy/2.) + dy*float(j-1) )
      end do

!     south boundary
      AS(:,1)=0.    !cut link
      SU(:,1)=0.
      SP(:,1)=-2.

!     north boundary
      AN(:,NY)=0.    !cut link
      SP(:,NY)=-2.
      do i=1,NX
         SU(i,NY)=2.*( (dx/2.) + dx*float(i-1) )
      end do

!     corner cell boundary values(overwrite values from boundaries above)
!     southwest
      AS(1,1)=0.    !cut links
      AW(1,1)=0.
      SU(1,1)=0.
      SP(1,1)=-4.
!     northwest
      AN(1,ny)=0.    !cut links
      AW(1,ny)=0.
      SU(1,ny)=2.*(dx/2.)
      SP(1,ny)=-4.
!     southeast
      AS(nx,1)=0.    !cut links
      AE(nx,1)=0.
      SU(nx,1)=2.*(dy/2.)
      SP(nx,1)=-4.
!     northeast
      AN(nx,ny)=0.    !cut links
      AE(nx,ny)=0.
      SU(nx,ny)=2.*((dx/2.) + dx*float(nx-1)) + 2.*((dy/2.) + dy*float(ny-1))
      SP(nx,ny)=-4.
      

      AP=AE+AW+AN+AS-SP
!************************************************************************************
!     ITERATIVE SOLVER: Successive Over Relaxation (SOR)
      omega=1.7
      do iterations=1,500   !fix number of iterations at 500
      do i=1,nx
      do j=1,ny
        phi(i,j)=phi(i,j) + omega/AP(i,j)*(AE(i,j)*phi(i+1,j)+AW(i,j)*phi(i-1,j)+  &
                                         AN(i,j)*phi(i,j+1)+AS(i,j)*phi(i,j-1)+ &
                                         SU(i,j)-AP(i,j)*phi(i,j))
      end do
      end do
      end do
!************************************************************************************
!     WRITE comma separated DATA FILE FOR PARAVIEW
      open(unit=10,file='results.csv')
      write(10,*)'x coord, y coord, z coord, phi'
      do i=1,nx
      do j=1,ny
        x=dx/2+float(i-1)*dx
        y=dy/2+float(j-1)*dy
        z=0.
        write(10,*)x,',',y,',',z,',',phi(i,j)
      end do; end do

!     west boundary values
      do j=1,ny
        y=dy/2+float(j-1)*dy
        write(10,*)0.0,',',y,',',0.0,',',0.0
      end do;
!     east boundary values
        do j=1,ny
        y=dy/2+float(j-1)*dy
      write(10,*)1.0,',',y,',',0.0,',',y
      end do
!     south boundary values
      do i=1,nx
        x=dx/2+float(i-1)*dx
        write(10,*)x,',',0.0,',',0.0,',',0.0
      end do;
!     north boundary values
      do i=1,nx
        x=dx/2+float(i-1)*dx
        write(10,*)x,',',1.0,',',0.0,',',x
      end do;
!     corners
      write(10,*)0.0,',',0.0,',',0.0,',',0.0  !southwest
      write(10,*)0.0,',',1.0,',',0.0,',',0.0  !northwest
      write(10,*)1.0,',',0.0,',',0.0,',',0.0  !southeast
      write(10,*)1.0,',',1.0,',',0.0,',',1.0  !northeast
      
      end
