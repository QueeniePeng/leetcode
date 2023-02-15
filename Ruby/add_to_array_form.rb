# 989. Add to Array-Form of Integer
# Easy
# 2.6K
# 223
# Companies
# The array-form of an integer num is an array representing its digits in left to right order.

# For example, for num = 1321, the array form is [1,3,2,1].
# Given num, the array-form of an integer, and an integer k, return the array-form of the integer num + k.

# Example 1:

# Input: num = [1,2,0,0], k = 34
# Output: [1,2,3,4]
# Explanation: 1200 + 34 = 1234
# Example 2:

# Input: num = [2,7,4], k = 181
# Output: [4,5,5]
# Explanation: 274 + 181 = 455
# Example 3:

# Input: num = [2,1,5], k = 806
# Output: [1,0,2,1]
# Explanation: 215 + 806 = 1021

# Constraints:

# 1 <= num.length <= 104
# 0 <= num[i] <= 9
# num does not contain any leading zeros except for the zero itself.
# 1 <= k <= 104

# @param {Integer[]} num
# @param {Integer} k
# @return {Integer[]}
def add_to_array_form(num, k)
  (num.join.to_i + k).digits.reverse
end

require 'test/unit'

class TestAddToArrayForm < Test::Unit::TestCase
  def test_
    assert_equal [1, 2, 3, 4], add_to_array_form([1, 2, 0, 0], 34)
    assert_equal [4, 5, 5], add_to_array_form([2, 7, 4], 181)
    assert_equal [1, 0, 2, 1], add_to_array_form([2, 1, 5], 806)
  end
end
