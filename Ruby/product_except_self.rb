# Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

# You must write an algorithm that runs in O(n) time and without using the division operation.

 

# Example 1:

# Input: nums = [1,2,3,4]
# Output: [24,12,8,6]
# Example 2:

# Input: nums = [-1,1,0,-3,3]
# Output: [0,0,9,0,0]
 

# Constraints:

# 2 <= nums.length <= 105
# -30 <= nums[i] <= 30
# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 

# Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)

# @param {Integer[]} nums
# @return {Integer[]}
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  l = []
  r = []
  n = nums.length

  ls = 1
  i = 0

  while i < n
    l[i] = ls
    ls = nums[i] * ls
    i += 1
  end

  rs = 1
  j = n - 1

  while j >= 0
    r[j] = rs
    rs = nums[j] * rs
    j -= 1
  end

  print r[j]
  (0...n).map { |k| l[k] * r[k] }
end

puts product_except_self([-1,1,0,-3,3])
# [0,0,9,0,0]