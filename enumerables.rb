# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
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

  def my_all?(arg = nil)
    if block_given?
      my_each { |object| return false unless yield(object) }
    elsif arg.is_a? Regexp
      my_each { |object| return false unless object.to_s =~ arg }
    elsif arg.is_a? Class
      my_each { |object| return false unless object.is_a? arg }
    elsif arg
      my_each { |object| return false unless object == arg }
    elsif arg.nil?
      my_each { |object| return false unless object }
    else
      my_each { |object| return false unless object }
    end
    true
  end

  def my_any?(arg = nil)
    if block_given?
      my_each { |object| return true if yield(object) }
    elsif arg.is_a? Regexp
      my_each { |object| return true if object.to_s =~ arg }
    elsif arg.is_a? Class
      my_each { |object| return true if object.is_a? arg }
    elsif arg
      my_each { |object| return true if object == arg }
    elsif arg.nil?
      my_each { |object| return true if object }
    else
      my_each { |object| return true if object }
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

  def my_count(arg = nil)
    number = 0
    if block_given?
      my_each { |object| number += 1 if yield object }
    elsif arg
      my_each { |object| number += 1 if object == arg }
    else
      my_each { number += 1 }
    end
    number
  end

  def my_map(proc = nil)
    return enum_for (:my_map) unless block_given?

    arr = []
    if proc
      my_each { |object| arr.push(proc.call(object)) }
    else
      my_each { |object| arr.push(yield(object)) }
    end
    arr
  end

  def my_inject(*arg)
    arg[0].is_a?(Integer) ? initial = arg[0] : symbol = arg[0]
    if initial && !arg[1].is_a?(Integer)
      symbol = arg[1]
    elsif arg.nil?
      initial = self[0]
    end
    accum = initial
    if symbol
      my_each { |object| accum = accum ? accum.send(symbol, object) : object }
    else
      my_each { |object| accum = accum ? yield(accum, object) : object }
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
