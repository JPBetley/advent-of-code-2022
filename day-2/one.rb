class Match
    def initialize(opponent, me)
        @opponent = opponent
        @me = me
    end

    def score
        @me.score + @me.against(@opponent)
    end
end

class Move
    attr_reader :move

    def initialize(move)
        @move = move
    end

    def self.for(input)
        case input
        when 'A', 'X'
            Move.new(:rock)
        when 'B', 'Y'
            Move.new(:paper)
        when 'C', 'Z'
            Move.new(:scissors)
        end
    end
    
    def score
        case @move
        when :rock
            1
        when :paper
            2
        when :scissors
            3
        end
    end

    def against(opponent)
        return 3 if opponent.move == @move
        return 6 if @move == :rock and opponent.move == :scissors
        return 6 if @move == :paper and opponent.move == :rock
        return 6 if @move == :scissors and opponent.move == :paper
        0
    end
end

def build_rounds(filename)
    File.readlines(filename, chomp: true)
        .map { |line| line.split(' ') }
        .map { |choices| Match.new(Move.for(choices[0]), Move.for(choices[1])) }
end

rounds = build_rounds('input.txt')
score = rounds.sum { |round| round.score }
puts(score)

