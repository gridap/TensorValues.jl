# TensorValues

[![Build Status](https://travis-ci.com/lssc-team/TensorValues.jl.svg?branch=master)](https://travis-ci.com/lssc-team/TensorValues.jl)
[![Codecov](https://codecov.io/gh/lssc-team/TensorValues.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/lssc-team/TensorValues.jl)

If you ❤️ this project, give us a ⭐️!

**TensorValues** provides the types `VectorValue` (a 1-st order tensor), `TensorValue` (a 2-nd order tensor) and `MultiValue` (a generalization of `VectorValue` and `TensorValue`) and common tensor operations defined on these types (e.g., dot product, inner product, outer product, etc.)

## Why

The main feature of the **TensorValues** package is that the provided do not extend from `AbstractArray`, but from `Number`!

This allows one to work with them as if they were scalar values in broadcasted operations on arrays of `VectorValue` objects (also for `TensorValue` or `MultiValue` objects). For instance, one can perform the following manipulations:
```julia
# Assing a VectorValue to all the entries of an Array of VectorValues
A = zeros(VectorValue{2,Int}, (4,5))
v = VectorValue(12,31)
A .= v # This is posible since  VectorValue <: Number

# Broatcasing of tensor operations in arrays of TensorValues
t = TensorValue(13,41,53,17) # creates a 2x2 TensorValue
g = TensorValue(32,41,3,14) # creates another 2x2 TensorValue
B = fill(t,(1,5))
C = inner.(g,B) # inner product of g against all TensorValues in the array B
@show C
# C = [2494 2494 2494 2494 2494]
```

## Installation
```julia
Pkg.add("TensorValues")
```
