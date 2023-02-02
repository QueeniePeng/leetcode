# 4. Median of Two Sorted Arrays
# Hard
# 21.5K
# 2.4K
# Companies
# Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

# The overall run time complexity should be O(log (m+n)).

# Example 1:

# Input: nums1 = [1,3], nums2 = [2]
# Output: 2.00000
# Explanation: merged array = [1,2,3] and median is 2.
# Example 2:

# Input: nums1 = [1,2], nums2 = [3,4]
# Output: 2.50000
# Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

# Constraints:

# nums1.length == m
# nums2.length == n
# 0 <= m <= 1000
# 0 <= n <= 1000
# 1 <= m + n <= 2000
# -106 <= nums1[i], nums2[i] <= 106
# Accepted
# 1.7M
# Submissions
# 4.9M
# Acceptance Rate
# 35.6%
# Seen this question in a real interview before?
# 1/4

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

def find_median_sorted_arrays(nums1, nums2)
  nums = nums1.concat(nums2).sort!
  (nums.length % 2).zero? ? ((nums[nums.length / 2 - 1] + nums[nums.length / 2]).to_f / 2) : nums[nums.length / 2].to_f
end

puts find_median_sorted_arrays([1], [3, 2])
