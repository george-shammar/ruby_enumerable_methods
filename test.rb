
# Testing the enumerable methods.
# my_each
[1, 2, 3, 4, 5].my_each do |i|
    puts i * 5
  end
  
  # my_each_with_index
  top = ['Walmart', 'Exxon Mobil', 'Apple']
  top.my_each_with_index do |company, index|
    puts "#{index}. #{company}"
  end
  
  # my_select
  [2, 4, 5].my_select { |i|
      if i % 2 == 0
          puts i
      end
  }
  
  # my_all?
  enu1 = [10, 19, 18]
  res1 = enu1.my_all? { |num| num > 12 }
  puts res1
  
  # my_any?
  res2 = enu1.my_any? { |num| num > 23 }
  puts res2
  
  # my_none?
  res3 = enu1.my_none? { |num| num > 4 }
  puts res3
  
  # my_count
  puts [2, 4, 5, 2, 2].my_count { |i| i == 2 }
  
  # my_map
  test = [2, 4, 5]
  test.my_map do |i|
    puts i * 10
  end