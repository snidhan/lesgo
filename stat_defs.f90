!**********************************************************************
module stat_defs
!**********************************************************************
use types, only : rprec
save
public

!  Reynolds stresses
type rs
  logical :: calc=.false.
  real(rprec), pointer, dimension(:,:,:) :: up2, vp2, wp2, & 
                                                     upwp, vpwp, upvp
end type rs

!  Sums performed over time
type tstats
  logical :: calc=.false.
  logical :: started=.false.
  integer :: nstart, nend, nskip
  real(rprec), pointer, dimension(:,:,:) :: u, v, w, &
    u2, v2, w2, uw, vw, uv, dudz
  real(rprec), pointer, dimension(:) :: u_avg, v_avg, w_avg
end type tstats	
  
!  Instantaneous Variables Storage (Parameters for storing velocity 
!  component values each time step)
type point
  logical :: calc=.false.
  logical :: started=.false.
  integer :: nstart, nend, nloc, nskip
  integer, dimension(10) :: coord=-1, istart=-1, jstart=-1, kstart=-1
  real(rprec), dimension(10) :: xdiff, ydiff, zdiff
  real(rprec), dimension(3,10) :: xyz=-1._rprec
  character(64), dimension(10) :: fname
end type

!  Instantaneous velocity global declarations
type domain
  logical :: calc=.false.
  logical :: started=.false.
  integer :: nstart, nend, nskip
end type domain  
  
!  Planar stats/data
type plane
  logical :: calc=.false.
  logical :: started=.false.
  integer :: nloc, nstart, nend, nskip
  integer, dimension(10) :: istart=-1, coord=-1
!   real(rprec) :: fa
  real(rprec), dimension (10) :: loc, ldiff
!   real(rprec), pointer, dimension(:,:,:) :: ua, va, wa
end type plane
  
type(rs)            		:: rs_t
type(tstats)        		:: tavg_t, tsum_t
type(tstats)        	 	:: zplane_avg_t
type(point), target 	:: point_t
type(domain)        		:: domain_t
type(plane)         		:: yplane_t, zplane_t

end module stat_defs

