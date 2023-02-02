# Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

 

#   Example 1:
  
#   Input: nums = [4,3,2,7,8,2,3,1]
#   Output: [5,6]
#   Example 2:
  
#   Input: nums = [1,1]
#   Output: [2]
   
  
#   Constraints:
  
#   n == nums.length
#   1 <= n <= 105
#   1 <= nums[i] <= n
   
  
#   Follow up: Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.

# @param {Integer[]} nums
# @return {Integer[]}
require 'set'

def find_disappeared_numbers(nums)
  s = Set.new(nums)

  res = []
  (1..nums.length).each do |i|
    res << i unless s.include?(i)
  end
  res
end


require 'test/unit'

class TestDisappearedNumbers < Test::Unit::TestCase
  def test_
    assert_equal [5, 6], find_disappeared_numbers([4,3,2,7,8,2,3,1])
    assert_equal [2], find_disappeared_numbers([1,1])
  end
end
