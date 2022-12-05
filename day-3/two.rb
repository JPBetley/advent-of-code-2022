class Rucksack
    @@capital_offset = 38
    @@lowercase_offset = 96

    def initialize(lines)
        @first, @second, @third = lines.map(&:chars)
    end

    def shared_item
        @shared_item = @first.intersection(@second).intersection(@third).first
    end

    def get_priority
        return shared_item.ord - @@capital_offset if shared_item.downcase != shared_item
        shared_item.ord - @@lowercase_offset
    end
end

def build_rucksacks(filename)
    File.readlines(filename, chomp: true)
        .each_slice(3)
        .map { |lines| Rucksack.new(lines) }
end

sacks = build_rucksacks('input.txt')
puts(sacks.map(&:get_priority).sum)