# 2405. Optimal Partition of String
# Medium
# 1.6K
# 70
# Companies
# Given a string s, partition the string into one or more substrings such that the characters in each substring are unique. That is, no letter appears in a single substring more than once.

# Return the minimum number of substrings in such a partition.

# Note that each character should belong to exactly one substring in a partition.

# Example 1:

# Input: s = "abacaba"
# Output: 4
# Explanation:
# Two possible partitions are ("a","ba","cab","a") and ("ab","a","ca","ba").
# It can be shown that 4 is the minimum number of substrings needed.
# Example 2:

# Input: s = "ssssss"
# Output: 6
# Explanation:
# The only valid partition is ("s","s","s","s","s","s").

# Constraints:

# 1 <= s.length <= 105
# s consists of only English lowercase letters.
# Accepted
# 88.6K
# Submissions
# 111.2K
# Acceptance Rate
# 79.7%
# Seen this question in a real interview before?
# 1/4
# Yes
# No

# @param {String} s
# @return {Integer}
def partition_string(s)
  count = 0
  h = {}
  s.each_char.with_index do |char, index|
    if h[char]
      count += 1
      h.clear
    end
    h[char] = true
    count += 1 if index == s.length - 1
  end
  count
end

require 'test/unit'

class TestPartitionString < Test::Unit::TestCase
  def test_
    assert_equal 4, partition_string('abacaba')
    assert_equal 6, partition_string('ssssss')
  end
end
