
# Types

"""
Type representing a multi-dimensional value
"""
struct MultiValue{S,T,N,L}
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

@generated function TensorValue(args::Vararg{T,DD}) where {T,DD}
  SQ = sqrt(DD)
  D = ceil(Int,SQ)
  @assert D == SQ
  :( TensorValue{$D,T}(args...)  )
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

function VectorValue(args::Vararg{T,D}) where {T,D}
  VectorValue{D,T}(args)
end

# Custom type printing

function show(io::IO,::Type{<:MultiValue{S,T}}) where {S,T}
  print(io,"MultiValue{$S,$T}")
end

function show(io::IO,::Type{<:TensorValue{D,T}}) where {D,T}
  print(io,"TensorValue{$D,$T}")
end

function show(io::IO,::Type{<:VectorValue{D,T}}) where {D,T}
  print(io,"VectorValue{$D,$T}")
end

