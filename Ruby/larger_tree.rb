# Suppose you're given a binary tree represented as an array. For example, [3,6,2,9,-1,10] represents the following binary tree (where -1 is a non-existent node):

# enter image description here

# Write a function that determines whether the left or right branch of the tree is larger. The size of each branch is the sum of the node values. The function should return the string "Right" if the right side is larger and "Left" if the left side is larger. If the tree has 0 nodes or if the size of the branches are equal, return the empty string.

# Example Input:

# [3,6,2,9,-1,10]
# Example Output:

# Left

class Array
  def to_root(i = 0)
    root = nil
    if i < length
      root = TreeNode.new(self[i])
      root.left = to_root(i * 2 + 1)
      root.right = to_root(i * 2 + 2)
    end
    root
  end
end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Tree
  def initialize(root = nil)
    @root = root
  end

  def sum(root = @root)
    return 0 if root.nil?

    root.val + sum(root.left) + sum(root.right)
  end
end

def solution(numbers)
  return '' if !numbers || numbers.length.zero?

  root = numbers.to_root
  left = traverse(root.left, 0)
  right = traverse(root.right, 0)

  return '' if left == right

  left > right ? 'Left' : 'Right'
end

def traverse(node, total)
  return if node.nil? || node.val == -1

  total += node.val
  traverse(node.left, total) unless node.left.nil?
  traverse(node.right, total) unless node.right.nil?
  total
end

require 'test/unit'

class TestSolution < Test::Unit::TestCase
  def test_
    assert_equal 'Left', solution([3, 6, 2, 9, -1, 10])
  end
end
