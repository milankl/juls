"""

    u,v,η,sst = RunJuls()

runs Juls with default parameters as defined in src/DefaultParameters.jl

# Examples
```jldoc
julia> u,v,η,sst = RunJuls(Float64,nx=200,output=true)
```
"""
function RunJuls(::Type{T}=Float32;     # number format
    kwargs...                           # all additional parameters
    ) where {T<:AbstractFloat}

    P = Parameter(T=T;kwargs...)
    return RunJuls(T,P)
end

function RunJuls(P::Parameter)
    @unpack T = P
    return RunJuls(T,P)
end

function RunJuls(::Type{T},P::Parameter) where {T<:AbstractFloat}

    @unpack Tprog = P

    G = Grid{T,Tprog}(P)
    C = Constants{T,Tprog}(P,G)
    F = Forcing{T}(P,G)
    S = ModelSetup{T}(P,G,C,F)

    Prog = initial_conditions(Tprog,S)
    Diag = preallocate(T,Tprog,G)

    Prog = time_integration(T,Prog,Diag,S)
    return Prog
end
