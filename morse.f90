program morse
  use params
  call io()
  HN=num-2
  LDZ=HN
  call aarrays()
  Cse = -hbar**2/(2.0d0*m*Lse**2*Ese)   ! Schrodinger Eq constant
  dx=(xMax-xMin)/dble(num-1)            ! increment of position
! ===== Compute potential well =====
  do i=1,num
    x(i)=xMin+dble(i-1)*dx
    U(i)=U1*(1.0d0-(exp((x0-x(i))/S)-1.0d0)**2)
    write(2,10) x(i), U(i) ! testing of potential, (passed)
  end do
  close(2)
  10 format(f10.5, f22.15)

! ===========================
! Setup the U matrix
!============================
  dx2=dx*dx
  Umat=0.0d0
  do i=1, num-2
    Umat(i,i)=U(i+1)
  end do
!==========================
!  Sutup up Matric B
!++++++++++++++++++++++++++
Bmat=0.0d0
do i=1,hn
  Bmat(i,i)=10.0d0
end do
do i=1, hn-1
  Bmat(i,i+1)=1.0d0
  Bmat(i+1,i)=1.0d0
end do
Bmat=Bmat/12.0d0

!++++++++++++++++++++++++++
! Inversion of matrix B
!++++++++++++++++++++++++++
  lda=hn
  lwork=hn
  call DGETRF(hn, hn, Bmat, lda, ipiv, info)
  call DGETRI(hn, Bmat, lda, ipiv, bwork, lwork, info)

!===========================
!  Setup of K and H matrix
!===========================
  Smat=0.0d0
  do i=1,num-2
    Smat(i,i)=-2.0d0
  end do
  do i=1,num-3
    Smat(i,i+1)=1.0d0
    Smat(i+1,i)=1.0d0
  end do
  Smat=Cse*Smat/dx2
  Hmat=matmul(Bmat, Smat)
  Hmat=Smat+Umat
  
!===========================================================
! Computation of Eigenvalues and Eigenvectors
! LAPACK routine dsteqr('I', nmax, d, e, z, ldz, work, info)
!===========================================================
! first extract diagonal and sub-diagonal elements of H-matrix
! NOTE: H-matrix is symmetric tri-diagonal
  do i=1,hn
    hd(i)=Hmat(i,i)
  end do
  do i=1,hn-1
    he(i)=Hmat(i,i+1)
  end do
  call DSTEQR('I', HN, HD, HE, HZ, LDZ, WORK, INFO)
! counting and the writing the Eigenvalues
  n_eigval=0 
  do i=1,hn
    if(HD(i) .le. 0.0d0) then
      n_eigval=n_eigval+1
!      write(3,12) HD(i)
      write(*,12) i, HD(i)
    end if
  end do
!  write(*,*) n_eigval
  close(3)
! Writing required eigenvectors
!  psi=0.0d0
!  do i=2, hn+1
!    psi(i,:)=hz(i,:)
!  end do
! TO DO : Normalize the wavefunction psi(i,:)
!  do i=1, num
!    write(4,*)x(i),(psi(i,j),j=1,n_eigval)
!  end do
  close(4)
  call darrays()
  12 format(i5, f23.15)
!  14 format(10f23.15)
end program morse


