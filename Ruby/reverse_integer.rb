# 7. Reverse Integer
# Medium
# 9.4K
# 11.4K
# Companies
# Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

# Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

 

# Example 1:

# Input: x = 123
# Output: 321
# Example 2:

# Input: x = -123
# Output: -321
# Example 3:

# Input: x = 120
# Output: 21
 

# Constraints:

# -231 <= x <= 231 - 1
# Accepted
# 2.4M
# Submissions
# 8.8M
# Acceptance Rate
# 27.3%
# Seen this question in a real interview before?
# 1/4


# @param {Integer} x
# @return {Integer}

def reverse(x)
  s = x.abs.to_s.reverse
  return 0 if s.to_i > (2**31 - 1)

  x.negative? ? -s.to_i : s.to_i
end

puts reverse(123)
puts reverse(-123)
puts reverse(100)
