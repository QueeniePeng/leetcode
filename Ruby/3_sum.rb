# 15. 3Sum
# Medium
# 23.5K
# 2.2K
# Companies
# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

# Notice that the solution set must not contain duplicate triplets.

# Example 1:

# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]
# Explanation:
# nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
# nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
# nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
# The distinct triplets are [-1,0,1] and [-1,-1,2].
# Notice that the order of the output and the order of the triplets does not matter.
# Example 2:

# Input: nums = [0,1,1]
# Output: []
# Explanation: The only possible triplet does not sum up to 0.
# Example 3:

# Input: nums = [0,0,0]
# Output: [[0,0,0]]
# Explanation: The only possible triplet sums up to 0.

# Constraints:

# 3 <= nums.length <= 3000
# -105 <= nums[i] <= 105
# Accepted
# 2.5M
# Submissions
# 7.6M
# Acceptance Rate
# 32.4%
# Seen this question in a real interview before?
# 1/4
# Yes
# No

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  nums.sort!
  length = nums.length - 1
  res = []

  (0..length).each do |i|
    (i + 1..length).each do |j|
      (j + 1..length).each do |k|
        arr = [nums[i], nums[j], nums[k]]
        sum = nums[i] + nums[j] + nums[k]
        res.push([nums[i], nums[j], nums[k]]) if sum == 0 && !res.include?(arr)
      end
    end
  end
  res
end

def three_sum(nums)
  nums.sort!
  res = []

  nums.each_with_index do |n, i|
    next if i.positive? && n == nums[i - 1]

    l = i + 1
    r = nums.length - 1

    while l < r
      sum = n + nums[l] + nums[r]
      arr = [n, nums[l], nums[r]]

      if sum.negative?
        l += 1
      elsif sum.positive?
        r -= 1
      else
        res.push(arr)
        l += 1

        l += 1 while nums[l] == nums[l - 1] && l < r
      end
    end
  end
  res
end

require 'minitest/autorun'

class ThreeSumTests < Minitest::Test
  def test_example1
    assert_equal(three_sum([-1, 0, 1, 2, -1, -4]), [[-1, 0, 1], [-1, -1, 2]])
  end
end
