class Rucksack
    def initialize(lines)
        @first, @second, @third = lines.map(&:chars)
    end
    def shared_item
        @first.intersection(@second).intersection(@third).first
    end
end

def build_rucksacks(filename)
    File.readlines(filename, chomp: true)
        .each_slice(3)
        .map { |lines| Rucksack.new(lines) }
end

def get_priority(item)
    return item.ord - 64 + 26 if item.downcase != item
    item.ord - 96
end

sacks = build_rucksacks('input.txt')
puts(sacks.map(&:shared_item).map(&method(:get_priority)).sum)