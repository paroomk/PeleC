# ------------------  INPUTS TO MAIN PROGRAM  -------------------
max_step = 100
stop_time = 0.000005

# PROBLEM SIZE & GEOMETRY
geometry.is_periodic = 0 0 0
geometry.coord_sys   = 0  # 0 => cart, 1 => RZ  2=>spherical
geometry.prob_lo     =  -1.0 -1.0 -1.0
geometry.prob_hi     =   1.0  1.0  1.0
# use with single level
amr.n_cell           =  16    16    16

# >>>>>>>>>>>>>  BC FLAGS <<<<<<<<<<<<<<<<
# 0 = Interior           3 = Symmetry
# 1 = Inflow             4 = SlipWall
# 2 = Outflow            5 = NoSlipWall
# >>>>>>>>>>>>>  BC FLAGS <<<<<<<<<<<<<<<<
pelec.lo_bc       = "Hard" "Hard" "Hard"
pelec.hi_bc       = "Hard" "Hard" "Hard"

# WHICH PHYSICS
pelec.do_hydro = 1
pelec.diffuse_vel = 1
pelec.diffuse_temp = 1
pelec.do_mol = 1
pelec.do_react = 0
pelec.do_mms = 1
pelec.masa_solution_name = ad_cns_3d_les_sph

# TIME STEP CONTROL
pelec.cfl            = 0.1     # cfl number for hyperbolic system
pelec.init_shrink    = 0.3     # scale back initial timestep
pelec.change_max     = 1.1     # max time step growth
pelec.dt_cutoff      = 5.e-20  # level 0 timestep below which we halt

# DIAGNOSTICS & VERBOSITY
pelec.sum_interval   = 1       # timesteps between computing mass
pelec.v              = 1       # verbosity in PeleC.cpp
amr.v                = 1       # verbosity in Amr.cpp
amr.data_log         = datlog mmslog
#amr.grid_log        = grdlog  # name of grid logging file

# REFINEMENT / REGRIDDING
amr.max_level       = 0       # maximum level number allowed
#amr.max_level       = 1       # maximum level number allowed
amr.ref_ratio       = 2 2 2 2 # refinement ratio
amr.regrid_int      = 2 2 2 2 # how often to regrid
amr.blocking_factor = 4       # block factor in grid generation
amr.max_grid_size   = 8
amr.n_error_buf     = 2 2 2 2 # number of buffer cells in error est

# CHECKPOINT FILES
amr.check_file      = chk        # root name of checkpoint file
amr.check_int       = 1000        # number of timesteps between checkpoints

# PLOTFILES
amr.plot_file       = plt        # root name of plotfile
amr.plot_int        = 1000        # number of timesteps between plotfiles
amr.plot_vars  =  density Temp
amr.derive_plot_vars = x_velocity y_velocity z_velocity magvel magvort pressure rhommserror ummserror vmmserror wmmserror pmmserror vfrac

# PROBLEM PARAMETERS
prob.rho_x_fact = 0.0

# EB
eb2.geom_type = sphere
eb2.sphere_radius = 0.25
eb2.sphere_center = 0.0 0.0  0.0
eb2.sphere_has_fluid_inside = 0
pelec.eb_isothermal = 0
eb_verbosity = 1
ebd.boundary_grad_stencil_type=0

# Tiling
#fabarray.mfiter_tile_size = 1024 1024 1024
