# As a Ruby on Rails developer. Can you write a solution?

# You are given three Integers x, y and z,  where 0 <= x, y, z <= 60 and the digits 4, 5, and 6.

# You want to find the sum of all the numbers that can be formed by using the number 4 at most x  times, the number 5 at most y times, and the number 6 at most z times. note:  To avoid integer overflow find the sum modulo 1000000007.

# You have already created the initial code for this operation, but it doesn't function as described above. Your task is to investigate the code and fix the bugs.
# Example 1:

# getSum(1,1,1)
# output 3675

# Explanation:
# The numbers you can create using the digits 4, 5, and 6 as per the requirements of the problem and their sum are: 4 + 5 + 6 + 45 + 54 + 56 + 65 + 46 + 64 + 456 + 465 + 546 + 564 + 645 + 654 = 3675

def getSum(x, y, z)
  n = 101
  mod = 1_000_000_007
  exactsum = Array.new(n) { Array.new(n) { Array.new(n) { 0 } } }
  exactnum = Array.new(n) { Array.new(n) { Array.new(n) { 0 } } }
  ans = 0
  exactnum[0][0][0] = 1
  (0..x).each do |i|
    (0..y).each do |j|
      (0..z).each do |k|
        if i > 0
          exactsum[i][j][k] += (exactsum[i - 1][j][k] * 10 + 4 * exactnum[i - 1][j][k]) % mod
          exactnum[i][j][k] += exactnum[i - 1][j][k]
        end
        if j > 0
          exactsum[i][j][k] += (exactsum[i][j - 1][k] * 10 + 5 * exactnum[i][j - 1][k]) % mod
          exactnum[i][j][k] += exactnum[i][j - 1][k]
        end
        if k > 0
          exactsum[i][j][k] -= (exactsum[i][j][k - 1] * 10 + 6 * exactnum[i][j][k - 1]) % mod
          exactnum[i][j][k] -= exactnum[i][j][k - 1]
        end
        ans += (exactsum[i][j][k] % mod)
        ans %= mod
      end
    end
  end
  ans
end

def getSum(x, y, z)
  n = 101
  mod = 1_000_000_007
  exactsum = Array.new(n) { Array.new(n) { Array.new(n) { 0 } } }
  exactnum = Array.new(n) { Array.new(n) { Array.new(n) { 0 } } }
  ans = 0
  exactnum[0][0][0] = 1

  (0..x).each do |i|
    (0..y).each do |j|
      (0..z).each do |k|
        if i.positive?
          exactsum[i][j][k] += (exactsum[i - 1][j][k] * 10 + 4 * exactnum[i - 1][j][k]) % mod
          exactnum[i][j][k] += exactnum[i - 1][j][k] % mod
        end
        if j.positive?
          exactsum[i][j][k] += (exactsum[i][j - 1][k] * 10 + 5 * exactnum[i][j - 1][k]) % mod
          exactnum[i][j][k] += exactnum[i][j - 1][k] % mod
        end
        if k.positive?
          exactsum[i][j][k] += (exactsum[i][j][k - 1] * 10 + 6 * exactnum[i][j][k - 1]) % mod
          exactnum[i][j][k] += exactnum[i][j][k - 1] % mod
        end
        ans += (exactsum[i][j][k] % mod)
        ans %= mod
      end
    end
  end
  ans
end

require 'test/unit'

class TestGetSum < Test::Unit::TestCase
  def test_
    assert_equal 5, getSum(0, 1, 0)
    assert_equal 3675, getSum(1, 1, 1)
  end
end
