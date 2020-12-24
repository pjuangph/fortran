! L2 Norm of a vector
! All function arguments are intent(in) 
function vector_norm(n,vec) result(norm)
    implicit none
    integer, intent(in) :: n
    real, intent(in) :: vec(n)
    real :: norm

    norm = sqrt(sum(vec**2))

end function vector_norm