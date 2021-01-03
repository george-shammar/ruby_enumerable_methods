module Enumerable
def my_select
    return to_enum(:my_select) unless block_given?

    new_arr = []
    each { |it| new_arr << it if yield(it) }
    new_arr
  end
end





friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

puts friends.my_select { |friend| friend != 'Brian' }
