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
    attr_reader :move, :winning_moves

    @@winning_moves = {
        :rock => :scissors,
        :paper => :rock,
        :scissors => :paper
    }

    def initialize(move)
        @move = move
    end

    def self.for(input)
        case input
        when 'A'
            Move.new(:rock)
        when 'B'
            Move.new(:paper)
        when 'C'
            Move.new(:scissors)
        end
    end

    def self.opposing(input, opponent)
        case input
        when 'X'
            Move.new(@@winning_moves[opponent.move])
        when 'Y'
            Move.new(opponent.move)
        when 'Z'
            Move.new(@@winning_moves.key(opponent.move))
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
        .map do |choices|
            opponent = Move.for(choices[0])
            Match.new(opponent, Move.opposing(choices[1], opponent))
        end
end

rounds = build_rounds('input.txt')
score = rounds.sum { |round| round.score }
puts(score)

