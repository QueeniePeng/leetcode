# A matrix diagonal is a diagonal line of cells starting from some cell in either the topmost row or leftmost column and going in the bottom-right direction until reaching the matrix's end. For example, the matrix diagonal starting from mat[2][0], where mat is a 6 x 3 matrix, includes cells mat[2][0], mat[3][1], and mat[4][2].

# Given an m x n matrix mat of integers, sort each matrix diagonal in ascending order and return the resulting matrix.

# Example 1:

# Input: mat = [[3,3,1,1],[2,2,1,2],[1,1,1,2]]
# Output: [[1,1,1,1],[1,2,2,2],[1,2,3,3]]
# Example 2:

# Input: mat = [[11,25,66,1,69,7],[23,55,17,45,15,52],[75,31,36,44,58,8],[22,27,33,25,68,4],[84,28,14,11,5,50]]
# Output: [[5,17,4,1,52,7],[11,11,25,45,8,69],[14,23,25,44,58,15],[22,27,31,36,50,66],[84,28,75,33,55,68]]

# Constraints:

# m == mat.length
# n == mat[i].length
# 1 <= m, n <= 100
# 1 <= mat[i][j] <= 100

# @param {Integer[][]} mat
# @return {Integer[][]}
# def diagonal_sort(mat)
#   return [] if mat.length.zero?

#   h = {}

#   (0...mat.length).each do |y|
#     (0...mat[y].length).each do |x|
#       m = mat[y][x]
#       h[m] ||= 0
#       h[m] += 1
#     end
#   end

#   ans = []
#   arr = []
#   l = mat[0].length

#   (1..100).each do |k|
#     if h[k]
#       arr_l = l - arr.length
#       if arr_l.zero?
#         ans << arr
#         arr = []
#       else
#         n = h[k]
#         (0...n).each do |_|
#           arr << k
#           if arr.length == l
#             ans << arr
#             arr = []
#           end
#         end
#       end
#     end
#   end
#   ans
# end

# def diagonal_sort(mat)
#   d = Hash.new
#   m = mat.length
#   n = mat[0].length

#   (0...m).each do |i|
#     (0...n).each do |j|
#       d[i - j] ||= []
#       d[i - j].push(mat[i][j])
#     end
#   end

#   print mat
#   puts d

#   d.each_value(&:sort!)
#   (0...m).each do |i|
#     (0...n).each do |j|
#       mat[i][j] = d[i - j].shift
#     end
#   end
#   mat
# end

def diagonal_sort(mat)
  @mat = mat
  @m = mat.length - 1
  @n = mat[0].length - 1

  @m.downto(0) do |i|
    sort_diagonal(i, 0)
  end

  (1..@n).each do |j|
    sort_diagonal(0, j)
  end
  @mat
end

def sort_diagonal(i, j)
  arr = []
  idx = []
  while i <= @m && j <= @n
    arr << @mat[i][j]
    idx << [i, j]
    i += 1
    j += 1
  end
  arr.sort!

  (0...idx.length).each do |k|
    @mat[idx[k][0]][idx[k][1]] = arr[k]
  end
end

# res = [[1,1,1,1],[1,2,2,2],[1,2,3,3]]
print diagonal_sort([[3, 3, 1, 1], [2, 2, 1, 2], [1, 1, 1, 2]])

# Input: mat = [[11,25,66,1,69,7],[23,55,17,45,15,52],[75,31,36,44,58,8],[22,27,33,25,68,4],[84,28,14,11,5,50]]
# Output: [
#   [5,17,4,1,52,7],
#   [11,11,25,45,8,69],
#   [14,23,25,44,58,15],
#   [22,27,31,36,50,66],
#   [84,28,75,33,55,68]]
