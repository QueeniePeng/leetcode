# 5. Longest Palindromic Substring
# Medium
# 23.4K
# 1.4K
# Companies
# Given a string s, return the longest 
# palindromic
 
# substring
#  in s.

 

# Example 1:

# Input: s = "babad"
# Output: "bab"
# Explanation: "aba" is also a valid answer.
# Example 2:

# Input: s = "cbbd"
# Output: "bb"
 

# Constraints:

# 1 <= s.length <= 1000
# s consist of only digits and English letters.
# Accepted
# 2.3M
# Submissions
# 7M
# Acceptance Rate
# 32.4%


def longest_palindrome(s)
  reverse_s = s.reverse
  dict = {}
  answer = ''

  s.each_char.with_index do |c, j|
    dict[c] ||= []
    dict[c] << j

    dict[c].each do |i|
      next unless s[i..j] == reverse_s[(-j - 1)..(-i - 1)] && answer.length < j - i + 1

      answer = s[i..j]
      break
    end
  end
  answer
end

def palindrom?(s, r_s)
  s[0..s.length / 2 - 1] == r_s[-(s.length / 2)..-1]
end

puts palindrom?('abba', 'abba')
puts longest_palindrome('abba')
