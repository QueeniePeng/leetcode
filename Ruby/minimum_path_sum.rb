# 64. Minimum Path Sum
# Medium
# 10.4K
# 137
# Companies
# Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

# Note: You can only move either down or right at any point in time.

# Example 1:

# Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
# Output: 7
# Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
# Example 2:

# Input: grid = [[1,2,3],[4,5,6]]
# Output: 12

# Constraints:

# m == grid.length
# n == grid[i].length
# 1 <= m, n <= 200
# 0 <= grid[i][j] <= 100
# Accepted
# 902.2K
# Submissions
# 1.5M
# Acceptance Rate
# 61.7%
# Seen this question in a real interview before?
# 1/4

# @param {Integer[][]} grid
# @return {Integer}

# Time Limit Exceeded
def min_path_sum(grid)
  @grid = grid
  @total = Float::INFINITY

  @x = @grid[0].length
  @y = @grid.length

  check_path(0, 0, 0)
  @total
end

def check_path(x, y, total)
  total += @grid[y][x]
  return if total > @total

  if (x == @x - 1) && (y == @y - 1)
    @total = [@total, total].min
    return
  end
  check_path(x + 1, y, total) if x < @x - 1
  check_path(x, y + 1, total) if y < @y - 1
end

def min_path_sum(grid)
  cols = grid.length
  rows = grid[0].length
  result = Array.new(cols + 1, Float::INFINITY) { Array.new(rows + 1, Float::INFINITY) }
  result[cols - 1][rows] = 0

  (cols - 1).downto(0) do |c|
    (rows - 1).downto(0) do |r|
      result[c][r] = grid[c][r] + [result[c + 1][r], result[c][r + 1]].min
    end
  end
  result[0][0]
end

require 'test/unit'

class TestMinPathSum < Test::Unit::TestCase
  def test_
    assert_equal 7, min_path_sum([[1,3,1],[1,5,1],[4,2,1]])
    assert_equal 12, min_path_sum([[1,2,3],[4,5,6]])
    assert_equal 85, min_path_sum([[7,1,3,5,8,9,9,2,1,9,0,8,3,1,6,6,9,5],[9,5,9,4,0,4,8,8,9,5,7,3,6,6,6,9,1,6],[8,2,9,1,3,1,9,7,2,5,3,1,2,4,8,2,8,8],[6,7,9,8,4,8,3,0,4,0,9,6,6,0,0,5,1,4],[7,1,3,1,8,8,3,1,2,1,5,0,2,1,9,1,1,4],[9,5,4,3,5,6,1,3,6,4,9,7,0,8,0,3,9,9],[1,4,2,5,8,7,7,0,0,7,1,2,1,2,7,7,7,4],[3,9,7,9,5,8,9,5,6,9,8,8,0,1,4,2,8,2],[1,5,2,2,2,5,6,3,9,3,1,7,9,6,8,6,8,3],[5,7,8,3,8,8,3,9,9,8,1,9,2,5,4,7,7,7],[2,3,2,4,8,5,1,7,2,9,5,2,4,2,9,2,8,7],[0,1,6,1,1,0,0,6,5,4,3,4,3,7,9,6,1,9]])

  end
end