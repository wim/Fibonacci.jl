using Fibonacci
using Test

@testset "Fibonacci algorithm implementations" begin
    
    @testset "fib_fast_doubling" begin
        @test_throws DomainError fib_fast_doubling(-5)
        @test 0 == fib_fast_doubling(0)
        @test 1 == fib_fast_doubling(1)
        @test 5 == fib_fast_doubling(5)
        @test 55 == fib_fast_doubling(10)
        @test 832040 == fib_fast_doubling(30)
    end
    @testset "fib" begin
        @test 55 == fib(10)
    end
    @testset "fib_array_sum" begin
        @test_throws DomainError fib_array_sum(-5)
        @test 55 == fib_array_sum(10)
        @test 0 == fib_array_sum(0)
        @test 1 == fib_array_sum(1)
        @test 5 == fib_array_sum(5)
        @test 832040 == fib_array_sum(30)
    end
    @testset "fib_julialang" begin
        @test_throws DomainError fib_julialang(-5)
        @test 55 == fib_julialang(10)
        @test 0 == fib_julialang(0)
        @test 1 == fib_julialang(1)
        @test 5 == fib_julialang(5)
    end

    @testset "fib_array_gen" begin
        @test_throws DomainError fib_array_gen(-3)
        @test 0 == fib_array_gen(0)
        @test 1 == fib_array_gen(1)
        @test 5 == fib_array_gen(5)
        @test 55 == fib_array_gen(10)
    end

end
