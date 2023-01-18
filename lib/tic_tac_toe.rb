require 'pry'

class TicTacToe
    attr_accessor :board, :count

    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [2, 4, 6], [0, 4, 8]]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts [" #{self.board[0]} | #{self.board[1]} | #{self.board[2]} ", "------------", " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} ", "------------", " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "]
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token="X")
        self.board[index] = token
    end

    def position_taken?(index)
        self.board[index] != " "
    end

    def valid_move?(index)
        index >= 0 && index <= 8 && !self.position_taken?(index)
    end

    def turn_count
        count = 0
        self.board.each do |position|
            if position != " "
                count += 1
            end
        end
        count
    end

    def current_player
        if self.turn_count % 2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Your move! Please choose a position between 1-9."
        move = gets
        index = self.input_to_index(move)
        if self.valid_move?(index)
            self.move(index, self.current_player)
            self.display_board
        else 
            puts "Move invalid. Please choose a new move."
            self.turn
        end
    end

    def won?
        WIN_COMBINATIONS.find do |combo|
            if self.board[combo[0]] == self.board[combo[1]] && self.board[combo[1]] == self.board[combo[2]] && self.board[combo[0]] != " "
                combo
            else
                false
            end
        end
    end

    def full?
        if self.board.include?(" ")
            return false
        else
            return true
        end
    end

    def draw?
        if self.full? && !self.won?
            return true
        else
            return false
        end
    end

    def over?
        if self.won? || self.draw?
            return true
        else 
            return false
        end
    end

    def winner
        if self.won?
            self.board[self.won?[0]]
        else
            return nil
        end
    end

    def play
        while !self.over?
            self.turn
        end

        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end


end

