# 229. Majority Element II
# Medium
# 6.7K
# 327
# Companies
# Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

# Example 1:

# Input: nums = [3,2,3]
# Output: [3]
# Example 2:

# Input: nums = [1]
# Output: [1]
# Example 3:

# Input: nums = [1,2]
# Output: [1,2]

# Constraints:

# 1 <= nums.length <= 5 * 104
# -109 <= nums[i] <= 109

# Follow up: Could you solve the problem in linear time and in O(1) space?

# @param {Integer[]} nums
# @return {Integer[]}

require 'set'

def majority_element(nums)
  nums.tally.select { |_, v| v > nums.length / 3 }.keys.to_set.to_a
end

require 'test/unit'

class TestMajorityElement < Test::Unit::TestCase
  def test_
    assert_equal [3], majority_element([3, 2, 3])
    assert_equal [1], majority_element([1])
    assert_equal [1, 2], majority_element([1, 2])
    assert_equal [2], majority_element([2, 2])
  end
end
