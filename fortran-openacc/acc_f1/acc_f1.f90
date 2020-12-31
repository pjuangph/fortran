! 
!     Copyright (c) 2017, NVIDIA CORPORATION.  All rights reserved.
!
! NVIDIA CORPORATION and its licensors retain all intellectual property
! and proprietary rights in and to this software, related documentation
! and any modifications thereto.  Any use, reproduction, disclosure or
! distribution of this software and related documentation without an express
! license agreement from NVIDIA CORPORATION is strictly prohibited.
! 

program main
    implicit none
    integer :: n        ! size of the vector
    real,dimension(:),allocatable :: a, r, e
    integer :: i, nerrors
    character(10) :: arg1
    if( command_argument_count() .gt. 0 )then
        call get_command_argument( 1, arg1 )
        read(arg1,'(i10)') n
    else
        n = 100000
    endif
    if( n .le. 0 ) n = 100000
    allocate(a(n), r(n), e(n))
    do i = 1,n
        a(i) = i*2.0
    enddo
    !$acc kernels loop
        do i = 1,n
            r(i) = a(i) * 2.0
        enddo

        do i = 1,n
            e(i) = a(i) * 2.0
        enddo
    ! check the results
    nerrors = 0
    do i = 1,n
        if( r(i) .ne. e(i) )then
            print *, i, r(i), e(i)
            print *, "Test FAILED"
            stop 'error found'
        endif
    enddo
    print *, n, 'iterations completed'
    if (nerrors .eq. 0) then
       print *, "Test PASSED"
    endif
end program
