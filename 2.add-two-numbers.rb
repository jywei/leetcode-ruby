# Time: O(n)
# Space: O(n)
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

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def add_two_numbers(l1, l2)
    sum = 0
    current = ListNode.new(0)
    result = current

    while (l1 || l2)
      if l1
        sum += l1.val
        l1 = l1.next
      end

      if l2
        sum += l2.val
        l2 = l2.next
      end

      current.next = ListNode.new(sum % 10)
      current = current.next

      sum = sum > 9 ? 1 : 0
    end

    current.next = ListNode.new(sum) if sum == 1

    result.next
end
