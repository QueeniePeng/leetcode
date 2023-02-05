# 567. Permutation in String
# Medium
# 9.1K
# 284
# Companies
# Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.

# In other words, return true if one of s1's permutations is the substring of s2.

 

# Example 1:

# Input: s1 = "ab", s2 = "eidbaooo"
# Output: true
# Explanation: s2 contains one permutation of s1 ("ba").
# Example 2:

# Input: s1 = "ab", s2 = "eidboaoo"
# Output: false
 

# Constraints:

# 1 <= s1.length, s2.length <= 104
# s1 and s2 consist of lowercase English letters.
# Accepted
# 597.2K
# Submissions
# 1.3M
# Acceptance Rate
# 44.4%
# Seen this question in a real interview before?
# 1/4
# Yes
# No

# @param {String} s1
# @param {String} s2
# @return {Boolean}

require 'set'

# brute force
def check_inclusion(s1, s2)
  Array(s1.each_char).permutation.map(&:join).each { |s| return true if s2.include?(s) }
  false
end

def check_inclusion(s1, s2)
  return false if s1.length > s2.length

  h = Hash.new(0)
  s1.each_char { |c| h[c] += 1 }

  s2.each_char.with_index do |c, i|
    h[c] -= 1
    h[s2[i - s1.length]] += 1 if i >= s1.length
    return true if h.values.all?(0)
  end
  false
end

require 'test/unit'

class TestUpdateMatrix < Test::Unit::TestCase
  def test_
    assert_equal true, check_inclusion('ab', 'eidbaooo')
    assert_equal false, check_inclusion('ab', 'eidboaoo')
    assert_equal true, check_inclusion('adc', 'dcda')
  end
end
