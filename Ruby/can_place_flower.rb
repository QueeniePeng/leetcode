# 605. Can Place Flowers
# Easy
# 4.3K
# 788
# Companies
# You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

# Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

# Example 1:

# Input: flowerbed = [1,0,0,0,1], n = 1
# Output: true
# Example 2:

# Input: flowerbed = [1,0,0,0,1], n = 2
# Output: false

# Constraints:

# 1 <= flowerbed.length <= 2 * 104
# flowerbed[i] is 0 or 1.
# There are no two adjacent flowers in flowerbed.
# 0 <= n <= flowerbed.length
# Accepted
# 387.3K
# Submissions
# 1.2M
# Acceptance Rate
# 32.8%
# Seen this question in a real interview before?
# 1/4

# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  count = n
  flowerbed.each_with_index do |f, i|
    return true if res.zero?

    # check if nearby are zeros or out of bounds.
    if ((i - 1).negative? || flowerbed[i - 1].zero?) && f.zero? && (i + 1 >= flowerbed.length || flowerbed[i + 1].zero?)
      count -= 1
      # if yes, plant the flower.
      flowerbed[i] = 1
    end
  end
  count.zero?
end

require 'test/unit'

class TestCanPlaceFlowers < Test::Unit::TestCase
  def test_
    assert_equal true, can_place_flowers([1, 0, 0, 0, 1], 1)
    assert_equal false, can_place_flowers([1, 0, 0, 0, 1], 2)
    assert_equal true, can_place_flowers([0, 0, 1, 0, 1], 1)
  end
end
