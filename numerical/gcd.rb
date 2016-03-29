def euclidean_algorithm(a, b)
  while b > 0
    a, b = b, a % b
  end
  a
end

def euclidean_algorithm_debug(a, b)
  a_digits = a.digits
  b_digits = b.digits
  max_digits = [ a_digits, b_digits ].max

  puts "+-#{'-' * max_digits}-+-#{'-' * max_digits}-+-#{'-' * max_digits}-+"
  puts "| %#{max_digits}s | %#{max_digits}s | %#{max_digits}s |" % [ 'a', 'b', 'r' ]
  puts "+-#{'-' * max_digits}-+-#{'-' * max_digits}-+-#{'-' * max_digits}-+"
  while b > 0
    puts "| %#{max_digits}d | %#{max_digits}d | %#{max_digits}d |" % [ a, b, a % b ]
    a, b = b, a % b
  end
  puts "| %#{max_digits}d | %#{max_digits}d | %#{max_digits}s |" % [ a, b, '-' ]
  puts "+-#{'-' * max_digits}-+-#{'-' * max_digits}-+-#{'-' * max_digits}-+"
  a
end

class Array
  def gcd(debug = { debug: false })
    debug[:debug] ? euclidean_algorithm_debug(self[0], self[1]) : euclidean_algorithm(self[0], self[1])
  end
end
