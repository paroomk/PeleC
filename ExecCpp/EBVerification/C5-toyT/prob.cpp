#include "prob.H"

namespace ProbParm {
AMREX_GPU_DEVICE_MANAGED amrex::Real p_init = 1013250.0; // 1 atm
AMREX_GPU_DEVICE_MANAGED amrex::Real T_init = 940.0;
AMREX_GPU_DEVICE_MANAGED amrex::Real rho_init1 = 0.0;
AMREX_GPU_DEVICE_MANAGED amrex::Real e_init1 = 0.0;
AMREX_GPU_DEVICE_MANAGED amrex::Real rho_init2 = 0.0;
AMREX_GPU_DEVICE_MANAGED amrex::Real e_init2 = 0.0;
AMREX_GPU_DEVICE_MANAGED amrex::GpuArray<amrex::Real, NUM_SPECIES> massfrac1 = {
  0.0};
AMREX_GPU_DEVICE_MANAGED amrex::GpuArray<amrex::Real, NUM_SPECIES> massfrac2 = {
  0.0};
} // namespace ProbParm

void
pc_prob_close()
{
}

extern "C" {
void
amrex_probinit(
  const int* init,
  const int* name,
  const int* namelen,
  const amrex_real* problo,
  const amrex_real* probhi)
{

  // Parse params
  amrex::ParmParse pp("prob");
  pp.query("p_init", ProbParm::p_init);
  pp.query("T_init", ProbParm::T_init);

  // Initial values
  ProbParm::massfrac1[0] = 1.0;
  ProbParm::massfrac2[0] = 1.0;
  EOS::PYT2RE(
    ProbParm::p_init, ProbParm::massfrac1.begin(), ProbParm::T_init,
    ProbParm::rho_init1, ProbParm::e_init1);
  EOS::PYT2RE(
    ProbParm::p_init, ProbParm::massfrac2.begin(), ProbParm::T_init + 100.0,
    ProbParm::rho_init2, ProbParm::e_init2);
}
}

#ifdef DO_PROBLEM_POST_TIMESTEP
void
PeleC::problem_post_timestep()
{
}
#endif

#ifdef DO_PROBLEM_POST_INIT
void
PeleC::problem_post_init()
{
}
#endif
