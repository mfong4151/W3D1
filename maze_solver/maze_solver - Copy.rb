require_relative 'clean_input'
require 'set'


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

#
def dfs()



end


#O(M*N - boarder complexity for BFS) 

def bfs(maze, s, e)
    
    first = [s[0], s[1]]
    visited =  {first => 0}
    adjList = Hash.new{|h, k| h[k] = []}
    s << 0

    q = [s]


    while q != []
        y, x, score =  q.delete_at(0)

        [[0, 1], [0, -1], [-1, 0], [1, 0]].each do |i, j|
            r, c = y + i, x + j

            if r < 0 || c < 0 || r >= maze.length || c >= maze[0].length || maze[r][c] == "*"
                next

            end


            if r == e[0] && c == e[1]
                adjList[[r, c]] << [y, x]
                return r, c, score + 1, adjList, visited


            elsif visited.has_key?([r, c])
                if visited[[r, c]] <= score + 1
                    next

                else
                    visited[[r,c]] = score + 1
                    adjList[[r,c]] << [y, x]
                    q << [r, c, score + 1]
                end
            

            else
                visited[[r,c]] = score + 1
                adjList[[r, c]] << [y, x]
                q << [r, c, score + 1]
            end
        end

    end

    return -1, -1, -1, -1, -1

end





maze = unpack_zip


#Sample of the maze , although it looks like the spaces get kind of bloated
#[["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"],
# ["*", " ", " ", " ", " ", " ", " ", " ", " ", " ", "*", " ", " ", " ", "E", "*"], 
# ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", "*", "*", "*"], 
# ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
# ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
# ["*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*", " ", " ", " ", " ", "*"], 
# ["*", "S", " ", " ", " ", "*", " ", " ", " ", " ", " ", " ", " ", " ", " ", "*"], 
# ["*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]]


s, e = maze.find_SE

x, y, score, paths, visited = bfs(maze, s, e)

score
paths
p visited

#def dfs_path_finder(paths, s, e, cnt,  shortest - 1)


