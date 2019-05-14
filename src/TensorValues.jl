module TensorValues

using StaticArrays
using Base: @propagate_inbounds

export MultiValue
export TensorValue
export VectorValue

export inner, outer, meas
export det, inv

import Base: show
import Base: zero, one
import Base: +, -, *, /, \, ==, ≈
import Base: getindex, iterate, eachindex
import Base: size, length, eltype

import LinearAlgebra: det, inv

include("Types.jl")

include("Indexing.jl")

include("Operations.jl")

end # module
