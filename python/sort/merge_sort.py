def merge_sort(a, p = 0, q = 0):
    if q == 0:
        q = len(a)

    if q - p < 2:
        return

    n = p + (q - p) / 2
    merge_sort(a, p, n)
    merge_sort(a, n, q)
    merge(a, p, q, n)
    return a

def merge(a, p, q, n):
    l = a[p:n] + [ float('inf') ]
    r = a[n:q] + [ float('inf') ]
    li = ri = 0
    while p < q:
        if l[li] < r[ri]:
            a[p] = l[li]
            li += 1
        else:
            a[p] = r[ri]
            ri += 1
        p += 1
