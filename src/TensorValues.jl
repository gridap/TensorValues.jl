module TensorValues

using StaticArrays
using Base: @propagate_inbounds, @pure

export MultiValue
export TensorValue
export VectorValue

export inner, outer, meas
export det, inv

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

import LinearAlgebra: det, inv

include("Types.jl")

include("Indexing.jl")

include("Operations.jl")

include("Reinterpret.jl")

end # module
