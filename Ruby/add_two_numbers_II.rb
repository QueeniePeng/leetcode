# Add Two Numbers II
# You are given two non-empty linked lists representing two non-negative integers. 
# The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 

# Example 1:


# Input: l1 = [7,2,4,3], l2 = [5,6,4]
# Output: [7,8,0,7]
# Example 2:

# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [8,0,7]
# Example 3:

# Input: l1 = [0], l2 = [0]
# Output: [0]
 

# Constraints:

# The number of nodes in each linked list is in the range [1, 100].
# 0 <= Node.val <= 9
# It is guaranteed that the list represents a number that does not have leading zeros.
 

# Follow up: Could you solve it without reversing the input lists?

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  a = ''
  b = ''

  while l1
      a += l1.val.to_s
      l1 = l1.next
  end

  while l2
      b += l2.val.to_s
      l2 = l2.next
  end

  total = a.to_i + b.to_i
  root = ListNode.new(0)
  current = root

  total.to_s.each_char.with_index do |c, i|
      current.next = ListNode.new(c.to_i)
      current = current.next
  end
  root.next
end

