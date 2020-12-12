PROGRAM Main    
    use M_AddNumbers
    use M_SubtractNumbers
    use M_FastLoop
    implicit none

    real(kind=16)::a = 4.5
    real(kind=16)::b = 80.5
    real(kind=16)::c
    real(kind=16)::d
    c =  AddNumbers(a,b)
    d = SubtractNumbers(a,b)
    print *,'Add Numbers ',a,' + ',b,' = ',c
    print *,'Subtract Numbers ',a,' - ',b,' = ',d

    call FastLoop()
    stop
END PROGRAM Main