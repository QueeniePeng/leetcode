# 958. Check Completeness of a Binary Tree
# Medium
# 3.6K
# 46
# Companies
# Given the root of a binary tree, determine if it is a complete binary tree.

# In a complete binary tree, every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

# Example 1:

# Input: root = [1,2,3,4,5,6]
# Output: true
# Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.
# Example 2:

# Input: root = [1,2,3,4,5,null,7]
# Output: false
# Explanation: The node with value 7 isn't as far left as possible.

# Constraints:

# The number of nodes in the tree is in the range [1, 100].
# 1 <= Node.val <= 1000
# Accepted
# 182.3K
# Submissions
# 326.5K
# Acceptance Rate
# 55.8%
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
# @return {Boolean}

def is_complete_tree(root)
  a = [root]
  while node = a.shift
    a << node.left
    a << node.right
  end
  a.uniq == [nil]
end
