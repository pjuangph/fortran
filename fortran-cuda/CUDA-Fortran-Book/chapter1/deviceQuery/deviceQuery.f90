! 
!     Copyright (c) 2017, NVIDIA CORPORATION.  All rights reserved.
!
! NVIDIA CORPORATION and its licensors retain all intellectual property
! and proprietary rights in and to this software, related documentation
! and any modifications thereto.
!
!
!    These example codes are a portion of the code samples from the companion
!    website to the book "CUDA Fortran for Scientists and Engineers":
!
! http://store.elsevier.com/product.jsp?isbn=9780124169708
!

program deviceQuery
     use cudafor
     implicit none
   
     type (cudaDeviceProp) :: prop
     integer :: nDevices=0, i, ierr
   
     ! Number of CUDA-capable devices
   
     ierr = cudaGetDeviceCount(nDevices)
   
     if (nDevices == 0) then
        write(*,"(/,'No CUDA devices found',/)")
        stop
     else if (nDevices == 1) then
        write(*,"(/,'One CUDA device found',/)")
     else 
        write(*,"(/,i0,' CUDA devices found',/)") nDevices
     end if
   
     ! Loop over devices
     
     do i = 0, nDevices-1
   
        write(*,"('Device Number: ',i0)") i
   
        ierr = cudaGetDeviceProperties(prop, i)
        if (ierr .eq. 0) then
           write(*,"('  GetDeviceProperties for device ',i0,': Passed')") i
        else
           write(*,"('  GetDeviceProperties for device ',i0,': Failed')") i
        endif
   
        ! General device info
   
        write(*,"('  Device Name: ',a)") trim(prop%name)
        write(*,"('  Compute Capability: ',i0,'.',i0)") &
             prop%major, prop%minor
        write(*,"('  Number of Multiprocessors: ',i0)") &
             prop%multiProcessorCount
        write(*,"('  Max Threads per Multiprocessor: ',i0)") &
             prop%maxThreadsPerMultiprocessor
        write(*,"('  Global Memory (GB): ',f9.3,/)") &
             prop%totalGlobalMem/1024.0**3
   
        ! Execution Configuration
   
        write(*,"('  Execution Configuration Limits')")
        write(*,"('    Max Grid Dims: ',2(i0,' x '),i0)") &
             prop%maxGridSize
        write(*,"('    Max Block Dims: ',2(i0,' x '),i0)") &
             prop%maxThreadsDim
        write(*,"('    Max Threads per Block: ',i0,/)") &
             prop%maxThreadsPerBlock
   
     enddo
   
   end program deviceQuery
   