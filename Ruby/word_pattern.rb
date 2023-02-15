# Given a pattern and a string s, find if s follows the same pattern.

# Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

# Example 1:

# Input: pattern = "abba", s = "dog cat cat dog"
# Output: true
# Example 2:

# Input: pattern = "abba", s = "dog cat cat fish"
# Output: false
# Example 3:

# Input: pattern = "aaaa", s = "dog cat cat dog"
# Output: false

# Constraints:

# 1 <= pattern.length <= 300
# pattern contains only lower-case English letters.
# 1 <= s.length <= 3000
# s contains only lowercase English letters and spaces ' '.
# s does not contain any leading or trailing spaces.
# All the words in s are separated by a single space.

# @param {String} pattern
# @param {String} s
# @return {Boolean}

require 'set'

def word_pattern(pattern, s)
  h = {}
  words = s.split(' ')
  return false if words.length != pattern.length || Set.new(Array(pattern.each_char)).length != Set.new(words).length

  words.each_with_index do |w, i|
    return false if h[pattern[i]] && h[pattern[i]] != w

    h[pattern[i]] = w
  end
  true
end

require 'test/unit'

class TestWordPattern < Test::Unit::TestCase
  def test_
    assert_equal false, word_pattern('abba', 'dog cat cat fish')
    assert_equal true, word_pattern('abba', 'dog cat cat dog')
    assert_equal false, word_pattern('abba', 'dog dog dog dog')
  end
end
