# 18. 4Sum
# Medium
# 8.5K
# 982
# Companies
# Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

# 0 <= a, b, c, d < n
# a, b, c, and d are distinct.
# nums[a] + nums[b] + nums[c] + nums[d] == target
# You may return the answer in any order.

 

# Example 1:

# Input: nums = [1,0,-1,0,-2,2], target = 0
# Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
# Example 2:

# Input: nums = [2,2,2,2,2], target = 8
# Output: [[2,2,2,2]]


# Constraints:

# 1 <= nums.length <= 200
# -109 <= nums[i] <= 109
# -109 <= target <= 109
# Accepted
# 694.2K
# Submissions
# 1.9M
# Acceptance Rate
# 36.2%
# Seen this question in a real interview before?
# 1/4
# Yes
# No

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}


# def four_sum(nums, target)
#   nums.sort!
#   length = nums.length - 1
#   res = []
#   for i in (0..length)
#     for j in (i+1..length)
#       for k in (j+1..length)
#         for l in (k+1..length)
#           arr = [nums[i], nums[j], nums[k], nums[l]]
#           sum = nums[i] + nums[j] + nums[k] + nums[l]
#           if sum == target && !res.include?(arr)
#             res << arr
#           end
#         end
#       end
#     end
#   end
#   res
# end

# def four_sum(nums, target)
#   nums.sort!
#   length = nums.length - 1
#   res = []

#   for i in (0..length)
#     if i.positive? && nums[i] == nums[i - 1]
#       i += 1
#       next
#     end
#     for j in (i+1..length)
#       k = j + 1
#       l = length - 1
#       while k < l
#         sum = nums[i] + nums[j] + nums[k] + nums[l]
#         arr = [nums[i], nums[j], nums[k], nums[l]]

#         print(arr)
#         puts sum
#         if sum < target
#           k += 1

#         elsif sum > target
#           l -= 1

#         else
#           res << arr
#           k += 1
#           while nums[k] == nums[k-1] && k < l
#             k += 1
#           end
#         end
#       end
#       j += 1
#     end
#     i += 1
#   end
#   res
# end

require 'set'

def four_sum(nums, target)
  nums.sort!
  map = Hash.new { |hash, key| hash[key] = Set.new }
  result = Set.new
  n = nums.length

  for i in 0...n
    for j in ((i + 1)...n)
      sum = nums[i] + nums[j]

        for item in map[target - sum]
          s = item.to_a + [nums[i], nums[j]]
          result.add(s)
        end
    end

    for k in (0...i)
      sum = nums[i] + nums[k]
      item = [nums[i], nums[k]]
      map[sum].add(item)
    end
  end

  result.to_a
end


puts four_sum([1, 0, -1, 0, -2, 2], 0)
[-2, -2, -1, 0, 0, 1, 2]

require 'minitest/autorun'

four sum tests
class FourSumTests < Minitest::Test
  def test_example1
    assert_equal(four_sum([1, 0, -1, 0, -2, 2], 0), [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]])
  end

  def test_example2
    assert_equal(four_sum([2, 2, 2, 2, 2], 8), [[2, 2, 2, 2]])
  end
end

# [1, 0, -1, 0, -2, 2]
