# You have n dice, and each die has k faces numbered from 1 to k.

# Given three integers n, k, and target, return the number of possible ways (out of the kn total ways) to roll the dice, so the sum of the face-up numbers equals target. Since the answer may be too large, return it modulo 109 + 7.

 

# Example 1:

# Input: n = 1, k = 6, target = 3
# Output: 1
# Explanation: You throw one die with 6 faces.
# There is only one way to get a sum of 3.
# Example 2:

# Input: n = 2, k = 6, target = 7
# Output: 6
# Explanation: You throw two dice, each with 6 faces.
# There are 6 ways to get a sum of 7: 1+6, 2+5, 3+4, 4+3, 5+2, 6+1.
# Example 3:

# Input: n = 30, k = 30, target = 500
# Output: 222616187
# Explanation: The answer must be returned modulo 109 + 7.
 

# Constraints:

# 1 <= n, k <= 30
# 1 <= target <= 1000

# @param {Integer} n
# @param {Integer} k
# @param {Integer} target
# @return {Integer}

#### time limit

# def num_rolls_to_target(n, k, target)
#   a = []
#   (0...n).each do |_|
#     a += [*1..k]
#   end
#   arr = a.permutation(n).to_a
#   ans = 0

#   (0...arr.length).each do |i|
#     ans += 1 if arr[i].sum == target
#   end
#   ans
# end


#### time limit
def num_rolls_to_target(n, k, target)
  @m = 10**9 + 7
  @k = k

  @has_cache = Array.new(n+1) { Array.new(target+1) }
  @cache = Array.new(n+1) { Array.new(target+1) }

  count(n, target)
end

def count(left, target)
  if left.zero?
    if target.zero?
      return 1
    else
     return 0
    end
  end

  return 0 if target.negative?

  return @cache[left][target] if @has_cache[left][target]

  ways = 0

  (1..@k).each do |i|
    ways += count(left - 1, target - i)
    ways %= @m
  end
  @has_cache[left][target] = true
  @cache[left][target] = ways
  ways %= @m
end

puts num_rolls_to_target(1,6,3)