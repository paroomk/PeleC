set(PELEC_ENABLE_EB ON)
set(PELEC_ENABLE_REACTIONS ON)
set(PELEC_ENABLE_PARTICLES OFF)
set(PELEC_EOS_MODEL Fuego)
set(PELEC_CHEMISTRY_MODEL LiDryer)
set(PELEC_TRANSPORT_MODEL Simple)

#Generic stuff for every executable
get_filename_component(DIR_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
set(pelec_exe_name PeleC-${DIR_NAME})
include(BuildPeleCExe)
build_pelec_exe(${pelec_exe_name})
