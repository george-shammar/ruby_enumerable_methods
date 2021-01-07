module Enumerable
  def my_each(arr = to_a)
    return enum_for (:my_each) unless block_given?

    arr.length.times do |object|
      yield arr[object]
    end
    self
  end

  def my_each_with_index
    return enum_for (:my_each_with_index) unless block_given?

    arr = to_a
    arr.length.times do |object|
      yield arr[object], object
    end
    self
  end

  def my_select
    return enum_for (:my_select) unless block_given?

    array = []
    my_each do |object|
      array.push(object) if yield(object)
    end
    array
  end

  def my_all?
    my_each do |object|
      return true if yield(object) == true

      return false
    end
  end

  def my_any?
    my_each do |i|
      return true if yield(i) == true
    end
    false
  end

  def my_none?
    my_each do |object|
      return true if yield(object) == false

      return false
    end
  end

  def my_count
    number = 0
    my_each do |item|
      number += 1 if yield(item) == true
    end
    number
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

# my_proc = proc { |x| x + 7 }
# arr = [4, 16, 9]
# puts arr.my_map(&my_proc)

