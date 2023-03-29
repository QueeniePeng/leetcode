# You are given an inputString where each character in the string is either L or R. You can change each character in the string from an L
# to an R, and vice versa.

# Your task is to obtain a string in which no two characters in a row are the same by performing the minimum numbers of changes possible.

# If the string already meets this requirement, and no changes are needed, then return 1000.

# Take the following into account:
# 1 <= inputString.length <= 250
# An answer is always possible.

# Input: LRRRR
# Output: 2

# Explanation:
# Using zero-based indexing, after changing the characters of positions 2 and 4, the resulting string becomes LRLRL where no two characters in a row are the same.
# Thus, the minimum number of changes needed is 2.

def minimumFlips(inputString)
  count = 0
  inputString.each_char.with_index do |c, i|
    next unless i.positive?

    if c == inputString[i - 1]
      count += 1
      inputString[i] = inputString[i] == 'R' ? 'L' : 'R'
    end
  end
  count
end

require 'test/unit'

class TestMinScore < Test::Unit::TestCase
  def test_
    assert_equal 2, minimumFlips('LRRRR')
    assert_equal 3, minimumFlips('LLLLLL')
  end
end
