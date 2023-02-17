# 783. Minimum Distance Between BST Nodes
# Easy
# 2.9K
# 384
# Companies
# Given the root of a Binary Search Tree (BST), return the minimum difference between the values of any two different nodes in the tree.

# Example 1:

# Input: root = [4,2,6,1,3]
# Output: 1
# Example 2:

# Input: root = [1,0,48,null,null,12,49]
# Output: 1

# Constraints:

# The number of nodes in the tree is in the range [2, 100].
# 0 <= Node.val <= 105

# NOTE: This question is the same as 530: https://leetcode.com/problems/minimum-absolute-difference-in-bst/

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
# @return {Integer}
def min_diff_in_bst(root)
  @ans = 10**5
  @prev = 10**5

  walk(root)
  @ans
end

def walk(root)
  return if root.nil?

  walk(root.left) if root.left

  @ans = [@ans, (root.val - @prev).abs].min
  @prev = root.val
  walk(root.right) if root.right
end
