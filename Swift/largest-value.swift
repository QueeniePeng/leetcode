// Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).

 

// Example 1:


// Input: root = [1,3,2,5,3,null,9]
// Output: [1,3,9]
// Example 2:

// Input: root = [1,2,3]
// Output: [1,3]
 

// Constraints:

// The number of nodes in the tree will be in the range [0, 104].
// -231 <= Node.val <= 231 - 1

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class TreeNode {
  var val: Int
  var left: TreeNode?
  var right: TreeNode?

  init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

class Tree {
  var head: TreeNode?

  init(_ head: TreeNode? = nil) {
    self.head = head
  }

  func setTree(_ nums: inout [Int?], _ i: inout Int) -> TreeNode? {
    var root: TreeNode? = nil
    if i < nums.count {
      if let num = nums[i] {
        root = TreeNode(num)
        var left = i * 2 + 1
        var right = i * 2 + 2
        root?.left = setTree(&nums, &left)
        root?.right = setTree(&nums, &right)
      }
    }
    return root
  }
}


class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        
        return []
    }
}

var i = 0
var nums: [Int?] = [1,3,2,5,3,nil,9]
var tree = Tree().setTree(&nums, &i)
print(tree!.left!.left!.left == nil)
// [1,3,9]
// Solution().largestValues(tree)