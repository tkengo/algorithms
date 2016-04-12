class Array
  def bubble_sort
    a = self
    (1..a.size).each do |i|
      (a.size - i).times do |j|
        if a[j] > a[j + 1]
          a[j], a[j + 1] = a[j + 1], a[j]
        end
      end
    end
    a
  end
end
