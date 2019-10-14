module TensorValues

using StaticArrays
using Base: @propagate_inbounds, @pure

export MultiValue
export TensorValue
export VectorValue

export inner, outer, meas
export det, inv, tr, dot, norm
export mutable
export trace
export symmetic_part

import Base: show
import Base: zero, one
import Base: +, -, *, /, \, ==, ≈
import Base: conj
import Base: sum, maximum, minimum
import Base: getindex, iterate, eachindex
import Base: size, length, eltype
import Base: reinterpret
import Base: convert
import Base: CartesianIndices
import Base: LinearIndices
import Base: adjoint

import LinearAlgebra: det, inv, tr, dot, norm

include("Types.jl")

include("Indexing.jl")

include("Operations.jl")

include("Reinterpret.jl")

end # module
