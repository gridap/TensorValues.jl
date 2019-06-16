
# Types

"""
Type representing a multi-dimensional value
"""
struct MultiValue{S,T,N,L} <: Number
  array::SArray{S,T,N,L}
end

"""
Type representing a second-order tensor
"""
const TensorValue{D,T,L} = MultiValue{Tuple{D,D},T,2,L}

"""
Type representing a first-order tensor
"""
const VectorValue{D,T} = MultiValue{Tuple{D},T,1,D}

# Constructors (MultiValue)

function (::Type{MultiValue{S}})(x::Tuple) where S<:Tuple
  array = SArray{S}(x)
  MultiValue(array)
end

function (::Type{MultiValue{S,T}})(x::Tuple) where {S<:Tuple,T}
  array = SArray{S,T}(x)
  MultiValue(array)
end

function (::Type{MultiValue{S}})(x::Vararg) where S<:Tuple
  MultiValue{S}(x)
end

function (::Type{MultiValue{S,T}})(x::Vararg) where {S<:Tuple,T}
  MultiValue{S,T}(x)
end

function MultiValue(a::StaticArray{S,T}) where {S,T}
  MultiValue{S,T}(a.data)
end

# Constructors (TensorValue)

function (::Type{TensorValue{D}})(x::Tuple) where D
  S = Tuple{D,D}
  MultiValue{S}(x)
end

function (::Type{TensorValue{D,T}})(x::Tuple) where {D,T}
  S = Tuple{D,D}
  MultiValue{S,T}(x)
end

function (::Type{TensorValue{D}})(x::Vararg) where D
  TensorValue{D}(x)
end

function (::Type{TensorValue{D,T}})(x::Vararg) where {D,T}
  TensorValue{D,T}(x)
end

@generated function TensorValue(arg::NTuple{DD,T}) where {T,DD}
  SQ = sqrt(DD)
  D = ceil(Int,SQ)
  @assert D == SQ
  :( TensorValue{$D,T}(arg)  )
end

function TensorValue(args::Vararg)
  TensorValue(args)
end

function TensorValue(a::StaticArray)
  TensorValue(a.data)
end

# Constructors (VectorValue)

function (::Type{VectorValue{D}})(x::Tuple) where D
  S = Tuple{D}
  MultiValue{S}(x)
end

function (::Type{VectorValue{D,T}})(x::Tuple) where {D,T}
  S = Tuple{D}
  MultiValue{S,T}(x)
end

function (::Type{VectorValue{D}})(x::Vararg{Any,D}) where D
  VectorValue{D}(x)
end

function (::Type{VectorValue{D,T}})(x::Vararg{Any,D}) where {D,T}
  VectorValue{D,T}(x)
end

function VectorValue(arg::NTuple{D,T}) where {D,T}
  VectorValue{D,T}(arg)
end

function VectorValue(args::Vararg)
  VectorValue(args)
end

function VectorValue(a::StaticArray)
  VectorValue(a.data)
end

# Initializers

function zero(::Type{<:MultiValue{S,T,N,L}}) where {S,T,N,L}
  z = zero(SArray{S,T,N,L})
  MultiValue{S,T,N,L}(z)
end

function one(::Type{<:MultiValue{S,T,N,L}}) where {S,T,N,L}
  z = one(SArray{S,T,N,L})
  MultiValue{S,T,N,L}(z)
end

# Conversions

function convert(::Type{<:MultiValue{S,T,N,L}},a::StaticArray{S,T,N}) where {S,T,N,L}
  MultiValue(a)
end

function convert(
  ::Type{<:MultiValue{S,T,N,L}},a::AbstractArray{T,N}) where {S,T,N,L}
  b = convert(SArray{S,T,N,L},a)
  MultiValue(b)
end

# Misc operations on the type itself

length(::Type{<: MultiValue{S,T,N,L} where {S,T,N}}  ) where L = L

function size(::Type{MultiValue{S,T,N,L}}) where {S,T,N,L}
  A = SArray{S,T,N,L}
  size(A)
end

function size(::Type{<:MultiValue{S}}) where S
  _s(Size(S))
end

@pure _s(s::Size{T}) where T = T

# Custom type printing

function show(io::IO,v::MultiValue)
  print(io,typeof(v))
  print(io,v.array.data)
end

