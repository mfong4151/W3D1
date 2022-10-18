require_relative 'clean_input'


#O(M*N - boarder) complexity for BFS 

def bfs(maze, s, e)
    path_taken = maze.clone
    first = [s[0], s[1]]
    visited =  {first => 0}

    s << [first]

    q = [s]

    while q != []
        y, x, score =  q.delete_at(0)

        [[0, 1], [0, -1], [-1, 0], [1, 0]].each do |i, j|
            r, c = y + i, x + j

            if r < 0 || c < 0 || r >= maze.length || c >= maze[0].length || maze[r][c] == "*"
                next

            end


            if r == e[0] && c == e[1]
                path_taken[r][c] = score + 1
                return r, c, score + 1, path_taken


            elsif visited.has_key?([r, c])
                if visited[[r, c]] <= score + 1
                    next

                else
                    visited[[r,c]] = score + 1
                    path_taken[r][c] = score + 1
                    q << [r, c, score + 1]
                end
            

            else
                visited[[r,c]] = score + 1
                path_taken[r][c] = score + 1
                q << [r, c, score + 1] 
            end
        end

    end

    return -1, -1, -1, -1, -1

end


class Array

    def find_SE
        s, e = [], []
        
        (0...self.length).each do |i|
            (0...self[0].length).each do |j|
                if self[i][j] == 'S'
                    s = [i, j]
                end
                
                if self[i][j] == 'E'

                    e = [i, j]
                end
            end
        end
        s << 0
        e << 0
        return s, e
    end 
end






maze = unpack_zip




s, e = maze.find_SE

x, y, score, pathfinder = bfs(maze, s, e)
p pathfinder




#Sample of the maze , although it looks like the spaces get kind of bloated
#[["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"],
# ["*", " ", " ", " ", " ", " ", " ", " ", " ", " ", "*", " ", " ", " ", "E", "*"], 
# ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", "*", "*", "*"], 
# ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
# ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
# ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
# ["*", "S", " ", " ", " ", "*", " ", " ", " ", " ", " ", " ", " ", " ", " ", "*"], 
# ["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]]

#Sample of what gets produced  by bfs
#[["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"], 
#["*", 5, 6, 7, 8, 9, 10, 11, 12, 13, "*", 25, 26, 27, 28, "*"], 
#["*", 4, 5, 6, 7, "*", 11, 12, 13, 14, "*", 24, 25, "*", "*", "*"], 
#["*", 3, 4, 5, 6, "*", 12, 13, 14, 15, "*", 23, 24, 25, 26, "*"], 
#["*", 2, 3, 4, 5, "*", 13, 14, 15, 16, "*", 22, 23, 24, 25, "*"], 
#["*", 1, 2, 3, 4, "*", 14, 15, 16, 17, "*", 21, 22, 23, 24, "*"], 
#["*", "S", 1, 2, 3, "*", 15, 16, 17, 18, 19, 20, 21, 22, 23, "*"], 
#["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]]


