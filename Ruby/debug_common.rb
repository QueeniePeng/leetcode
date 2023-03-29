# Your friend is a fan of the greatest common divisor (GCD) and has developed a software that takes two integers, l and x , and counts the number of pairs (a, b) that satisfy the following condition:

# GCD(a, b) = x, where 1 <= a <= b <= l

# Your friend's software, however, is not working correctly. Your  task is to investigate the code and fix the bugs.

# Take the following into account:
# 1 <= l, x <= 1100

# Input 1 (l):4
# Input 2 (x):2
# Output 2

# Explaination:
# There are two pairs that satisfy the condition: GCD(2,2) = 2 and GCD(2,4) = 2. So, the answer is 2.

# As a ruby on rails developer, can you debug this?

def getAns(l, x)
  dp = {}
  n = l / x
  return 0 if x > l || n.zero?
  return dp[n] if dp[n].zero?

  ans2 = 0
  ans1 = 0
  
  i = 2
  while i * i <= n
    ans1 += getAns(n, i)
    i += 1
  end
  i = 1
  while i * i <= n
    ans2 += ((n / i) + (n / (i + 1))) * getAns(i, 1) if i != n / i
    i += 1
  end
  dp[n] = (n * (n + 1)) / 2 - ans1 + ans2
end

def gcd(a, b)
  if (a % b).zero?
    b
  else
    gcd(b, a % b)
  end
end
require 'set'

def getAns(l, x)
  s = Set.new
  l.downto(1).each do |m|
    l.downto(1).each do |n|
      if gcd(m, n) == x
        s.add([m, n]) unless s.include?([m, n]) || s.include?([n, m])
      end
    end
  end
  print s
  s.length
end


# def getAns(l, x, dp = {})
#   n = l / x
#   return 0 if x > l || n == 0
#   return dp[n] if dp.key?(n)

#   ans2 = 0
#   ans1 = 0
#   i = 1
#   while i * i <= n
#     if n % i == 0
#       ans1 += getAns(n, i, dp)
#       ans1 += getAns(n, n / i, dp) if i != n / i
#     end
#     i += 1
#   end
#   i = 1
#   while i * i <= l
#     if x % i == 0
#       j = x / i
#       ans2 += ((n / i) + (n / (i * j))) * getAns(i, 1, dp)
#     end
#     i += 1
#   end
#   dp[n] = (n * (n + 1)) / 2 - ans1 + ans2
# end

require 'test/unit'

class TestGetAns < Test::Unit::TestCase
  def test_
    assert_equal 2, getAns(4, 2)
  end
end
