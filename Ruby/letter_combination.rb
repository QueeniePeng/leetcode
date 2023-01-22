# 17. Letter Combinations of a Phone Number
# Medium
# 13.8K
# 801
# Companies
# Given a string containing digits from 2-9 inclusive, 
# return all possible letter combinations that the number could represent. Return the answer in any order.

# A mapping of digits to letters (just like on the telephone buttons) is given below. 
# Note that 1 does not map to any letters.


 

# Example 1:

# Input: digits = "23"
# Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
# Example 2:

# Input: digits = ""
# Output: []
# Example 3:

# Input: digits = "2"
# Output: ["a","b","c"]
 

# Constraints:

# 0 <= digits.length <= 4
# digits[i] is a digit in the range ['2', '9'].
# Accepted
# 1.5M
# Submissions
# 2.6M
# Acceptance Rate
# 56.0%
# Seen this question in a real interview before?
# 1/4


# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  res = []

  hash = {
    2 => ['a', 'b', 'c'],
    3 => ['d', 'e', 'f'],
    4 => ['g', 'h', 'i'],
    5 => ['j', 'k', 'l'],
    6 => ['m', 'n', 'o'],
    7 => ['p', 'q', 'r', 's'],
    8 => ['t', 'u', 'v'],
    9 => ['w', 'x', 'y', 'z']
  }

  digits.each_char do |char|
    tmp = hash[char.to_i]
    res = permutation(res, tmp)
  end
  res
end

def permutation(arr1, arr2)
  return arr2 if arr1.empty?

  res = []
  arr1.each do |a1|
    arr2.each do |a2|
      res << a1 + a2
    end
  end
  res
end

require 'minitest/autorun'

class LetterCombinationsTest < Minitest::Test
  def test_example1
    assert_equal(["ad","ae","af","bd","be","bf","cd","ce","cf"], letter_combinations('23'))
  end

  def test_example2
    assert_equal(["a","b","c"], letter_combinations('2'))
  end

  def test_example3
    assert_equal(["adg","adh","adi","aeg","aeh","aei","afg","afh","afi","bdg","bdh","bdi","beg","beh","bei","bfg","bfh","bfi","cdg","cdh","cdi","ceg","ceh","cei","cfg","cfh","cfi"],
      letter_combinations('234'))
  end
end

# [0][0] [1][0] ad

# [0][0] [1][1] ae

# [0][0] [1][2]

# [0][1] [1][0]

# [0][1] [1][1]

# [0][1] [1][2]

# [0][2] [1][0]

# [0][2] [1][1]

# [0][2] [1][2]
