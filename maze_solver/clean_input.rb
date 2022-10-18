class String

    def convert_to_a
        res = []
        self.split("\n").each do |row| 
            temp = []
            row.each_char do |col| 
                temp << col
            end
            res << temp
        end
        res
    end

end



def unpack_zip()
    #puts 'Please give type in the maze text file'
    #ui = gets.chomp
    ui = 'maze.txt'
    file = File.open(ui)
    text = file.read 
    
    file.close

    text.convert_to_a
end




#D:/Documents/Code/App Academy/Week 3/W3D2/maze.txt