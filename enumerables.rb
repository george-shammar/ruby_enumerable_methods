module Enumerable
    def my_each(arr = to_a)
            arr.length.times do |item|
                yield arr[item]
            end
    end
end

    
