def insertion_sort(a):
    for i in xrange(len(a)):
        v, j = a[i], i
        while j > 0 and a[j - 1] > v:
            a[j] = a[j - 1]
            j -= 1
        a[j] = v
    return a
