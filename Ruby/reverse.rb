# Given a signed 32-bit integer x, return x with its digits reversed. 
# If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

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

# @param {Integer} x
# @return {Integer}
def reverse(x)
  s = x.abs.to_s
  i = s.length - 1
  ans = ''

  while i >= 0
    ans += s[i]
    i -= 1
  end

  return 0 if ans.to_i > 2**31 - 1

  x.positive? ? ans.to_i : -ans.to_i
end

puts reverse(-120)