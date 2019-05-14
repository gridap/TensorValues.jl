
size(a::MultiValue) = size(a.array)

length(a::MultiValue) = length(a.array)

@propagate_inbounds function getindex(
    a::MultiValue{S,T,N}, I::Vararg{Integer,N}) where {S,T,N}
    @inbounds a.array[I...]
end

@propagate_inbounds function getindex(a::MultiValue, i::Integer)
    @inbounds a.array[i]
end

eltype(a::Type{MultiValue{S,T,N,L}}) where {S,T,N,L} = T

iterate(a::MultiValue) = iterate(a.array)

iterate(a::MultiValue, state) = iterate(a.array, state)

eachindex(a::MultiValue) = eachindex(a.array)
