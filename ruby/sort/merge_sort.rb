def merge_sort(a, p = 0, q = a.size)
  return if q - p < 2

  n = p + (q - p) / 2
  merge_sort(a, p, n)
  merge_sort(a, n, q)
  merge(a, p, q, n)
  return a
end

def merge(a, p, q, n)
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
