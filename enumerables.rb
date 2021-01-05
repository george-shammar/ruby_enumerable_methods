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

module Enumerable
    def my_any?
         my_each do |i|
             if yield(i) == true
                return true
             end
            end
    return false
end
end

 

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

# module Enumerable
#     def my_count
#         number = 0
#         length.times do
#             number +=1
#             if block_given?
#                 my_each do |item|
#                     if yield(item) == true
#                     end
#                 end
#             end
#         end
#     end
# end
# module Enumerable
# def my_count
#     count = 0
#     self.my_each { |i|
#         if yield(i) == true
#             count += 1
#         end
#     }
#     count
# end
# end

#     array = [3, 7, 5, 9, 43, 4, 2, 1, 3, 5, 9, 12, 34, 45, 67, 43, 56, 78]

#     # puts array.my_count

#     puts array.my_count { |x| x > 50 }

module Enumerable
    def my_map(obj = nil)
        array = []
        my_each do |i|
            array.push(yield(i))
        end
        array
      end
    end

# module Enumerable
#     def my_inject(accum = nil)
#         my_each do |result, item|
#             yield(result + accum)
#         end
#     end
# end

# puts [3, 6, 10, 13].my_inject