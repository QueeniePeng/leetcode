# 2390. Removing Stars From a String
# Medium
# 1.7K
# 123
# Companies
# You are given a string s, which contains stars *.

# In one operation, you can:

# Choose a star in s.
# Remove the closest non-star character to its left, as well as remove the star itself.
# Return the string after all stars have been removed.

# Note:

# The input will be generated such that the operation is always possible.
# It can be shown that the resulting string will always be unique.

# Example 1:

# Input: s = "leet**cod*e"
# Output: "lecoe"
# Explanation: Performing the removals from left to right:
# - The closest character to the 1st star is 't' in "leet**cod*e". s becomes "lee*cod*e".
# - The closest character to the 2nd star is 'e' in "lee*cod*e". s becomes "lecod*e".
# - The closest character to the 3rd star is 'd' in "lecod*e". s becomes "lecoe".
# There are no more stars, so we return "lecoe".
# Example 2:

# Input: s = "erase*****"
# Output: ""
# Explanation: The entire string is removed, so we return an empty string.

# Constraints:

# 1 <= s.length <= 105
# s consists of lowercase English letters and stars *.
# The operation above can be performed on s.
# Accepted
# 95.7K
# Submissions
# 133.1K
# Acceptance Rate
# 71.9%
# Seen this question in a real interview before?
# 1/4

# @param {String} s
# @return {String}

# exceed time limit
def remove_stars(s)
  ans = ''
  s.each_char do |c|
    if c == '*' && ans.length.positive?
      ans.chomp!(ans[-1])
    else
      ans += c
    end
  end
  ans
end

def remove_stars(s)
  ans = []
  s.each_char do |c|
    if c == '*' && ans.length.positive?
      ans.pop
    else
      ans << c
    end
  end
  ans.join
end

require 'test/unit'

class TestRemoveStars < Test::Unit::TestCase
  def test_
    assert_equal 'lecoe', remove_stars('leet**cod*e')
    assert_equal '', remove_stars('erase*****')
  end
end
