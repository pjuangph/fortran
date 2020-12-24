! Common pitfalls with functions https://wusun.name/blog/2018-04-25-fortran-functions/ 
module M_AddNumbers
    contains
    real(kind=16) function AddNumbers(a,b)
        implicit none
        real(kind=16) :: a
        real(kind=16) :: b

        AddNumbers = a + b 
    end function AddNumbers

end module M_AddNumbers