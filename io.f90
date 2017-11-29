subroutine io()
  use params, only : num, U1, x0, S, xMin, xMax
 
  open(1,file='in.dat', action='read')
  open(2,file='potential.dat', action='write')
  open(3,file='eigvalue.dat', action='write')
  open(4,file='eigvector.dat', action='write')
  read(1,*) num
  read(1,*) U1
  read(1,*) x0
  read(1,*) S
  read(1,*) xMin
  read(1,*) xMax
  close(1)
end subroutine io

