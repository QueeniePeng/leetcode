# 94. Binary Tree Inorder Traversal
# Easy
# 10.6K
# 505
# Companies
# Given the root of a binary tree, return the inorder traversal of its nodes' values.

 

# Example 1:


# Input: root = [1,null,2,3]
# Output: [1,3,2]
# Example 2:

# Input: root = []
# Output: []
# Example 3:

# Input: root = [1]
# Output: [1]
 

# Constraints:

# The number of nodes in the tree is in the range [0, 100].
# -100 <= Node.val <= 100
 

# Follow up: Recursive solution is trivial, could you do it iteratively?
# Accepted
# 1.9M
# Submissions
# 2.6M
# Acceptance Rate
# 73.4%
# Seen this question in a real interview before?
# 1/4
# Yes


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
# @return {Integer[]}

def inorder_traversal(root, ans = [])
  return [] if root.nil?
  inorder_traversal(root.left, ans) if node.left
  ans << root.val
  inorder_traversal(root.right, ans) if node.right
  ans
end
