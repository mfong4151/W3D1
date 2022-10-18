require_relative 'player'
require_relative 'trie'

class Game

    def self.convert_to_a(text)
        res = []
        text.split("\n").each do |word| 
            res << word
        end
        res
    end

    def self.get_dictionary
        file = File.open('dictionary.txt')
        text = file.read 
        text = Game.convert_to_a(text)
        file.close
        text
    end

    def self.build_trie
        dict = Game.get_dictionary
        trie = Trie.new()
        dict.each do |word|
            trie.add_word(word)
        end
        trie
    end

    def self.create_players
        players = []
        while true

            print "Please insert player names, or 'END' to stop player generation "
            ui = gets.chomp
            break if ui == 'END'
            players << Players.new(ui)
        end
        players
    end

    def initialize(target)
        @players = Game.create_players
        @fragment = ""
        @current_player = @players[0]
        @dictionary = Game.build_trie
    end


    def current_player
        @players[0]
    end

    def previous_player
        @players[-1]
    end

    def next_player!
        @players << @players.delete_at(0)
        @players[0]
    end

    def valid_play?(c)
       if !@dictionary.search_prefix(@fragment + c)
            p "That guess is incorrect"
            return false
       end 
       true
    end

    def take_turn
        valid_ui = false
        while !valid_ui
            ui = current_player.guess
            valid_ui = valid_play?ui
        end
        return ui
    end

    def lose?
        
    end 



    def play_round
        
    end
end


trie = Game.build_trie
p trie.search_prefix('a')