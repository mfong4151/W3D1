class TrieNode
    attr_reader :children, :end
    attr_writer :children, :end

    def initialize
        @children = {}
        @end = false
    end

end 

class Trie
    def initialize
        @root = TrieNode.new()
    end


    def add_word(word)
        curr = @root
        
        word.each_char do |c|

            curr.children[c] = TrieNode.new() if !curr.children.has_key?c
            curr = curr.children[c]
        end
        curr.end = true

    end

    def search_word(word)

        curr = @root

        word.each_char do |c|
            return false if !curr.children.has_key?c
            curr = curr.children[c]
        end 
        return curr.end
    end

    def search_prefix(prefix)
        curr = @root

        prefix.each_char do |c|
            return false if !curr.children.has_key?c
            curr = curr.children[c]
        end 

        return true
    
    end

end