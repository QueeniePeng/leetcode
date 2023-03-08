# 875. Koko Eating Bananas
# Medium
# 6.9K
# 322
# Companies
# Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.

# Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.

# Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

# Return the minimum integer k such that she can eat all the bananas within h hours.

# Example 1:

# Input: piles = [3,6,7,11], h = 8
# Output: 4
# Example 2:

# Input: piles = [30,11,23,4,20], h = 5
# Output: 30
# Example 3:

# Input: piles = [30,11,23,4,20], h = 6
# Output: 23

# Constraints:

# 1 <= piles.length <= 104
# piles.length <= h <= 109
# 1 <= piles[i] <= 109
# Accepted
# 314.9K
# Submissions
# 604.9K
# Acceptance Rate
# 52.1%
# Seen this question in a real interview before?
# 1/4

# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
  (1..piles.max).bsearch { |k| piles.sum { |p| (p.to_f / k).ceil } <= h }
end

require 'test/unit'

class TestEatingSpeed < Test::Unit::TestCase
  def test_
    assert_equal 4, min_eating_speed([3, 6, 7, 11], 8)
    assert_equal 30, min_eating_speed([30, 11, 23, 4, 20], 5)
    assert_equal 23, min_eating_speed([30, 11, 23, 4, 20], 6)
  end
end
