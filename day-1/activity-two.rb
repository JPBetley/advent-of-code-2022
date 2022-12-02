def read_file(filename)
    File.readlines(filename, chomp: true)
end

def group_line_data(file_data)
    file_data.chunk_while { |line| !line.empty? }
end

def sum_elf_calories(grouped_data)
    grouped_data.map { |elf| elf.reject.map(&:to_i).sum }
end

def get_top_three(elves)
    elves.sort.last(3)
end

file_data = read_file('input.txt')
grouped_data = group_line_data(file_data)
elves = sum_elf_calories(grouped_data)
total = get_top_three(elves).sum

puts(total)
