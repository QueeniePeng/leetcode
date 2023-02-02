# You are given an array representing a row of seats where seats[i] = 1 represents a person sitting in the ith seat, and seats[i] = 0 represents that the ith seat is empty (0-indexed).

# There is at least one empty seat, and at least one person sitting.

# Alex wants to sit in the seat such that the distance between him and the closest person to him is maximized.

# Return that maximum distance to the closest person.

# Example 1:

# Input: seats = [1,0,0,0,1,0,1]
# Output: 2
# Explanation:
# If Alex sits in the second open seat (i.e. seats[2]), then the closest person has distance 2.
# If Alex sits in any other open seat, the closest person has distance 1.
# Thus, the maximum distance to the closest person is 2.
# Example 2:

# Input: seats = [1,0,0,0]
# Output: 3
# Explanation:
# If Alex sits in the last seat (i.e. seats[3]), the closest person is 3 seats away.
# This is the maximum distance possible, so the answer is 3.
# Example 3:

# Input: seats = [0,1]
# Output: 1

# Constraints:

# 2 <= seats.length <= 2 * 104
# seats[i] is 0 or 1.
# At least one seat is empty.
# At least one seat is occupied.

# @param {Integer[]} seats
# @return {Integer}
def max_dist_to_closest(seats)
  max_dist = 0
  temp = 0
  first = false
  seats.each_with_index do |s, i|
    if s.zero?
      temp += 1
      first = true if i.zero?
      max_dist = [max_dist, temp * 2].max if i == seats.length - 1

    else
      if first == true
        max_dist = [max_dist, temp * 2].max
        first = false
      end
      max_dist = [max_dist, temp].max
      temp = 0
    end
  end

  (max_dist + 1) / 2
end

puts max_dist_to_closest([0, 1])
puts max_dist_to_closest([1, 0, 0, 0, 1, 0, 1])
puts max_dist_to_closest([1, 0, 0, 0])
puts max_dist_to_closest([0, 0, 0, 0, 1, 0, 0, 0, 0, 0])
