module Enumerable
    def my_each(arr = to_a)
            arr.length.times do |item|
                yield arr[item]
            end
    end
end


module Enumerable
    def my_each_with_index
        arr = to_a
        arr.length.times do |item|
            yield arr[item], item
        end 
    end
end

# my_array = [2, 3, 4, 5, 99, 7, 78, 9, 10]

# my_array.my_each_with_index do |item, i|
#     if i.even?
#         puts item * 2
# end
# end
