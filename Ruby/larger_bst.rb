# Suppose you're given a binary tree represented as an array. For example, 
# [3,6,2,9,-1,10] represents the following binary tree (where -1 is a non-existent node):

# enter image description here

# Write a function that determines whether the left or right branch of the tree is larger.
# The size of each branch is the sum of the node values. The function should return the string 
# "Right" if the right side is larger and "Left" if the left side is larger. If the tree has 0 nodes or if the size of the branches are equal, return the empty string.

# Example Input:

# [3,6,2,9,-1,10] 
# Example Output:

# Left

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Tree
  def initialize(head = nil)
    @head = head
  end

  def self.set_tree(arr, i)
    head = nil
    if i < arr.length
      return head if arr[i] == -1

      head = TreeNode.new(arr[i])
      head.left = Tree.set_tree(arr, i * 2 + 1)
      head.right = Tree.set_tree(arr, i * 2 + 2)
    end
    head
  end

  def self.sum_tree(head)
    return 0 if head.nil?

    head.val + Tree.sum_tree(head.left) + Tree.sum_tree(head.right)
  end

  def self.to_array(head, arr = [])
    return [] if head.nil?

    arr << head.val
    to_array(head.left, arr) if head.left
    to_array(head.right, arr) if head.right
    arr
  end
end

def solution(arr)
  return '' if arr.empty?

  root = Tree.set_tree(arr, 0)
  left = Tree.sum_tree(root.left)
  right = Tree.sum_tree(root.right)
  return '' if left == right

  left > right ? 'Left' : 'Right'
end

puts solution([3,6,2,9,-1,10])
