# frozen_string_literal: true

def bubble_sort(array)
  (array.size - 1).times do
    array.each_with_index do |item, index|
      next_item = array[index + 1]
      next unless next_item && item > next_item

      array[index] = next_item
      array[index + 1] = item
    end
  end
  array
end

p bubble_sort([3, 1, 5, 2, 9, 6, 12, 54, 36, 16])
p bubble_sort([4, 3, 78, 2, 0, 2])
p bubble_sort([5, 1, 4, 2, 8])
p bubble_sort([9, 6, 5, 3, 2])
