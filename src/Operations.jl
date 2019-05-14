
# Comparison

function (==)(a::MultiValue,b::MultiValue)
  a.array == b.array
end

function (≈)(a::MultiValue,b::MultiValue)
  a.array ≈ b.array
end

# Addition / subtraction

for op in (:+,:-)
  @eval begin

    function ($op)(a::MultiValue{S}) where S
      r = $op(a.array)
      MultiValue(r)
    end

    function ($op)(a::MultiValue{S},b::MultiValue{S}) where S
      r = $op(a.array, b.array)
      MultiValue(r)
    end

  end
end

# Matrix Division

function (\)(a::TensorValue, b::MultiValue)
  r = a.array \ b.array
  MultiValue(r)
end

# Scaling by a scalar

function (*)(a::MultiValue,b::Real)
  r = a.array * b
  MultiValue(r)
end

function (*)(a::Real,b::MultiValue)
  r = a * b.array
  MultiValue(r)
end

# Dot product (simple contraction)

(*)(a::VectorValue{D}, b::VectorValue{D}) where D = inner(a,b)

function (*)(a::MultiValue,b::MultiValue)
  r = a.array * b.array
  MultiValue(r)
end

# Inner product (full contraction)

inner(a::Real,b::Real) = a*b

@generated function inner(a::MultiValue{S,T,N,L}, b::MultiValue{S,W,N,L}) where {S,T,N,L,W}
  str = join([" a.array.data[$i]*b.array.data[$i] +" for i in 1:L ])
  Meta.parse(str[1:(end-1)])
end

# Outer product (aka dyadic product)

outer(a::Real,b::Real) = a*b

outer(a::MultiValue,b::Real) = a*b

outer(a::Real,b::MultiValue) = a*b

@generated function outer(a::VectorValue{D},b::VectorValue{Z}) where {D,Z}
  str = join(["a.array[$i]*b.array[$j], " for j in 1:Z for i in 1:D])
  Meta.parse("MultiValue(SMatrix{$D,$Z}($str))")
end

# Linear Algebra

det(a::TensorValue) = det(a.array)

inv(a::TensorValue) = MultiValue(inv(a.array))

# Measure

meas(a::VectorValue) = sqrt(inner(a,a))

meas(a::TensorValue) = abs(det(a))

