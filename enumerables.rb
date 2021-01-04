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

module Enumerable
    def my_select
        array = []
        my_each do |item|
            array.push(item) if yield(item)
            end
        array
    end
end

module Enumerable
    def my_all?
        arr = to_a
            arr.my_each do |item|
           if yield(item)== true
            return true
           else
            return false
           end 
        end
    end
end
