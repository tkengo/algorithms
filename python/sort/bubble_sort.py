def bubble_sort(a):
    for i in xrange(1, len(a) + 1):
        for j in xrange(len(a) - i):
            if a[j] > a[j + 1]:
                a[j], a[j + 1] = a[j + 1], a[j]
    return a
