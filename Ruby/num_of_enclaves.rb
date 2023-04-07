# 020. Number of Enclaves
# Medium
# 3.2K
# 62
# Companies
# You are given an m x n binary matrix grid, where 0 represents a sea cell and 1 represents a land cell.

# A move consists of walking from one land cell to another adjacent (4-directionally) land cell or walking off the boundary of the grid.

# Return the number of land cells in grid for which we cannot walk off the boundary of the grid in any number of moves.

# Example 1:

# Input: grid = [[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]]
# Output: 3
# Explanation: There are three 1s that are enclosed by 0s, and one 1 that is not enclosed because its on the boundary.
# Example 2:

# Input: grid = [[0,1,1,0],[0,0,1,0],[0,0,1,0],[0,0,0,0]]
# Output: 0
# Explanation: All 1s are either on the boundary or can reach the boundary.

# Constraints:

# m == grid.length
# n == grid[i].length
# 1 <= m, n <= 500
# grid[i][j] is either 0 or 1.
# Accepted
# 150.4K
# Submissions
# 218.6K
# Acceptance Rate
# 68.8%
# Seen this question in a real interview before?
# 1/4

# @param {Integer[][]} grid
# @return {Integer}
def num_enclaves(grid)
  @col = grid.length - 1
  @row = grid[0].length - 1
  count = 0

  (1...@col).each do |c|
    (1...@row).each do |r|
      next if grid[c][r].zero?

      @islands = 1
      grid[c][r] = 0
      count += @islands if check_enclaves(grid, c, r)
    end
  end
  count
end

def check_enclaves(grid, col, row)
  is_enclave = true
  [[col - 1, row], [col + 1, row], [col, row - 1], [col, row + 1]].each do |c, r|
    if c.between?(0, @col) && r.between?(0, @row)
      if grid[c][r] == 1
        grid[c][r] = 0
        @islands += 1
        is_enclave &= check_enclaves(grid, c, r)
      end
    else
      is_enclave = false
    end
  end
  is_enclave
end

require 'test/unit'

class TestNumEnclaves < Test::Unit::TestCase
  def test_
    assert_equal 3, num_enclaves([[0, 0, 0, 0], [1, 0, 1, 0], [0, 1, 1, 0], [0, 0, 0, 0]])
    assert_equal 0, num_enclaves([[0, 1, 1, 0], [0, 0, 1, 0], [0, 0, 1, 0], [0, 0, 0, 0]])
    assert_equal 3, num_enclaves([[0, 0, 0, 1, 1, 1, 0, 1, 0, 0],
                                  [1, 1, 0, 0, 0, 1, 0, 1, 1, 1],
                                  [0, 0, 0, 1, 1, 1, 0, 1, 0, 0],
                                  [0, 1, 1, 0, 0, 0, 1, 0, 1, 0],
                                  [0, 1, 1, 1, 1, 1, 0, 0, 1, 0],
                                  [0, 0, 1, 0, 1, 1, 1, 1, 0, 1],
                                  [0, 1, 1, 0, 0, 0, 1, 1, 1, 1],
                                  [0, 0, 1, 0, 0, 1, 0, 1, 0, 1],
                                  [1, 0, 1, 0, 1, 1, 0, 0, 0, 0],
                                  [0, 0, 0, 0, 1, 1, 0, 0, 0, 1]])
  end
end
