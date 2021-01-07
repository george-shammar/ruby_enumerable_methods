# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
module Enumerable
  def my_each(arr = to_a)
    return enum_for: my_each unless block_given?

    arr.length.times do |object|
      yield arr[object]
    end
    self
  end

  def my_each_with_index
    return enum_for: my_each_with_index unless block_given?

    arr = to_a
    arr.length.times do |object|
      yield arr[object], object
    end
    self
  end

  def my_select
    return enum_for: my_select unless block_given?

    array = []
    my_each do |object|
      array.push(object) if yield(object)
    end
    array
  end

  def my_all?(*arg)
    if block_given?
      my_each { |object| return false unless yield(object) }
    elsif arg[0].is_a? Class
      my_each { |object| return false unless object.include?(arg[0]) }
    elsif arg[0].is_a? Regexp
      my_each { |object| return false unless arg[0].match(object) }
    elsif arg.empty?
      return include?(nil) || include?(false) ? false : true
    else
      my_each { |object| return false unless object == arg[0] }
    end
    true
  end

  def my_any?(*arg)
    if block_given?
      my_each { |object| return true if yield(object) }
    elsif arg.empty?
      my_each { |object| return true if object }
    elsif arg[0].is_a? Class
      my_each { |object| return true if object.include?(arg[0]) }
    elsif arg[0].is_a? Regexp
      my_each { |object| return true if arg[0].match(object) }
    else
      my_each { |object| return true if object == arg[0] }
    end
    false
  end

  def my_none?(*arg)
    if block_given?
      my_each do |object|
        return false if yield(object)
      end
    elsif arg.empty?
      my_each do |object|
        return false unless object.nil? || object == false
      end
    elsif arg[0].is_a? Regexp
      my_each do |object|
        return false if arg[0].match(object)
      end
    else
      my_each do |object|
        return false if object == arg[0]
      end
    end
    true
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
    return enum_for :my_map unless block_given?

    my_each do |i|
      array.push(yield(i))
    end
    array
  end

  def my_inject(accum = nil)
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

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
my_proc = proc { |x| x + 7 }
arr = [4, 16, 9]
arr.my_map(&my_proc)
