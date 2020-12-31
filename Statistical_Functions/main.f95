! From Advance Fortran Programming
! https://www.youtube.com/watch?v=W-JCEoV0wng&list=PLNmACol6lYY4wPUNCK03LOwVTBbca7Ix-&index=3

! Program for demonstrating statistical functions
program stats
    use stat_funcs
    implicit none
    ! Simple printing of strings 
    character :: name1*10 = " Fortran " ! 10 units long
    character :: name2*10 = "C++", name6*10
    character ::name3*20, name4*20, name5*10 = " String s "

    10 format("Name ", i1, " is:",A10," Name ", i1," is:",A10, "_Check") ! i1 = integer 1 value, A10 = character of 10 units long, 10 = label 10
    20 format("Name 3 is:",A20," Name 4 is:",A20)

    print 10, 1, name1, 2, name2
    ! Concatenation of strings
    name3 = name1//name2 ! String concatenation
    name4 = trim(name1)//trim(name2) 
    name6 = adjustl(name5) ! Adjusting the length of the string by removing trailing spaces from front and back. Only trailing spaces from the formatting is present

    print 20,name3, name4 
    print 10,5,name5,6,name6
    print *, "length of string is:" , len(" string s")
    print *, name1              ! Printing part of the string
    print *,name1(:6)
    print *,name1(6:)
    print *,name1(4:7)
end program stats