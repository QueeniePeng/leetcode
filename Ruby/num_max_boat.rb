# 81. Boats to Save People
# Medium
# 4.8K
# 115
# Companies
# You are given an array people where people[i] is the weight of the ith person, and an infinite number of boats where each boat can carry a maximum weight of limit. Each boat carries at most two people at the same time, provided the sum of the weight of those people is at most limit.

# Return the minimum number of boats to carry every given person.

# Example 1:

# Input: people = [1,2], limit = 3
# Output: 1
# Explanation: 1 boat (1, 2)
# Example 2:

# Input: people = [3,2,2,1], limit = 3
# Output: 3
# Explanation: 3 boats (1, 2), (2) and (3)
# Example 3:

# Input: people = [3,5,3,4], limit = 5
# Output: 4
# Explanation: 4 boats (3), (3), (4), (5)

# Constraints:

# 1 <= people.length <= 5 * 104
# 1 <= people[i] <= limit <= 3 * 104
# Accepted
# 219.2K
# Submissions
# 398.6K
# Acceptance Rate
# 55.0%
# Seen this question in a real interview before?
# 1/4
# Yes

# @param {Integer[]} people
# @param {Integer} limit
# @return {Integer}
def num_rescue_boats(people, limit)
  hash = {}
  people.each do |p|
    hash[p] ||= 0
    hash[p] += 1
  end
  count = 0

  people.each do |p|
    next if hash[p].zero?

    hash[p] -= 1
    count += 1

    (limit - p).downto(1).each do |k|
      next unless hash[k]&.positive?

      hash[k] -= 1
      break
    end
  end
  count
end

def num_rescue_boats(people, limit)
  people.sort!
  left = 0
  right = people.length - 1
  count = 0

  while left <= right
    left += 1 if people[left] + people[right] <= limit
    right -= 1
    count += 1
  end
  count
end

require 'test/unit'

class TestNumRescueBoats < Test::Unit::TestCase
  def test_
    assert_equal 1, num_rescue_boats([1, 2], 3)
    assert_equal 3, num_rescue_boats([3, 2, 2, 1], 3)
    assert_equal 4, num_rescue_boats([3, 5, 3, 4], 5)
    assert_equal 3, num_rescue_boats([3, 2, 3, 2, 2], 6)
  end
end
