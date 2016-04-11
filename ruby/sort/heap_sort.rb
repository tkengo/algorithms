def heap_sort(a)
  build_max_heap a
  (a.size - 1).downto(1) do |i|
    a[0], a[i] = a[i], a[0]
    max_heapify(a, 0, i)
  end
  a
end

def build_max_heap(a)
  l = (a.size - 1) / 2
  l.downto(0){|i| max_heapify(a, i) }
end

def max_heapify(a, i, size = a.size)
  l = i * 2 + 1
  r = l + 1

  m = i
  m = l if l < size && a[l] > a[m]
  m = r if r < size && a[r] > a[m]

  if i != m
    a[i], a[m] = a[m], a[i]
    max_heapify(a, m, size)
  end
end
