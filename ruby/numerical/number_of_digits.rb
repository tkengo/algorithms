def number_of_digits(n)
  Math.log(n, 10).ceil
end

class Integer
  def digits
    number_of_digits self
  end
end
