// Suppose you're given a binary tree represented as an array.
//  For example, [3,6,2,9,-1,10] represents the following binary tree 
//  (where -1 is a non-existent node):

// Write a function that determines whether the left or right branch
// of the tree is larger. The size of each branch is the sum of the node values.
// The function should return the string "Right" if the right side is larger and "Left"
// if the left side is larger. If the tree has 0 nodes or if the size of the branches
// are equal, return the empty string.

// [3,6,2,9,-1,10] 
// Left

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
  
  sumTree = (head) => {
      if (head == null) { return 0; }
      return head.value + new Tree().sumTree(head.left) + new Tree().sumTree(head.right);
  }
}

const solution = (arr) => {
  if (!arr || arr.length <= 1) { return ''; }
  const head = new Tree().setTree(arr, 0);
  const left = new Tree().sumTree(head.left);
  const right = new Tree().sumTree(head.right);
  console.log(left);
  console.log(right);
  return left === right ? '' : (left > right ? 'Left' : 'Right');
};

var a = [3,6,2,9,-1,10];
var result = solution(a);
console.log(result);