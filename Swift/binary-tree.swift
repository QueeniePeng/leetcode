

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

  fileprivate func setDict(_ root: inout TreeNode?, _ dict: inout [Int: Int], _ i: inout Int) {
    if let root = root {
      dict[i] = root.val
      var left = i * 2 + 1
      var right = i * 2 + 2
      setDict(&root.left, &dict, &left)
      setDict(&root.right, &dict, &right)
    }
  }

  func setArray(_ head: inout TreeNode?, _ i: inout Int) -> [Int] {
    var dict: [Int: Int] = [:]
    setDict(&head, &dict, &i)

    var arr: [Int] = []
    for i in 0..<dict.keys.count {
      arr.append(dict[i]!)
    }
    return arr
  }
}


var nums: [Int?] = [0,3,4,2,1,3,4,2]

var i = 0
var tree = Tree()
var root = tree.setTree(&nums, &i)

var j = 0
var arr: [Int] = tree.setArray(&root, &j)
print(arr)
