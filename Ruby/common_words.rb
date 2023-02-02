# Given a string array words, return an array of all characters that show up in
# all strings within the words (including duplicates). You may return the answer in any order.

# Example 1:

# Input: words = ["bella","label","roller"]
# Output: ["e","l","l"]
# Example 2:

# Input: words = ["cool","lock","cook"]
# Output: ["c","o"]

# Constraints:

# 1 <= words.length <= 100
# 1 <= words[i].length <= 100
# words[i] consists of lowercase English letters.

# @param {String[]} words
# @return {String[]}
def common_chars(words)
  dict = {}

  words.each do |w|
    w.each_char do |c|
      dict[c] ||= 0
      dict[c] += 1
    end
  end
  l = words.count
  ans = []
  dict.each do |k, v|
    next unless v >= l

    n = v / l
    while n > 1
      arr << k
      n -= 1
    end
  end
  ans
end

def common_chars(words)
  common_count = Hash.new(0)
  words.first.chars.each { |char| common_count[char] += 1 }

  words.each do |word|
    common_count.each do |char, count|
      common_count[char] = [count, word.count(char)].min
    end
  end

  result = []
  common_count.each do |char, count|
    result += Array.new(count, char) if count.positive?
  end
  result
end

puts common_chars(%w[cool lock cook])
