
class Array

    def my_each(&prc)
        prc ||= Proc.new{|i| i == i}
        res = []
        i = 0
        while i < self.length

            res << prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        res = []
        self.my_each do |i|
            res << i if prc.call(i)
        end
        res
    end


    def my_reject(&prc)
        res = []
        self.my_each do |i| 
            res << i if !prc.call(i)
        end
        
        res
    end

    def my_all?(&prc)

        self.each do |i|
            return false if !prc.call(i)
        end
        true

    end

    def my_any?(&prc)
        self.each do |i|
            return true if prc.call(i)
        end
        false
    end


    def my_flatten
        
        return self if self.all?{|i| i.class != Array}
        res = []
        self.each do |i|
            if i.class == Array
                res.push(*i.my_flatten)
            else
                res << i
            end
        end
        res
    end 


    def my_zip(*arrs)
        mx = self.length
        arrs.each{|arr| mx = [mx, arr.length].max}
        arrs.unshift(self)
        #arrs =
        
        arrs.each do |arr|
            if arr.length < mx
                (mx - arr.length).times{ arr << nil}
            end
        end
        
        arrs.transpose()
    end


    def my_rotate(num= 1)

        (num.abs()).times do
            if num > 0
                self << self.shift
                p self
            else
                self.unshift(self.pop)
            end
        end
        self
    
    end

    def my_join(joint="")

        return self.join(joint)
    end

    def my_reverse(l = 0, r = self.length - 1)
        return self if self == [] or self.length == 1
        return self if l >= r

        self[l], self[r] = self[r], self[l]

        return my_reverse(l+1, r-1)
    end
end




# calls my_each twice on the array, printing all the numbers twice.
#return_value = [1, 2, 3].my_each #do |num|
#    puts num
#   end.my_each do |num|
#    puts num
#   end
#   # => 1
#       2
#       3
#       1
#       2
#       3
#   
#return_value  # => [1, 2, 3]




#a = [1, 2, 3]
#p a.my_select { |num| num > 1 } # => [2, 3]
#p a.my_select { |num| num == 4 } # => []



#a = [1, 2, 3]
#p a.my_reject { |num| num > 1 } # => [1]
#p a.my_reject { |num| num == 4 } # => [1, 2, 3]


#a = [1, 2, 3]
#p a.my_any? { |num| num > 1 } # => true
#p a.my_any? { |num| num == 4 } # => false
#p a.my_all? { |num| num > 1 } # => false
#p a.my_all? { |num| num < 4 } # => true


#p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

#a = [ 4, 5, 6 ]
#b = [ 7, 8, 9 ]
#p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]#

#a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
#p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]##

#c = [10, 11, 12]
#d = [13, 14, 15]
#p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]



#a = [ "a", "b", "c", "d" ]

#a.my_rotate         #=> ["b", "c", "d", "a"]
#a.my_rotate(2)      #=> ["c", "d", "a", "b"]
#a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
#a.my_rotate(15)     #=> ["d", "a", "b", "c"]



#a = [ "a", "b", "c", "d" ]
#p a.my_join         # => "abcd"
#p a.my_join("$")    # => "a$b$c$d"



p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [1].my_reverse               #=> [1]