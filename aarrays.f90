subroutine aarrays()
  use params
  allocate(x(num))
  allocate(U(num))
  allocate(Umat(hn,hn))
  allocate(Smat(hn,hn))
  allocate(Hmat(hn,hn))
  allocate(HD(HN))
  allocate(HE(HN-1))
  allocate(HZ(LDZ,HN))
  allocate(work(2*HN-2))
!  allocate(area(num))
  allocate(psi(num,num))
!  allocate(npsi(num,num))
  allocate(ipiv(hn))
  allocate(Bmat(hn,hn))
  allocate(bwork(hn))

end subroutine aarrays
 
