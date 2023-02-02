# Given an integer n, return true if it is a power of two. Otherwise, return false.

# An integer n is a power of two, if there exists an integer x such that n == 2x.

 

# Example 1:

# Input: n = 1
# Output: true
# Explanation: 20 = 1
# Example 2:

# Input: n = 16
# Output: true
# Explanation: 24 = 16
# Example 3:

# Input: n = 3
# Output: false
 

# Constraints:

# -231 <= n <= 231 - 1
 

# Follow up: Could you solve it without loops/recursion?

# @param {Integer} n
# @return {Boolean}

def is_power_of_two(n)
  num = n
  pow = 0
  while num >= 2
    num /= 2
    pow += 1
  end
  2**pow == n && num == 1
end

require 'test/unit'

class TestPowerOfTwo < Test::Unit::TestCase
  def test_
    assert_equal false, is_power_of_two(3)
    assert_equal true, is_power_of_two(16)
    assert_equal false, is_power_of_two(6)
  end
end