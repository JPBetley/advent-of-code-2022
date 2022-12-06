class Mover
    attr_reader :stacks

    def initialize(input)
        @stacks = slice_line(input.pop).to_h {|i| [i, []]}
        input.each do |line|
            slice_line(line).each_with_index do |x, i|
                @stacks[(i + 1).to_s].unshift(x) unless x == ' '
            end
        end
    end

    def move(input)
        _, count, _, from_stack, _, to_stack = input.split(' ')
        count.to_i.times do
            @stacks[to_stack].push(@stacks[from_stack].pop)
        end
    end

    def slice_line(line)
        line.chars.drop(1).each_slice(4).map(&:first)
    end
    
    def get_tops
        @stacks.values.map(&:last).join
    end
end

def build(filename)
    File.readlines(filename, chomp: true)
        .chunk(&:empty?)
        .map(&:last)
        .reject  { |c| c.all?(&:empty?) }
end

stacks, moves = build('input.txt')
mover = Mover.new(stacks)
moves.each { |x| mover.move(x) }
puts(mover.get_tops)