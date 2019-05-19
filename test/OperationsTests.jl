module OperationsTests

using Test
using TensorValues

a = VectorValue(1,2,3)
b = VectorValue(2,1,6)

# Comparison

@test a==a
@test a ≈ a
@test a!=b
@test [a,a] == [a,a]
@test [a,a] ≈ [a,a]

# Addition / subtraction

c = +a
r = VectorValue(1,2,3)
@test c == r

c = -a
r = VectorValue(-1,-2,-3)
@test c == r

c = a + b
r = VectorValue(3,3,9)
@test c == r

c = a - b
r = VectorValue(-1,1,-3)
@test c == r

# Matrix Division

t = one(TensorValue{3,Int,9})

c = t\a

@test c == a

# Scaling by a scalar

a = VectorValue(1,2,3)
r = VectorValue(2,4,6)

c = 2 * a
@test isa(c,VectorValue{3,Int})
@test c == r

c = a * 2
@test isa(c,VectorValue{3,Int})
@test c == r

# Dot product (simple contraction)

a = VectorValue(1,2,3)
b = VectorValue(2,1,6)

t = TensorValue(1,2,3,4,5,6,7,8,9)
s = TensorValue(9,8,3,4,5,6,7,2,1)

c = a * b
@test isa(c,Int)
@test c == 2+2+18

c = t * a
@test isa(c,VectorValue{3,Int})
r = VectorValue(30,36,42)
@test c == r

c = s * t
@test isa(c,TensorValue{3,Int})
r = TensorValue(38,24,18,98,69,48,158,114,78)
@test c == r

# Inner product (full contraction)

c = inner(2,3)
@test c == 6

c = inner(a,b)
@test isa(c,Int)
@test c == 2+2+18

c = inner(t,s)
@test isa(c,Int)
@test c == 185

# Outer product (aka dyadic product)

a = VectorValue(1,2,3)
e = VectorValue(2,5)

c = outer(2,3)
@test c == 6

r = VectorValue(2,4,6)
c = outer(2,a)
@test isa(c,VectorValue{3,Int})
@test c == r

c = outer(a,2)
@test isa(c,VectorValue{3,Int})
@test c == r

c = outer(a,e)
@test isa(c,MultiValue{Tuple{3,2},Int})
r = MultiValue{Tuple{3,2},Int}(2,4,6,5,10,15)
@test c == r

# Linear Algebra

t = TensorValue(10,2,30,4,5,6,70,8,9)

c = det(t)
@test c ≈ -8802.0

c = inv(t)
@test isa(c,TensorValue{3})

# Measure

a = VectorValue(1,2,3)
c = meas(a)
@test c ≈ 3.7416573867739413

t = TensorValue(10,2,30,4,5,6,70,8,9)
c = meas(t)
@test c ≈ 8802.0
 
# Broadcasted operations

a = VectorValue(1,2,3)
b = VectorValue(2,1,6)

A = Array{VectorValue{3,Int},2}(undef,(4,5))
A .= a
@test A == fill(a,(4,5))

C = .- A

r = VectorValue(-1,-2,-3)
R = fill(r,(4,5))
@test C == R

B = fill(b,(4,1))

C = A .+ B

r = VectorValue(3,3,9)
R = fill(r,(4,5))
@test C == R

C = A .- B

r = VectorValue(-1,1,-3)
R = fill(r,(4,5))
@test C == R

end # module OperationsTests
