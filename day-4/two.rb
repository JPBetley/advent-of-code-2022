class Assignment
    def initialize(input)
        @first, @second = input
            .map { |x| x.split('-') }
            .map { |x| Range.new(x.first.to_i, x.last.to_i) }
    end

    def overlaps
        (@first.first <= @second.last) and (@second.first <= @first.last)
    end
end

def build_assignments(filename)
    File.readlines(filename, chomp: true)
        .map { |line| Assignment.new(line.split(',')) }
end

assignments = build_assignments('input.txt')
puts(assignments.map(&:overlaps).count(true))
