module params
  implicit none
  real(8), parameter :: hbar = 1.0550d-34    ! unit J.s 
  real(8), parameter :: e = 1.6020d-19       ! electronic charge C 
  real(8), parameter :: m = 9.1090d-31;     ! kg  electron mass
  real(8), parameter :: mp = 1.672520d-27;   ! kg  proton mass
  real(8), parameter :: mn = 1.674820d-27;   ! kg neutron mass
  real(8), parameter :: eps0 = 8.8540d-12;   ! Permittivity of free space F/m
  real(8), parameter :: Ese = 1.60d-19;      ! Energy scaling factor  
  real(8), parameter :: Lse = 1.0d-09;        ! Length scaling factor
  integer(4) num != 101  Disabled herre ! mesh size, read from file
  integer(4) n_eigval                        ! Eigenvalue counter
  real(8) Cse
  real(8) U1, x0, S, xMin, xMax, dx, dx2
  real(8), allocatable :: x(:)
  real(8), allocatable :: U(:), Umat(:,:)
  real(8), allocatable :: Smat(:,:)
  real(8), allocatable :: Hmat(:,:)
! Variables for matrix eigenvalue, routine DSTEQR
! DSTEQR('I', HN, HD, HE, HZ, LDZ, WORK, INFO), H is for Hamiltonian
  integer(4) HN
  integer(4) LDZ
  integer(4) info
  real(8), allocatable :: HD(:) ! Hmat(i,i) as input or Eigenvalue on output
  real(8), allocatable :: HE(:)  ! Subdiogonal elements of Hamiltonina
  real(8), allocatable :: work(:) ! workspace matrix
  real(8), allocatable :: HZ(:,:) ! Eigenvecor matrix 
!  real(8), allocatable :: area(:) ! used to normalize wavefunction
  real(8), allocatable :: psi(:,:) ! wave functions
!  real(8), allocatable :: npsi(:,:) ! normalized wave functions
  integer(4) i, j
! B matrix and Inverse matrix
  integer(4), allocatable :: ipiv(:)
  integer(4) lda, lwork
  real(8), allocatable :: Bmat(:,:)
  real(8), allocatable :: bwork(:)
  

end module params
