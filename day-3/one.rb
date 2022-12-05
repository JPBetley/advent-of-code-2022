class Rucksack
    @@capital_offset = 38
    @@lowercase_offset = 96

    def initialize(input)
        @first, @second = input.chars.each_slice(input.length / 2).map(&:join).map(&:chars)
    end

    def shared_item
        @shared_item = @first.intersection(@second).first
    end

    def get_priority
        return shared_item.ord - @@capital_offset if shared_item.downcase != shared_item
        shared_item.ord - @@lowercase_offset
    end
end

def build_rucksacks(filename)
    File.readlines(filename, chomp: true)
        .map { |line| Rucksack.new(line) }
end

sacks = build_rucksacks('input.txt')
puts(sacks.map(&:get_priority).sum)
