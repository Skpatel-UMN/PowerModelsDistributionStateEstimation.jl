################################################################################
#  Copyright 2020, Tom Van Acker, Marta Vanin                                  #
################################################################################
# PowerModelsDSSE.jl                                                           #
# An extention package of PowerModelsDistribution.jl for Static Distribution   #
# System State Estimation.                                                     #
# See http://github.com/timmyfaraday/PowerModelsDSSE.jl                        #
################################################################################

# using pkgs
using Ipopt, SCS
using JuMP
using PowerModels
using PowerModelsDistribution
using PowerModelsDSSE
using Test

# pkg const
const _JMP = JuMP
const _PMs = PowerModels
const _PMD = PowerModelsDistribution
const _PMS = PowerModelsDSSE

# set solvers
ipopt_solver = _JMP.optimizer_with_attributes(Ipopt.Optimizer,"max_cpu_time"=>300.0,
                                                              "tol"=>1e-10,
                                                              "print_level"=>0)

scs_solver = optimizer_with_attributes(SCS.Optimizer, "max_iters"=>20000, "eps"=>1e-5,
                                                            "alpha"=>0.4, "verbose"=>0)

@testset "PowerModelsDSSE" begin

    include("estimation_criteria.jl")
    include("mixed_measurements.jl")
    include("non_exact_forms.jl")
    include("power_flow.jl")
    include("with_errors.jl")

end