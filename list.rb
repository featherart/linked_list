require 'pry'

class LinkedListNode
  attr_accessor :value, :next

  def initialize(value)
  	@value = value
  end
  
  # define an array
  def [](n)
  	node = self
  	n.times { node = node.next }
    node
  end

  # insert a new node after the current node
  def insert(node) 
    oldNext = self.next
    self.next = node
    node.next = oldNext
  end

  # point the value to zero and let 
  # garbage collector clean up for you
  def deleteAfter
    self.next = self.next.next
  end

  def length
  	node = self
  	length = 1
  	while node.next
  	  node = node.next
  	  length += 1
  	end
  	length
  end
  
  # return last node
  # standard way
  def last
  	node = self
  	until node.next == nil
      node = node.next
    end
    node
  end

  # other way
  def last2
  	index = self.length - 1
  	self[index]
  end
  
  # return largest node
  def max
  	max = self
  	node = self

  	while node.next != nil
  	  if node.value.length > max.value.length
  	  	max = node
  	  end
  	end
  	max
  end
  
  # return smallest node
  def min
  	min = self
  	node = self

  	while node.next != nil
  	  if node.value.length < min.value.length
  	  	min = node
  	  end
  	end
  	min
  end

  def sum
  	total = self.value.length
  	node = self

  	while node.next
  	  node = node.next
  	  total += node.value.length
  	end
  end

  # return average 
  def mean
  	self.sum / self.length
  end
end

  list = LinkedListNode.new('First')
  list.next = LinkedListNode.new('Second')
  list[1].next = LinkedListNode.new('Third')  
  list[1].insert(LinkedListNode.new('Second Point Five'))

  
  # test it out
  puts list[0].value
  puts list[1].value
  puts list[2].value
  puts list[3].value
  puts "length of list: " + list.length.to_s
  puts "last node: " + list.last.value.to_s
  puts "max node: " + list.max.value.to_s
  puts "min node: " + list.min.value.to_s
  puts "mean node: " + list.mean.value.to_s

  binding.pry
