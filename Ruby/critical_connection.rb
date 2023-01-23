# There are n servers numbered from 0 to n - 1 
# connected by undirected server-to-server connections forming a network where connections[i] = [ai, bi] 
# represents a connection between servers ai and bi. Any server can reach other servers directly or indirectly through the network.

# A critical connection is a connection that, if removed, will make some servers unable to reach some other server.

# Return all critical connections in the network in any order.

 

# Example 1:


# Input: n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
# Output: [[1,3]]
# Explanation: [[3,1]] is also accepted.
# Example 2:

# Input: n = 2, connections = [[0,1]]
# Output: [[0,1]]
 

# Constraints:

# 2 <= n <= 105
# n - 1 <= connections.length <= 105
# 0 <= ai, bi <= n - 1
# ai != bi
# There are no repeated connections.

def critical_connections(n, connections)
  graph = Array.new(n) {[]}
  connections.each {|c| graph[c[0]] << c[1]; graph[c[1]] << c[0]}
  dfn = Array.new(n, -1)
  low = Array.new(n, -1)
  timestamp = 0
  res = []
  dfs(0, -1, graph, dfn, low, timestamp, res)
  return res
end

def dfs(v, parent, graph, dfn, low, timestamp, res)
  dfn[v] = low[v] = timestamp
  timestamp += 1
  graph[v].each do |neighbor|
    if dfn[neighbor] == -1
      dfs(neighbor, v, graph, dfn, low, timestamp, res)
      low[v] = [low[v], low[neighbor]].min
      if dfn[v] < low[neighbor]
        res << [v, neighbor]
      end
    elsif neighbor != parent
      low[v] = [low[v], dfn[neighbor]].min
    end
  end
end

puts critical_connections(4, [[0,1],[1,2],[2,0],[1,3]]);