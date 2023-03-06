# 1539. Kth Missing Positive Number
# Easy
# 4.9K
# 310
# Companies
# Given an array arr of positive integers sorted in a strictly increasing order, and an integer k.

# Return the kth positive integer that is missing from this array.

# Example 1:

# Input: arr = [2,3,4,7,11], k = 5
# Output: 9
# Explanation: The missing positive integers are [1,5,6,8,9,10,12,13,...]. The 5th missing positive integer is 9.
# Example 2:

# Input: arr = [1,2,3,4], k = 2
# Output: 6
# Explanation: The missing positive integers are [5,6,7,...]. The 2nd missing positive integer is 6.

# Constraints:

# 1 <= arr.length <= 1000
# 1 <= arr[i] <= 1000
# 1 <= k <= 1000
# arr[i] < arr[j] for 1 <= i < j <= arr.length

# Follow up:

# Could you solve this problem in less than O(n) complexity?

# Accepted
# 280.9K
# Submissions
# 481.2K
# Acceptance Rate
# 58.4%
# Seen this question in a real interview before?
# 1/4

# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_kth_positive(arr, k)
  ((1..(arr.length + k)).to_a - arr)[k - 1]
end

require 'test/unit'

class TestKthPositive < Test::Unit::TestCase
  def test_
    assert_equal 9, find_kth_positive([2, 3, 4, 7, 11], 5)
    assert_equal 6, find_kth_positive([1, 2, 3, 4], 2)
  end
end
