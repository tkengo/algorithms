class Array
  def merge_sort(p = 0, q = self.size)
    return if q - p < 2

    n = p + (q - p) / 2
    merge_sort(p, n)
    merge_sort(n, q)
    merge_sort_combine(self, p, q, n)
    self
  end

  private

  def merge_sort_combine(a, p, q, n)
    l = a[p..n-1] + [ Float::INFINITY ]
    r = a[n..q-1] + [ Float::INFINITY ]
    li = ri = 0
    while p < q
      if l[li] <= r[ri]
        a[p] = l[li]
        li += 1
      else
        a[p] = r[ri]
        ri += 1
      end
      p += 1
    end
  end
end
