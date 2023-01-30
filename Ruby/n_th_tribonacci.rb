# 1137. N-th Tribonacci Number
# Easy
# 3.1K
# 146
# Companies
# The Tribonacci sequence Tn is defined as follows: 

# T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.

# Given n, return the value of Tn.

 

# Example 1:

# Input: n = 4
# Output: 4
# Explanation:
# T_3 = 0 + 1 + 1 = 2
# T_4 = 1 + 1 + 2 = 4
# T_5 = 2 + 4 + 4 = 10
# Example 2:

# Input: n = 25
# Output: 1389537
 

# Constraints:

# 0 <= n <= 37
# The answer is guaranteed to fit within a 32-bit integer, ie. answer <= 2^31 - 1.
# Accepted
# 428.4K
# Submissions
# 672.3K
# Acceptance Rate
# 63.7%
# Seen this question in a real interview before?
# 1/4
# Yes
# No

# @param {Integer} n
# @return {Integer}

def tribonacci(n)
  return 0 if n.zero?
  return 1 if n == 1 || n == 2

  i = 1
  ans = Array.new(n + 1, 0)

  while i <= n
    if i == 1 || i == 2
      ans[i] = 1
    else
      ans[i] = ans[i-1] + ans[i-2] + ans[i-3]
    end
    i += 1
  end
  ans[-1]
end

require 'test/unit'
class Test_tribonacci < Test::Unit::TestCase
  def test_
    assert_equal 4, tribonacci(4)
    assert_equal 1389537, tribonacci(25)
  end
end
