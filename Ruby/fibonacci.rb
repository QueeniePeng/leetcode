# Given a number n, print all the prime numbers that are in the first n Fibonacci numbers.

# Example Input:

# n = 6
# Example Output:

# [2, 3, 5]
# Explanation:

# The first 6 Fibonacci numbers are 1 1 2 3 5 8 but only 2, 3 and 5 are primes.

require 'Prime'
require 'set'

# def solution(n)
#   prime = Prime.first(n).to_set
#   numbers = fibonacci(n)
#   res = []
#   numbers.each do |num|
#     res << num if prime.include?(num)
#   end
#   res
# end

def solution(n)
  numbers = fibonacci(n)
  res = []

  print numbers
  numbers.each do |num|
    res << num if prime(num)
  end
  res
end

def prime(n)
  return false if n < 2

  (2..n / 2).none? { |i| (n % i).zero? }
end

def fibonacci(x)
  ans = []
  first = 0
  second = 1
  x.times do
    first, second = second, first + second
    ans << first
  end
  ans
end

require 'test/unit'

class TestSolution < Test::Unit::TestCase
  def test_
    assert_equal [2, 3, 5], solution(6)
    assert_equal [2], solution(3)
  end
end
