# Given two strings s and goal, return true if and only if s can become goal after some number of shifts on s.

# A shift on s consists of moving the leftmost character of s to the rightmost position.

# For example, if s = "abcde", then it will be "bcdea" after one shift.
 

# Example 1:

# Input: s = "abcde", goal = "cdeab"
# Output: true
# Example 2:

# Input: s = "abcde", goal = "abced"
# Output: false
 

# Constraints:

# 1 <= s.length, goal.length <= 100
# s and goal consist of lowercase English letters.

# @param {String} s
# @param {String} goal
# @return {Boolean}

require 'set'

def rotate_string(s, goal)
  return false if s.length != goal.length

  (0...s.length).each do |i|
    next unless s[i] == goal[0]

    return true if s[i...s.length] + s[0...i] == goal
  end
  false
end

puts rotate_string('abcde', 'cdeab')
