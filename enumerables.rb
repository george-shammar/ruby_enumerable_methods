module Enumerable
  def my_each(arr = to_a)
    arr.length.times do |object|
      yield arr[object]
    end
  end

  def my_each_with_index
    arr = to_a
    arr.length.times do |object|
      yield arr[object], object
    end
  end

  def my_select
    array = []
    my_each do |object|
      array.push(object) if yield(object)
    end
    array
  end

  def my_all?
    my_each do |object|
      if yield(object) == true
        return true
        else
            return false
        end
    end
end

# It returns a boolean value if any of the object in the enumerable satisfies the given condition, else it returns false.
def my_any?
    my_each do |i|
        if yield(i) == true
            return true
        end
    end
    return false
end

# It returns a boolean value if any of the object in the enumerable satisfies the given condition, else it returns false.
def my_none?
    my_each do |object|
        if yield(object) == false
            return true
        else
            return false
        end
    end
end

def my_count
    number = 0
    arr = to_a
    if block_given?
        my_each do |item|
            if yield(item) == true
                number += 1
            end
        end
        number
    end
end

#It returns a new array after evaluating the block with the element as an argument.
def my_map(obj = nil)
    array = []
    my_each do |i|
        array.push(yield(i))
    end
    array
end

# It passes each element and accumulate each sequentially.
def my_inject(accum = [0])
    my_each do |item|
        accum = yield(accum, item)
    end
    accum
end

def multiply_els(arr)
    arr.my_inject(1) do |accum, item|
        accum * item
    end
end

end


puts multiply_els([2,4,5])

my_proc = Proc.new { |x| x + 7 }
arr = [4, 16, 9]
puts arr.my_map(&my_proc)