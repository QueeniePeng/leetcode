# 2492. Minimum Score of a Path Between Two Cities
# Medium
# 1.1K
# 206
# Companies
# You are given a positive integer n representing n cities numbered from 1 to n. You are also given a 2D array roads where roads[i] = [ai, bi, distancei] indicates that there is a bidirectional road between cities ai and bi with a distance equal to distancei. The cities graph is not necessarily connected.

# The score of a path between two cities is defined as the minimum distance of a road in this path.

# Return the minimum possible score of a path between cities 1 and n.

# Note:

# A path is a sequence of roads between two cities.
# It is allowed for a path to contain the same road multiple times, and you can visit cities 1 and n multiple times along the path.
# The test cases are generated such that there is at least one path between 1 and n.

# Example 1:

# Input: n = 4, roads = [[1,2,9],[2,3,6],[2,4,5],[1,4,7]]
# Output: 5
# Explanation: The path from city 1 to 4 with the minimum score is: 1 -> 2 -> 4. The score of this path is min(9,5) = 5.
# It can be shown that no other path has less score.
# Example 2:

# Input: n = 4, roads = [[1,2,2],[1,3,4],[3,4,7]]
# Output: 2
# Explanation: The path from city 1 to 4 with the minimum score is: 1 -> 2 -> 1 -> 3 -> 4. The score of this path is min(2,2,4,7) = 2.

# Constraints:

# 2 <= n <= 105
# 1 <= roads.length <= 105
# roads[i].length == 3
# 1 <= ai, bi <= n
# ai != bi
# 1 <= distancei <= 104
# There are no repeated edges.
# There is at least one path between 1 and n.
# Accepted
# 46.2K
# Submissions
# 82.8K
# Acceptance Rate
# 55.8%
# Seen this question in a real interview before?
# 1/4

# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}

require 'set'

def min_score(n, roads)
  neighbors = Hash.new { |hash, key| hash[key] = [] }
  roads.each do |a, b, distance|
    neighbors[a] << [distance, b]
    neighbors[b] << [distance, a]
  end
  min_road = 10**5
  connected = [1, n]
  visited = Set.new

  while c = connected.shift
    next if visited.include?(c)

    neighbors[c].each do |distance, neighbor|
      connected << neighbor
      min_road = [min_road, distance].min
      visited.add(c)
    end
  end
  min_road
end

require 'test/unit'

class TestMinScore < Test::Unit::TestCase
  def test_
    assert_equal 5, min_score(4, [[1, 2, 9], [2, 3, 6], [2, 4, 5], [1, 4, 7]])
    assert_equal 2, min_score(4, [[1, 2, 2], [1, 3, 4], [3, 4, 7]])
    assert_equal 1098,
                 min_score(13,
                           [[1, 10, 9390], [2, 12, 1891], [3, 13, 4562], [4, 6, 6752], [5, 4, 2795], [6, 2, 1098], [7, 5, 9827], [8, 11, 1480],
                            [9, 7, 9202], [10, 9, 4138], [11, 3, 2007], [12, 8, 1915]])
  end
end
