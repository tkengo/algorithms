class PriorityQueue
  def initialize(a = nil)
    @queue = Heap.new a
  end

  def push(v)
    @queue.add v
  end

  def pop
    @queue.pop
  end

  def peek
    @queue.root
  end

  def inspect
    @queue.inspect
  end
end
