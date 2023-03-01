# 912. Sort an Array
# Medium
# 3.4K
# 611
# Companies
# Given an array of integers nums, sort the array in ascending order and return it.

# You must solve the problem without using any built-in functions in O(nlog(n)) time complexity and with the smallest space complexity possible.

# Example 1:

# Input: nums = [5,2,3,1]
# Output: [1,2,3,5]
# Explanation: After sorting the array, the positions of some numbers are not changed (for example, 2 and 3), while the positions of other numbers are changed (for example, 1 and 5).
# Example 2:

# Input: nums = [5,1,1,2,0,0]
# Output: [0,0,1,1,2,5]
# Explanation: Note that the values of nums are not necessairly unique.

# Constraints:

# 1 <= nums.length <= 5 * 104
# -5 * 104 <= nums[i] <= 5 * 104
# Accepted
# 362.5K
# Submissions
# 620.8K
# Acceptance Rate
# 58.4%
# Seen this question in a real interview before?
# 1/4

# @param {Integer[]} nums
# @return {Integer[]}

# time limit
def sort_array(nums)
  return nums if nums.length == 1

  res = [nums[0], nums[1]].minmax

  nums.each_with_index do |n, i|
    next unless i > 1

    if n >= res[i - 1]
      res << n
      next
    end

    if n <= res[0]
      res.insert(0, n)
      next
    end

    if i == 2
      res.insert(1, n)
      next
    end

    j = i
    k = 0

    while j >= k
      l = (j - k) / 2

      if n >= res[l]
        if n <= res[l + 1]
          res.insert(l + 1, n)
          break
        end
        k = l
      end

      next unless n <= res[l]

      if n >= res[l - 1]
        res.insert(l, n)
        break
      end
      j = l
    end
  end
  res
end

def sort_array(nums)
  return nums if nums.length < 2

  mid = nums.length / 2
  left = nums[0...mid]
  right = nums[mid..-1]

  merge_sort(sort_array(left), sort_array(right))
end

def merge_sort(left, right)
  arr = []
  while !left.empty? && !right.empty?
    if left[0] < right[0]
      arr.push(left.shift)
    else
      arr.push(right.shift)
    end
  end
  [arr, left, right].flatten
end

require 'test/unit'

class TestSortArray < Test::Unit::TestCase
  def test_
    assert_equal [1, 2, 3, 5], sort_array([5, 2, 3, 1])
    assert_equal [0, 0, 1, 2], sort_array([0, 2, 0, 1])
  end
end
