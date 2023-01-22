// Consider all the leaves of a binary tree, from left to right order, the values of those leaves form a leaf value sequence.



// For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).

// Two binary trees are considered leaf-similar if their leaf value sequence is the same.

// Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.

 

// Example 1:


// Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
// Output: true
// Example 2:


// Input: root1 = [1,2,3], root2 = [1,3,2]
// Output: false
 

// Constraints:

// The number of nodes in each tree will be in the range [1, 200].
// Both of the given trees will have values in the range [0, 200].



/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root1
 * @param {TreeNode} root2
 * @return {boolean}
 */

class TreeNode {
  constructor(value) {
      this.value = value;
      this.left = null;
      this.right = null;
  }
}

class Tree {
  constructor(head = null) {
      this.head = head;
  }

  setTree = (arr, i) => {
      let head = null;
      if (i < arr.length) {
          if (arr[i] === -1) { return head; }
          head = new TreeNode(arr[i]);
          head.left = new Tree().setTree(arr, i * 2 + 1);
          head.right = new Tree().setTree(arr, i * 2 + 2);
      }
      return head;
  }
}

var leafSimilar = function(root1, root2) {

  var result1 = [];
  var result2 = [];
  getLeaf(root1, result1)
  getLeaf(root2, result2)

  if (result1.length !== result2.length) { return false; }
  
  for(let i = 0; i < result1.length; i++) {
      if(result1[i] !== result2[i]) {
          return false;
      }
  }
  return true;
  
  function getLeaf(root, result) {
      if (root) {
          if (root?.left == null && root?.right == null) {
              result.push(root.val);
              return;
          }
          root?.left && getLeaf(root.left, result)
          root?.right && getLeaf(root.right, result)
      }
  }
};

var tree = new Tree();
var root1 = tree.setTree([3,5,1,6,2,9,8,null,null,7,4]);
var root2 = tree.setTree([3,5,1,6,7,4,2,null,null,null,null,null,null,9,8])
console.log(root1)