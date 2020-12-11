program kdtree_benchmark
  use kdtree2_module
  implicit none

  type(kdtree2), pointer :: tree
  real(kdkind), dimension(:,:), allocatable :: data, queries
  type(kdtree2_result) :: results(1)

  real :: t0, t1, t2
  integer, parameter :: m(3) = [3, 8, 16]
  integer, parameter :: n = 10000, r = 1000
  integer :: idxs(r), idx
  integer :: i, s
  integer, allocatable :: seed(:)

  call random_seed(size=s)
  allocate(seed(s))
  seed = 1234
  call random_seed(put=seed)

  do i = 1, 3

    write(*,*) "Dimension = ", m(i)

    allocate(data(m(i),n))
    call random_number(data)

    allocate(queries(m(i),r))
    call random_number(queries)

    ! Populate tree
    call cpu_time(t0)
    tree => kdtree2_create(data,sort=.true.,rearrange=.true.)
    call cpu_time(t1)

    ! Query random vectors
    do idx = 1, r
      call kdtree2_n_nearest(tp=tree,qv=queries(:,idx),nn=1,results=results)
      idxs(idx) = results(1)%idx
    end do
    call cpu_time(t2)

    write(*,*) "Tree build (s): ", t1 - t0
    write(*,*) "Tree query (s): ", t2 - t1

    call kdtree2_destroy(tree)  
    deallocate(data)
    deallocate(queries)

  end do

end program
