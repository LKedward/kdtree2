!
!(c) Matthew Kennel, Institute for Nonlinear Science (2004)
!
! Licensed under the Academic Free License version 1.1 found in file LICENSE
! with additional provisions found in that same file.
!
module kdtree2_precision_module
  
  integer, parameter :: sp = kind(0.0)
  integer, parameter :: dp = kind(0.0d0)

  private :: sp, dp

  !
  ! You must comment out exactly one
  ! of the two lines.  If you comment
  ! out kdkind = sp then you get single precision
  ! and if you comment out kdkind = dp 
  ! you get double precision.
  !

  integer, parameter :: kdkind = sp  
  !integer, parameter :: kdkind = dp  
  public :: kdkind

end module kdtree2_precision_module