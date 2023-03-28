# 983. Minimum Cost For Tickets
# Medium
# 6.5K
# 118
# Companies
# You have planned some train traveling one year in advance. The days of the year in which you will travel are given as an integer array days. Each day is an integer from 1 to 365.

# Train tickets are sold in three different ways:

# a 1-day pass is sold for costs[0] dollars,
# a 7-day pass is sold for costs[1] dollars, and
# a 30-day pass is sold for costs[2] dollars.
# The passes allow that many days of consecutive travel.

# For example, if we get a 7-day pass on day 2, then we can travel for 7 days: 2, 3, 4, 5, 6, 7, and 8.
# Return the minimum number of dollars you need to travel every day in the given list of days.

# Example 1:

# Input: days = [1,4,6,7,8,20], costs = [2,7,15]
# Output: 11
# Explanation: For example, here is one way to buy passes that lets you travel your travel plan:
# On day 1, you bought a 1-day pass for costs[0] = $2, which covered day 1.
# On day 3, you bought a 7-day pass for costs[1] = $7, which covered days 3, 4, ..., 9.
# On day 20, you bought a 1-day pass for costs[0] = $2, which covered day 20.
# In total, you spent $11 and covered all the days of your travel.
# Example 2:

# Input: days = [1,2,3,4,5,6,7,8,9,10,30,31], costs = [2,7,15]
# Output: 17
# Explanation: For example, here is one way to buy passes that lets you travel your travel plan:
# On day 1, you bought a 30-day pass for costs[2] = $15 which covered days 1, 2, ..., 30.
# On day 31, you bought a 1-day pass for costs[0] = $2 which covered day 31.
# In total, you spent $17 and covered all the days of your travel.

# Constraints:

# 1 <= days.length <= 365
# 1 <= days[i] <= 365
# days is in strictly increasing order.
# costs.length == 3
# 1 <= costs[i] <= 1000
# Accepted
# 217.8K
# Submissions
# 333.8K
# Acceptance Rate
# 65.3%
# Seen this question in a real interview before?
# 1/4

# @param {Integer[]} days
# @param {Integer[]} costs
# @return {Integer}

require 'set'

def mincost_tickets(days, costs)
  days.sort!

  days_in_month = 0
  days_in_week = 0
  weeks = 0

  start_month = days[0]
  start_week = days[0]
  total = 0

  month_total = 0

  days.each_with_index do |d, i|
    if d - start_month >= 30
      weeks += 1 if days_in_week.positive?
      total += [month_total + (days_in_week * costs[0]), month_total + costs[1], weeks * costs[1], costs[2],
                days_in_month * costs[0]].min
      month_total = 0
      weeks = 0
      days_in_week = 0
      days_in_month = 0

      start_month = d
      start_week = d
    end

    if d - start_week >= 7
      weeks += 1
      month_total += [days_in_week * costs[0], costs[1]].min
      days_in_week = 0
      start_week = d
    end

    if d - start_month < 30
      days_in_month += 1
      days_in_week += 1
    end

    next unless i == days.length - 1

    weeks += 1 if days_in_week.positive?
    total += [month_total + (days_in_week * costs[0]), month_total + costs[1], weeks * costs[1], costs[2],
              days_in_month * costs[0]].min
  end
  total
end

def mincost_tickets(days, costs)
  dp = Array.new((days[-1] + 1)) { 0 }

  days.each do |day|
    dp[day] = costs[0]
  end

  (days[0]...days[-1] + 1).each do |i|
    dp[i] += dp[i - 1]
    dp[i] = [dp[i], (i < 7 ? 0 : dp[i - 7]) + costs[1]].min
    dp[i] = [dp[i], (i < 30 ? 0 : dp[i - 30]) + costs[2]].min
  end
  dp[-1]
end

require 'test/unit'

class TestMinCostTickets < Test::Unit::TestCase
  def test_
    assert_equal 17, mincost_tickets([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 30, 31], [2, 7, 15])
    assert_equal 11, mincost_tickets([1, 4, 6, 7, 8, 20], [2, 7, 15])
    assert_equal 10, mincost_tickets([4, 5, 9, 11, 14, 16, 17, 19, 21, 22, 24], [1, 4, 18])
  end
end
