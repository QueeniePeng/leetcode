
// convert array to list node

class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func solution(_ nums: [Int]) -> ListNode? {
  var l: ListNode = ListNode(0)
  let head: ListNode = l;

  for num in nums {
    l.next = ListNode(num)
    l = l.next!
  }
  return head.next
}

func reverse(_ l: ListNode?) -> [Int] {
  
  var arr: [Int] = []
  var l: ListNode? = l

  while l != nil {
    if let l = l {
      arr.append(l.val)
    }

    l = l?.next
  }
  return arr
}

let l: ListNode = solution([0, 1, 2, 3, 4, 5, 6])!
print(reverse(l))