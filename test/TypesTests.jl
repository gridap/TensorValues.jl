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

# Custom type printing

s = "MultiValue{Tuple{3,2},Float64}(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)"
@test string(v) == s

s = "TensorValue{2,Int64}(1, 2, 3, 4)"
@test string(t) == s

s = "VectorValue{4,Int64}(1, 2, 3, 4)"
@test string(g) == s

end # module NDimValuesTests
