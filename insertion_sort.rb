def insertion_sort(a)
  a.size.times do |i|
    v = a[i + 1]
    while i >= 0 && a[i] > v
      a[i + 1] = a[i]
      i -= 1
    end
    a[i + 1] = v
  end
end
