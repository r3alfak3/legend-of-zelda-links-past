class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def infinite_loop?(list)
  slow = list.next_node
  fast = list.next_node

  until fast.nil?
    fast = fast.next_node
    return false if fast.nil?

    fast = fast.next_node
    slow = slow.next_node
    return true if fast == slow
  end

  return false
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(45, node3)
node5 = LinkedListNode.new(21, node4)

puts infinite_loop?(node5)
node1.next_node = node5
puts infinite_loop?(node5)