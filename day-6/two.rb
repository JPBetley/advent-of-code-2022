letters = File.readlines('input.txt', chomp: true).first.chars
groups = letters.map.with_index { |x, i| letters.slice(i, 14) }
uniq_index = groups.find_index { |x| x == x.uniq }
puts(uniq_index + 14)
