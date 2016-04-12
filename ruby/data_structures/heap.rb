class Heap
  def initialize(a = nil)
    if a && !a.empty?
      @heap = Heap.build_max_heap a
    else
      @heap = []
    end
  end

  def add(v)
    @heap << v
    i = @heap.size - 1
    while !Heap.root?(i)
      p = Heap.parent i
      @heap[p] < @heap[i] ? @heap.exchange(p, i) : break
      i = p
    end
    @heap
  end

  def pop
    nil if @heap.empty?

    max = @heap[0]
    @heap[0] = @heap.pop
    Heap.max_heapify(@heap, 0)
    max
  end

  def root
    @heap.first
  end

  def to_a
    @heap
  end

  def inspect
    @heap.to_s
  end

  class << self
    def parent(i)
      (i - 1) / 2
    end

    def root?(i)
      i == 0
    end

    def left_child(i)
      i * 2 + 1
    end

    def right_child(i)
      i * 2 + 2
    end

    def build_max_heap(a)
      l = (a.size - 1) / 2
      l.downto(0){|i| max_heapify(a, i) }
      a
    end

    def max_heapify(a, i, size = a.size)
      l = left_child i
      r = right_child i

      m = i
      m = l if l < size && a[l] > a[m]
      m = r if r < size && a[r] > a[m]

      if i != m
        a[i], a[m] = a[m], a[i]
        max_heapify(a, m, size)
      end
    end
  end
end

class Array
  def to_heap
    Heap.new self
  end
end
