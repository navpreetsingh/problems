
require 'byebug'
def solution(a)
    # write your code in Ruby 2.2
    positive_array = a.map {|aa| aa if aa>0 }.compact.uniq.sort
    if positive_array.empty? || positive_array.first > 1
        return 1
    else
        if positive_array.last == positive_array.count
            positive_array.last + 1
        else
            (1..positive_array.last).to_a.each_with_index do |item, index|
                if item != positive_array[index]
                    return item
                    break
                end
            end
        end
    end
end


arrays = [
    [1, 3, 6, 4, 1, 2],
    [1, 2, 3],
    [-1, -3] 
]

arrays.each do |arr|
    puts "Array: #{arr}\n"
    result = solution(arr)
    puts "Result: #{result}\n\n"
end