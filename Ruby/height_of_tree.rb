# The height of a binary tree is the length of the longest path from the root to any node in the tree. Given a binary tree represented in a one dimensional array, return the height of the tree.

# If the array is empty you should return 0.

# NOTE: empty elements in the input array are represented with the number -1.

# Example Input

# a simple tree

# 1 2 3 4 -1 -1 -1
# Example Output

# 3
# Explanation

# The longest path from the root node is 1 -> 2 -> 4

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

  def invert(root = @root)
    return nil unless root

    temp = root.left
    root.left = invert(root.right)
    root.right = invert(temp)
    root
  end

  def to_a(root = @root, arr = [], idx = 0)
    return [] if root.nil?

    arr[idx] = root.val
    to_a(root.left, arr, idx * 2 + 1) if root.left
    to_a(root.right, arr, idx * 2 + 2) if root.right
    arr
  end
end

def solution(tree)
  return 0 if tree.empty?

  root = tree.to_root
  @level = 0
  traverse(root, 1)
  @level
end

def traverse(node, level)
  return if node.nil? || node.val == -1

  @level = [@level, level].max
  traverse(node.left, level + 1) unless node.left.nil?
  traverse(node.right, level + 1) unless node.right.nil?
  level
end

require 'test/unit'

class TestSolution < Test::Unit::TestCase
  def test_
    assert_equal 3, solution([1, 2, 3, 4, -1, -1, -1])
  end
end
