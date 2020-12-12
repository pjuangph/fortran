module M_SubtractNumbers
    ! Using Modules inside of modules https://stackoverflow.com/questions/57127267/how-to-use-a-module-which-includes-another-module-in-fortran 

    use M_AddNumbers
    contains
    function SubtractNumbers(a,b)
        implicit none
        real(kind=16) :: a
        real(kind=16) :: b
        real(kind=16) :: SubtractNumbers

        SubtractNumbers = AddNumbers(a,-b)
    end function SubtractNumbers
end module M_SubtractNumbers