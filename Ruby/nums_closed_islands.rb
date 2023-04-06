# 254. Number of Closed Islands
# Medium
# 3.7K
# 121
# Companies
# Given a 2D grid consists of 0s (land) and 1s (water).  An island is a maximal 4-directionally connected group of 0s and a closed island is an island totally (all left, top, right, bottom) surrounded by 1s.

# Return the number of closed islands.

 

# Example 1:



# Input: grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
# Output: 2
# Explanation: 
# Islands in gray are closed because they are completely surrounded by water (group of 1s).
# Example 2:



# Input: grid = [[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]]
# Output: 1
# Example 3:

# Input: grid = [[1,1,1,1,1,1,1],
#                [1,0,0,0,0,0,1],
#                [1,0,1,1,1,0,1],
#                [1,0,1,0,1,0,1],
#                [1,0,1,1,1,0,1],
#                [1,0,0,0,0,0,1],
#                [1,1,1,1,1,1,1]]
# Output: 2
 

# Constraints:

# 1 <= grid.length, grid[0].length <= 100
# 0 <= grid[i][j] <=1
# Accepted
# 161.9K
# Submissions
# 245.4K
# Acceptance Rate
# 66.0%
# Seen this question in a real interview before?
# 1/4

# @param {Integer[][]} grid
# @return {Integer}
def closed_island(grid)
  @grid = grid
  @row = grid[0].length - 1
  @col = grid.length - 1

  count = 0
  (1...@col).each do |c|
    (1...@row).each do |r|
      next if grid[c][r] == 1

      count += 1 if check_island(c, r)
    end
  end
  count
end

def check_island(col, row)
  is_closed = true
  [[col + 1, row], [col - 1, row], [col, row + 1], [col, row - 1]].each do |c, r|
    if c.between?(0, @col) && r.between?(0, @row)
      if @grid[c][r].zero?
        @grid[c][r] = 1
        is_closed &= check_island(c, r)
      end
    else
      is_closed = false
    end
  end
  is_closed
end

require 'test/unit'

class TestClosedIsland < Test::Unit::TestCase
  def test_
    assert_equal 2, closed_island([[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]])
    assert_equal 1, closed_island([[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]])
  end
end