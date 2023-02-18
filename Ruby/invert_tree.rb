# 226. Invert Binary Tree
# Easy
# 11.5K
# 163
# Companies
# Given the root of a binary tree, invert the tree, and return its root.

# Example 1:

# Input: root = [4,2,7,1,3,6,9]
# Output: [4,7,2,9,6,3,1]
# Example 2:

# Input: root = [2,1,3]
# Output: [2,3,1]
# Example 3:

# Input: root = []
# Output: []

# Constraints:

# The number of nodes in the tree is in the range [0, 100].
# -100 <= Node.val <= 100
# Accepted
# 1.5M
# Submissions
# 2M
# Acceptance Rate
# 74.3%
# Seen this question in a real interview before?
# 1/4
# Yes
# No

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {TreeNode}

require 'binary_trees'

def invert_tree(root)
  return nil unless root

  temp = root.left
  root.left = invert_tree(root.right)
  root.right = invert_tree(temp)
  root
end

require 'test/unit'

class TestInvertTree < Test::Unit::TestCase
  def test_
    assert_equal [4, 7, 2, 9, 6, 3, 1], Tree.new(invert_tree([4, 2, 7, 1, 3, 6, 9].to_tree)).to_a
    assert_equal [2, 3, 1], Tree.new(invert_tree([2, 1, 3].to_tree)).to_a
    assert_equal [], Tree.new(invert_tree([].to_tree)).to_a
  end
end
