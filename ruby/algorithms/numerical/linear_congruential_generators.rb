module K
  class Random
    @a = 5
    @b = 13
    @m = 2 ** 32

    def initialize(seed)
      @n = seed
    end

    def rand
      @n = (@n * @a + @b) % @m
    end

    def srand(seed)
      @n = seed
    end

    def const(a, b, m)
      @a = a
      @b = b
      @m = m
      self
    end

    class Checker
      def self.cyclic_period
        puts "+------------+-------+-------+-------+-------+"
        puts "|       rand | 8-bit | 4-bit | 2-bit | 1-bit |"
        puts "+------------+-------+-------+-------+-------+"
        random = Random.new(1)
        32.times do
          r = random.rand
          a8 = r & 0b1111
          a4 = r & 0b0111
          a2 = r & 0b0011
          a1 = r & 0b0001
          puts "| %10d |    %2d |     %1d |     %1d |     %1d |" % [ r, a8, a4, a2, a1 ]
        end
        puts "+------------+-------+-------+-------+-------+"
      end

      def self.combination(m = 15)
        random = Random.new(1).const(13, 1, m + 1)
        r = []
        100.times{ r << [ random.rand, random.rand ] }

        puts "+#{'-' * m * 2}+"
        m.times do |y|
          line = '|'
          m.times do |x|
            num = 0
            r.each do |c|
              if c[0] == x && c[1] == y
                num += 1
              end
            end
            line += num > 0 ? ("%02d" % num) : '  '
          end

          puts line + '|'
        end
        puts "+#{'-' * m * 2}+"
      end
    end
  end
end
