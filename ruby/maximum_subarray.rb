def linear_maximum_subarray(a)
  maxsofar = 0
  maxendinghere = 0
  a.each do |v|
    maxendinghere = [ maxendinghere + v, 0 ].max
    maxsofar = [ maxsofar, maxendinghere ].max
  end
  maxsofar
end

def maximum_subarray(a, l = 0, h = a.size)
  return l, h, a[l] if h - l == 1

  m = l + (h - l) / 2
  ll, lh, lm = maximum_subarray(a, l, m)
  rl, rh, rm = maximum_subarray(a, m, h)
  ml, mh, mm = maximum_subarray_cross_sum(a, l, h, m)

  if lm > rm && lm > mm
    return ll, lh, lm
  elsif rm > lm && rm > mm
    return rl, rh, rm
  else
    return ml, mh, mm
  end
end

def maximum_subarray_cross_sum(a, l, h, m)
  lm = rm = -Float::INFINITY
  li = ri = 0

  sum = 0
  (m - 1).downto(l) do |i|
    if lm < sum += a[i]
      lm = sum
      li = i
    end
  end

  sum = 0
  m.upto(h - 1) do |i|
    if rm < sum += a[i]
      rm = sum
      ri = i
    end
  end

  return li, ri, lm + rm
end
