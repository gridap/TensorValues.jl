module TensorValuesTests

using TensorValues
using Test

@testset "TypesTests" begin
  include("TypesTests.jl")
end

@testset "OperationsTests" begin
  include("OperationsTests.jl")
end

@testset "IndexingTests" begin
  include("IndexingTests.jl")
end

end # module TensorValuesTests
