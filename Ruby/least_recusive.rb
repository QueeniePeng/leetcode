# Given an array of integers, return an array containing the integer that occurs the least number of times. If there are multiple answers, return all possibilities within the resulting array sorted in ascending order. When no solution can be deduced, return an empty array.

# Example Input

# [10, 941, 13, 13, 13, 941]
# Example Output

# [10]
# Explanation

# The number 10 occurs only once while every other number occurs more than once.

def solution(numbers)
  return [] if !numbers || numbers.length.zero?

  ans = []
  h = Hash.new { |hash, key| hash[key] = 0 }
  numbers.each { |num| h[num] += 1 } # or h = nums.tally

  count = numbers.length
  h.each_pair do |k, v|
    ans << k if count == v
    next unless count > v

    ans = []
    ans << k
    count = [count, v].min
  end
  ans
end

require 'test/unit'

class TestSolution < Test::Unit::TestCase
  def test_
    assert_equal [10], solution([10, 941, 13, 13, 13, 941])
    assert_equal [10, 941, 13], solution([10, 941, 13])
    assert_equal [1], solution([1, 2, 2, 2, 3, 3])
  end
end
