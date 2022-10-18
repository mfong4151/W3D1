class Player

    def initialize(name)
        @name = name

    end

    def guess
        print "Guess a letter"
        ui = gets.chomp
        ui
    end 
    
end