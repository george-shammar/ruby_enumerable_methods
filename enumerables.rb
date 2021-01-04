module Enumerable
    def my_each(arr = to_a)
            arr.length.times do |object|
                yield arr[object]
            end
    end
end


module Enumerable
    def my_each_with_index
        arr = to_a
        arr.length.times do |object|
            yield arr[object], object
        end 
    end
end

module Enumerable
    def my_select
        array = []
        my_each do |object|
            array.push(object) if yield(object)
            end
        array
    end
end

module Enumerable
    def my_all?
        my_each do |object|
            if yield(object) == true
            return true
           else
            return false
           end 
        end
    end
end



# module Enumerable
#     def my_any?
#         arr = to_a
#         arr.my_each do |i|
#             if yield(i) == true
#                 return true
#             else
#                 return false
#             end
#         end
#     end
# end

# enu1 = [10, 12, 18] 
# res1 = enu1.my_any? { |num| num>13}  
# puts res1 

module Enumerable
    def my_none?
       my_each do |object|
        if yield(object) == false
            return true
        else 
            return false
        end
    end
end
end

