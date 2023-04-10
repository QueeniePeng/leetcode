# 20. Valid Parentheses
# Easy
# 19.2K
# 1.1K
# Companies
# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Every close bracket has a corresponding open bracket of the same type.

# Example 1:

# Input: s = "()"
# Output: true
# Example 2:

# Input: s = "()[]{}"
# Output: true
# Example 3:

# Input: s = "(]"
# Output: false

# Constraints:

# 1 <= s.length <= 104
# s consists of parentheses only '()[]{}'.
# Accepted
# 3.2M
# Submissions
# 8M
# Acceptance Rate
# 40.4%
# Seen this question in a real interview before?
# 1/4

# @param {String} s
# @return {Boolean}
def is_valid(s)
  return false unless (s.length % 2).zero?
  char_hash = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }
  char_arr = []
  s.each_char do |c|
    if char_hash.key?(c)
      char_arr << char_hash[c]
    else
      return false unless char_arr.length.positive?
      return false if char_arr.pop != c
    end
  end
  char_arr.empty?
end

require 'test/unit'

class TestIsValid < Test::Unit::TestCase
  def test_
    assert_equal true, is_valid('()')
    assert_equal true, is_valid('()[]{}')
    assert_equal false, is_valid('(]')
  end
end
