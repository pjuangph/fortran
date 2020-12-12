function RandomArray(n)
    implicit none
    integer(kind=16) :: n
    integer,parameter :: seed = 86456
    integer(kind=16) :: i 
    real, dimension (:), allocatable :: RandomArray    
    allocate ( RandomArray(n) )      

    call srand(seed)
    do i=1,n
        RandomArray(i) = rand()
    end do
end function RandomArray