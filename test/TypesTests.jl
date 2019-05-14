module NDimValuesTests

using TensorValues
using Test
using StaticArrays

# Constructors (MultiValue)

a = SArray{Tuple{3,2}}((1,2,3,4,5,6))

v = MultiValue(a)
@test isa(v,MultiValue{Tuple{3,2},Int})
@test v.array === a

v = MultiValue{Tuple{3,2}}((1,2,3,4,5,6))
@test isa(v,MultiValue{Tuple{3,2},Int})
@test v.array == a

v = MultiValue{Tuple{3,2}}(1,2,3,4,5,6)
@test isa(v,MultiValue{Tuple{3,2},Int})
@test v.array == a

v = MultiValue{Tuple{3,2},Float64}((1,2,3,4,5,6))
@test isa(v,MultiValue{Tuple{3,2},Float64})
@test v.array == a

v = MultiValue{Tuple{3,2},Float64}(1,2,3,4,5,6)
@test isa(v,MultiValue{Tuple{3,2},Float64})
@test v.array == a

# Constructors (TensorValue)

t = TensorValue{2}((1,2,3,4))
@test isa(t,TensorValue{2,Int})
@test t.array == [1 3;2 4]

t = TensorValue{2,Float64}((1,2,3,4))
@test isa(t,TensorValue{2,Float64})
@test t.array == [1 3;2 4]

t = TensorValue{2}(1,2,3,4)
@test isa(t,TensorValue{2,Int})
@test t.array == [1 3;2 4]

t = TensorValue{2,Float64}(1,2,3,4)
@test isa(t,TensorValue{2,Float64})
@test t.array == [1 3;2 4]

t = TensorValue(1,2,3,4)
@test isa(t,TensorValue{2,Int})
@test t.array == [1 3;2 4]

# Constructors (VectorValue)

g = VectorValue{4}((1,2,3,4))
@test isa(g,VectorValue{4,Int})
@test g.array == [1,2,3,4]

g = VectorValue{4,Float64}((1,2,3,4))
@test isa(g,VectorValue{4,Float64})
@test g.array == [1,2,3,4]

g = VectorValue{4}(1,2,3,4)
@test isa(g,VectorValue{4,Int})
@test g.array == [1,2,3,4]

g = VectorValue{4,Float64}(1,2,3,4)
@test isa(g,VectorValue{4,Float64})
@test g.array == [1,2,3,4]

g = VectorValue(1,2,3,4)
@test isa(g,VectorValue{4,Int})
@test g.array == [1,2,3,4]

# Initializers

z = zero(MultiValue{Tuple{3,2},Int,2,6})
@test isa(z,MultiValue{Tuple{3,2},Int,2,6})
@test z.array == zeros(Int,(3,2))

z = zero(TensorValue{3,Int,9})
@test isa(z,TensorValue{3,Int,9})
@test z.array == zeros(Int,(3,3))

z = zero(VectorValue{3,Int})
@test isa(z,VectorValue{3,Int})
@test z.array == zeros(Int,3)

z = one(TensorValue{3,Int,9})
@test isa(z,TensorValue{3,Int,9})
@test z.array == [1 0 0; 0 1 0; 0 0 1]

# Custom type printing

s = "MultiValue{Tuple{3,2},Float64,2,6}(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)"
@test string(v) == s

s = "TensorValue{2,Int64,4}(1, 2, 3, 4)"
@test string(t) == s

s = "VectorValue{4,Int64}(1, 2, 3, 4)"
@test string(g) == s

end # module NDimValuesTests
