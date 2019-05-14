module TensorValues

using StaticArrays

export MultiValue
export TensorValue
export VectorValue

export inner, outer, meas
export det, inv

import Base: show
import Base: zero, one
import Base: +, -, *, /, \, ==, ≈
import LinearAlgebra: det, inv

include("Types.jl")

include("Operations.jl")

end # module
