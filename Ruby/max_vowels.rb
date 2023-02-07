# 1456. Maximum Number of Vowels in a Substring of Given Length
# Medium
# 1K
# 46
# Companies
# Given a string s and an integer k, return the maximum number of vowel letters in any substring of s with length k.

# Vowel letters in English are 'a', 'e', 'i', 'o', and 'u'.

 

# Example 1:

# Input: s = "abciiidef", k = 3
# Output: 3
# Explanation: The substring "iii" contains 3 vowel letters.
# Example 2:

# Input: s = "aeiou", k = 2
# Output: 2
# Explanation: Any substring of length 2 contains 2 vowels.
# Example 3:

# Input: s = "leetcode", k = 3
# Output: 2
# Explanation: "lee", "eet" and "ode" contain 2 vowels.
 

# Constraints:

# 1 <= s.length <= 105
# s consists of lowercase English letters.
# 1 <= k <= s.length

# @param {String} s
# @param {Integer} k
# @return {Integer}

require 'set'

# Time Limit Exceeded
def max_vowels(s, k)
  vowels = Set.new(['a', 'e', 'i', 'o', 'u'])
  ans = 0
  last_k = []

  s.each_char do |c|
    res = vowels.include?(c) ? 1 : 0
    last_k << res

    if last_k.length == k
      ans = [ans, last_k.sum].max
      last_k = last_k.drop(1)
    end

    return ans if ans == k
  end
  s.length > k ? ans : last_k.sum
end

# optimize
def max_vowels(s, k)
  count = s[0...k].scan(/[aeiou]/).count
  max_count = count
  vowels = %w[a e i o u]

  (0...(s.length - k)).each do |i|
    count -= 1 if vowels.include?(s[i])
    count += 1 if vowels.include?(s[i + k])
    max_count = [count, max_count].max
    return max_count if max_count == k
  end
  max_count
end


require 'test/unit'

class TestMaxVowels < Test::Unit::TestCase
  def test_
    assert_equal 3, max_vowels('abciiidef', 3)
    assert_equal 2, max_vowels('aeiou', 2)
  end
end