subroutine darrays()
  use params
  deallocate(x)
  deallocate(U)
  deallocate(Umat)
  deallocate(Smat)
  deallocate(Hmat)
  deallocate(HD)
  deallocate(HE)
  deallocate(HZ)
  deallocate(work)
  deallocate(bwork)
  deallocate(Bmat)
!  deallocate(area)
  deallocate(psi)
!  deallocate(npsi)
  
end subroutine darrays
 
