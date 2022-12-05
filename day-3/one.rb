class Rucksack
    def initialize(input)
        @first, @second = input.chars.each_slice(input.length / 2).map(&:join).map(&:chars)
    end
    def shared_item
        @first.intersection(@second).first
    end
end

def build_rucksacks(filename)
    File.readlines(filename, chomp: true)
        .map { |line| Rucksack.new(line) }
end

def get_priority(item)
    return item.ord - 64 + 26 if item.downcase != item
    item.ord - 96
end

sacks = build_rucksacks('input.txt')
puts(sacks.map(&:shared_item).map(&method(:get_priority)).sum)