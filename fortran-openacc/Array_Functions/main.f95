! From Advance Fortran Programming
! https://www.youtube.com/watch?v=Ey7mX94Cy_E&list=PLNmACol6lYY4wPUNCK03LOwVTBbca7Ix- 

! Program for demonstrating array operations
program array_funcs
    use maths1
    implicit none
    real*8::prod,sum1
    integer, parameter:: r=3,c=2
    real*8, dimension(1) :: dp
    real*8, dimension(r,c) :: a1
    real*8, dimension(r,r) :: a3
    real*8, dimension(c,r) :: at, a2
    real*8, dimension(r*c) :: b1, b2 

    a1 = reshape((/1,2,3,4,5,6/),(/r,c/))
    a2 = reshape((/1,2,3,4,5,6/),(/c,r/))
    b1 = reshape((/1,2,3,4,5,6/),(/r*c/))
    b2 = reshape((/1,2,3,4,5,6/),(/r*c/))

    dp = dot_product(b1,b2)
    at = transpose(a1)
    a3 = matmul(a1,a2) 
    prod = product(a1)
    sum1 = sum(a1) 

    print *, "The matrix a1 is: "
    call print_mat2(a1,r,c)

    print *, "The matrix a2 is: "
    call print_mat2(a2,c,r)

    print *, "Max value of a1 is: ", maxval(a1)
    print *, "Min value of a1 is: ", minval(a1)
    print *, "The sum of a1 is: ", sum1
    print *, "The prod of a1 is: ", prod

    print *, "The transpose of a1 is: "
    call print_mat2(at,c,r)

    print *, "The Matrix Multiplication of a1 and a2 is:"
    call print_mat2(a3,r,r)

    
    print *,SHAPE(a1)             ! (/ 3, 4 /)
    print *,SIZE(SHAPE(42))      ! (/ /)
end program array_funcs