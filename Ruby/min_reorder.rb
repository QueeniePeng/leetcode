# There are n cities numbered from 0 to n - 1 and n - 1 roads such that there is only one way to travel between two different cities (this network form a tree). Last year, The ministry of transport decided to orient the roads in one direction because they are too narrow.

# Roads are represented by connections where connections[i] = [ai, bi] represents a road from city ai to city bi.

# This year, there will be a big event in the capital (city 0), and many people want to travel to this city.

# Your task consists of reorienting some roads such that each city can visit the city 0. Return the minimum number of edges changed.

# It's guaranteed that each city can reach city 0 after reorder.

 

# Example 1:


# Input: n = 6, connections = [[0,1],[1,3],[2,3],[4,0],[4,5]]
# Output: 3
# Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).
# Example 2:


# Input: n = 5, connections = [[1,0],[1,2],[3,2],[3,4]]
# Output: 2
# Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).
# Example 3:

# Input: n = 3, connections = [[1,0],[2,0]]
# Output: 0
 

# Constraints:

# 2 <= n <= 5 * 104
# connections.length == n - 1
# connections[i].length == 2
# 0 <= ai, bi <= n - 1
# ai != bi

# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer}

# def min_reorder(n, connections)
#   c_cities = Set.new
#   c_cities.add(0)
#   n_cities = []

#   ans = 0

#   connections.each_with_index do |c, i|
#     return ans if c_cities.length == n

#     if c_cities.member?(c[1])
#       c_cities.add(c[0])
#       c_cities.add(c[1])
#       n_cities -= [c[0], c[1]]

#     elsif c_cities.member?(c[0])
#       ans += 1
#       c_cities.add(c[0])
#       c_cities.add(c[1])
#       n_cities -= [c[0], c[1]]
#     else
#       n_cities += [c[0], c[1]]
#     end
#   end

#   i = 0

#   while i < n_cities.length || n_cities.length > 0
#     return ans if c_cities.length == n

#     c = n_cities[i]
#     if c_cities.member?(c[1])
#       c_cities.add(c[0])
#       c_cities.add(c[1])
#       n_cities -= [c[0], c[1]]

#     elsif c_cities.member?(c[0])
#       ans += 1
#       c_cities.add(c[0])
#       c_cities.add(c[1])
#       n_cities -= [c[0], c[1]]
#     end
#     i += 1
#   end
#   ans
# end

require 'set'

def min_reorder(n, connections)
  @connects = connections.to_set
  @neighbors = Hash.new { |hash, key| hash[key] = [] }
  @ans = 0

  connections.each do |i, o|
    @neighbors[i] << o
    @neighbors[o] << i
  end

  @visited = Set.new.add(0)
  traverse(0)
  @ans
end

def traverse(city)
  @neighbors[city].each do |n|
    next if @visited.include?(n)

    @ans += 1 unless @connects.include?([n, city])
    @visited.add(n)
    traverse(n)
  end
end

puts min_reorder(5, [[4,3],[2,3],[1,2],[1,0]])
# Output: 2

