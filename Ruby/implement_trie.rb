# 208. Implement Trie (Prefix Tree)
# Medium
# 9.7K
# 115
# Companies
# A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

# Implement the Trie class:

# Trie() Initializes the trie object.
# void insert(String word) Inserts the string word into the trie.
# boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
# boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.

# Example 1:

# Input
# ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
# [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
# Output
# [null, null, true, false, true, null, true]

# Explanation
# Trie trie = new Trie();
# trie.insert("apple");
# trie.search("apple");   // return True
# trie.search("app");     // return False
# trie.startsWith("app"); // return True
# trie.insert("app");
# trie.search("app");     // return True

# Constraints:

# 1 <= word.length, prefix.length <= 2000
# word and prefix consist only of lowercase English letters.
# At most 3 * 104 calls in total will be made to insert, search, and startsWith.
# Accepted
# 782K
# Submissions
# 1.3M
# Acceptance Rate
# 62.4%
# Seen this question in a real interview before?
# 1/4

class Trie
  attr_accessor :words, :prefixes

  def initialize
    @words = Set.new
    @prefixes = Set.new
  end

  #   :type word: String
  #   :rtype: Void
  def insert(word)
    words.add(word)
    word.length.times { |i| prefixes.add(word[0..i]) }
  end

  #   :type word: String
  #   :rtype: Boolean
  def search(word)
    words.include?(word)
  end

  #   :type prefix: String
  #   :rtype: Boolean
  def starts_with(prefix)
    prefixes.include?(prefix)
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
