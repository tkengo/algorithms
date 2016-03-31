def insertion_sort(a)
  1.upto(a.size - 1) do |i|
    v = a[i]
    while i > 0 && a[i - 1] > v
      a[i] = a[i - 1]
      i -= 1
    end
    a[i] = v
  end
  a
end
