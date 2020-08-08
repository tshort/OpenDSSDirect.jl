
module OpenDSSDirect

__precompile__(false)

export ActiveClass
export Basic
export Bus
export CapControls
export Capacitors
export Circuit
export CktElement
export Element
export Error
export Executive
export Fuses
export Generators
export Isource
export LineCodes
export Lines
export Loads
export LoadShape
export Meters
export Monitors
export Parser
export PDElements
export Progress
export Properties
export PVsystems
export Reclosers
export RegControls
export Relays
export Sensors
export Settings
export Solution
export SwtControls
export Text
export Topology
export Transformers
export Vsources
export XYCurves
export YMatrix

export dss

import Libdl

if get(ENV, "DSS_EXTENSIONS_DEBUG", "0") == "1"
    LIBRARY_SUFFIX = "d"
    @warn "Environment variable DSS_EXTENSIONS_DEBUG=1 is set: loading the debug version of DSS C-API library"
else
    LIBRARY_SUFFIX = ""
end

if Sys.iswindows()
    const LIBRARY = abspath(joinpath(@__DIR__, "../deps/windows/dss_capi_v7$(LIBRARY_SUFFIX).dll"))
    const KLUSOLVE_LIBRARY = abspath(joinpath(@__DIR__, "../deps/windows/libklusolve.dll"))
elseif Sys.islinux()
    const LIBRARY = abspath(joinpath(@__DIR__, "../deps/linux/libdss_capi_v7$(LIBRARY_SUFFIX).so"))
    const KLUSOLVE_LIBRARY = abspath(joinpath(@__DIR__, "../deps/linux/libklusolve.so"))
elseif Sys.isapple()
    const LIBRARY = abspath(joinpath(@__DIR__, "../deps/apple/libdss_capi_v7$(LIBRARY_SUFFIX).dylib"))
    const KLUSOLVE_LIBRARY = abspath(joinpath(@__DIR__, "../deps/apple/libklusolve.dylib"))
else
    error("Unknown operating system. Cannot use OpenDSSDirect")
end

module Lib

    using CEnum

    import ..OpenDSSDirect: LIBRARY

    include("lib.jl")
    include("common.jl")
    include("extensions.jl")

end

include("utils.jl")

include("activeclass.jl")
include("basic.jl")
include("bus.jl")
include("cap_controls.jl")
include("capacitors.jl")
include("circuit.jl")
include("ckt_element.jl")
include("ctrl_queue.jl")
include("element.jl")
include("error.jl")
include("executive.jl")
include("fuses.jl")
include("generators.jl")
include("isource.jl")
include("linecodes.jl")
include("lines.jl")
include("loads.jl")
include("loadshape.jl")
include("meters.jl")
include("monitors.jl")
include("parser.jl")
include("pdelements.jl")
include("progress.jl")
include("properties.jl")
include("pvsystems.jl")
include("reclosers.jl")
include("reg_controls.jl")
include("relays.jl")
include("sensors.jl")
include("settings.jl")
include("solution.jl")
include("swt_controls.jl")
include("text.jl")
include("topology.jl")
include("transformers.jl")
include("vsources.jl")
include("xycurves.jl")
include("ymatrix.jl")

include("repl.jl")
include("iterators.jl")

const dss = OpenDSSDirect.Text.Command

using .Utils

function __init__()

    if Libdl.dlopen(KLUSOLVE_LIBRARY) == C_NULL
        error("$KLUSOLVE_LIBRARY cannot be opened. Please check 'deps/build.log' for more information.")
    end

    if Libdl.dlopen(LIBRARY) == C_NULL
        error("$LIBRARY cannot be opened. Please check 'deps/build.log' for more information.")
    end

    if !Sys.islinux()
        global commandhelp = Dict{String, String}()
        for i in 1:OpenDSSDirect.Executive.NumCommands()
            commandhelp[lowercase(OpenDSSDirect.Executive.Command(i))] = OpenDSSDirect.Executive.CommandHelp(i)
        end
        global optionhelp = Dict{String, String}()
        for i in 1:OpenDSSDirect.Executive.NumOptions()
            optionhelp[lowercase(OpenDSSDirect.Executive.Option(i))] = OpenDSSDirect.Executive.OptionHelp(i)
        end

        if !("OPENDSSDIRECT_REPL" in keys(ENV) && ENV["OPENDSSDIRECT_REPL"] == "false")
            if isdefined(Base, :active_repl)
                OpenDSSDirect.Repl.run_dss_repl()
            end
        end
    end

end


end # module
