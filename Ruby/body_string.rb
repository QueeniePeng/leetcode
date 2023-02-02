# Given two strings s and goal, return true if you can swap two letters in s so the result is equal to goal, otherwise, return false.

# Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at s[i] and s[j].

# For example, swapping at indices 0 and 2 in "abcd" results in "cbad".

# Example 1:

# Input: s = "ab", goal = "ba"
# Output: true
# Explanation: You can swap s[0] = 'a' and s[1] = 'b' to get "ba", which is equal to goal.
# Example 2:

# Input: s = "ab", goal = "ab"
# Output: false
# Explanation: The only letters you can swap are s[0] = 'a' and s[1] = 'b', which results in "ba" != goal.
# Example 3:

# Input: s = "aa", goal = "aa"
# Output: true
# Explanation: You can swap s[0] = 'a' and s[1] = 'a' to get "aa", which is equal to goal.

# Constraints:

# 1 <= s.length, goal.length <= 2 * 104
# s and goal consist of lowercase letters.

# @param {String} s
# @param {String} goal
# @return {Boolean}
def buddy_strings(s, goal)
  return false if s.length != goal.length

  ans = []
  h = {}
  can_swap = false

  (0...s.length).each do |i|
    ans << i if s[i] != goal[i]
    h[s[i]] ||= 0
    h[s[i]] += 1
    can_swap = true if !can_swap && (h[s[i]] == 2)
  end
  return can_swap if ans.empty?

  return s[ans[0]] == goal[ans[1]] && s[ans[1]] == goal[ans[0]] if ans.length == 2

  false
end
