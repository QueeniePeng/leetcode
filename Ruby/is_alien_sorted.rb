# 953. Verifying an Alien Dictionary
# Easy
# 4.2K
# 1.3K
# Companies
# In an alien language, surprisingly, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

# Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.

 

# Example 1:

# Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
# Output: true
# Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
# Example 2:

# Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
# Output: false
# Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
# Example 3:

# Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
# Output: false
# Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
 

# Constraints:

# 1 <= words.length <= 100
# 1 <= words[i].length <= 20
# order.length == 26
# All characters in words[i] and order are English lowercase letters.
# Accepted
# 426.7K
# Submissions
# 791.2K
# Acceptance Rate
# 53.9%
# Seen this question in a real interview before?
# 1/4
# Yes
# No

# @param {String[]} words
# @param {String} order
# @return {Boolean}

def is_alien_sorted(words, order)
  h = {}
  order.each_char.with_index { |c, i| h[c] = i }

  words.each_with_index do |word, i|
    return true if i == words.length - 1

    next_word = words[i + 1]
    return false if word.include?(next_word) && next_word.length < word.length

    (0...[word.length, next_word.length].min).each do |j|
      order1 = h[word[j]]
      order2 = h[next_word[j]]
      break if order2 > order1

      return false if order2 < order1
    end
  end
end

require 'test/unit'

class TestIsAlienSorted < Test::Unit::TestCase
  def test_
    assert_equal true, is_alien_sorted(%w[hello leetcode], 'hlabcdefgijkmnopqrstuvwxyz')
    assert_equal false, is_alien_sorted(%w[word worldrow], 'worldabcefghijkmnpqstuvxyz')
  end
end
