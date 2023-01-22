// 2. Add Two Numbers
// Medium
// 23.7K
// 4.6K
// Companies
// You are given two non-empty linked lists representing two non-negative integers. 
// The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 

// Example 1:


// Input: l1 = [2,4,3], l2 = [5,6,4]
// Output: [7,0,8]
// Explanation: 342 + 465 = 807.
// Example 2:

// Input: l1 = [0], l2 = [0]
// Output: [0]
// Example 3:

// Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
// Output: [8,9,9,9,0,0,0,1]

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if (l1 == nil && l2 == nil) { return nil }

        var total = (l1?.val ?? 0) + (l2?.val ?? 0)
        var carry = total >= 10 ? 1 : 0
        var result = ListNode(total % 10)
        sum(l1?.next, l2?.next, &carry, &result)

        func sum(_ l1: ListNode?, _ l2: ListNode?, _ carry: inout Int, _ result: inout ListNode) -> ListNode? {
            if (l1 == nil && l2 == nil && carry == 0) { return result }
            let val = ((l1?.val ?? 0) + (l2?.val ?? 0) + carry)
            result.next = ListNode(val % 10)
            carry = val >= 10 ? 1 : 0
            sum(l1?.next, l2?.next, &carry, &result.next!)
            return result
        }
        return result
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if (l1 == nil && l2 == nil) { return nil }
        var l1: ListNode? = l1
        var l2: ListNode? = l2

        var carry = 0
        var result = ListNode(0)
        let head = result

        while l1 != nil || l2 != nil || carry != 0 {
            let total = ((l1?.val ?? 0) + (l2?.val ?? 0) + carry)
            carry = total >= 10 ? 1 : 0
            result.next = ListNode(total % 10)

            result = result.next!
            l1 = l1?.next
            l2 = l2?.next
        }
        return head.next
    }
}