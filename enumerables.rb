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

  def my_any?
    my_each do |i|
      if yield(i) == true
        return true
      end
    end
    return false
  end

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

  def my_map(*)
    array = []
    my_each do |i|
      array.push(yield(i))
    end
    array
  end

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

# # Testing the enumerable methods.
# # my_each
# [1, 2, 3, 4, 5].my_each do |i|
#   puts i * 5
# end

# # my_each_with_index
# top = ['Walmart', 'Exxon Mobil', 'Apple']
# top.my_each_with_index do |company, index|
#   puts "#{index}. #{company}"
# end

# # my_select
# arry = [1, 2, 3, 4, 5, 6]
# puts arry.my_select { |n| n.even? }

# # my_all?
# enu1 = [10, 19, 18]
# res1 = enu1.my_all? { |num| num > 13 }
# puts res1

# # my_any?
# res2 = enu1.my_any? { |num| num > 13 }
# puts res2

# # my_none?
# res3 = enu1.my_none? { |num| num > 4 }
# puts res3

# # my_count
# puts [2, 4, 5, 2, 2].my_count { |i| i == 2 }

# # my_map
# test = [2, 4, 5]
# test.my_map do |i|
#   puts i * 10
# end

# my_proc = proc { |x| x + 7 }
# arr = [4, 16, 9]
# puts arr.my_map(&my_proc)
