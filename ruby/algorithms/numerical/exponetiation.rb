def integer_exponentiation(a, b)
  exp = [ a ]
  index = 2
  while true
    exp << exp.last * exp.last
    break if index > b
    index *= 2
  end

  result = 1
  b.to_s(2).reverse.each_char.with_index do |s, i|
    result *= exp[i] if s == '1'
  end
  result
end
