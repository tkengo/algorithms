class Array
  def heap_sort
    Heap.build_max_heap self
    (size - 1).downto(1) do |i|
      exchange(0, i)
      Heap.max_heapify(self, 0, i)
    end
    self
  end
end
