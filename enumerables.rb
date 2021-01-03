module Enumerable
    def my_each(arr = to_a)
            arr.length.times do |item|
                yield arr[item]
            end
    end
end

my_array = [3, 4, 7, 2, 9]

 my_array.my_each do |item|
    puts item * 2
end
    
