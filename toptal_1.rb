require 'byebug'
def solution(a,b)
    # write your code in Ruby 2.2
    card_count = a.count - 1
    positive_array = (0..card_count).to_a.map {|c| [a[c],b[c]].max}.uniq.sort
    if positive_array.first > 1
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
    [[1,2,4,3],[1,3,2,3]],
    [[3,2,1,6,5],[4,2,1,3,3]],
    [[1,2],[1,2]]
]

arrays.each do |arr|
    puts "Array: #{arr}\n"
    result = solution(arr[0], arr[1])
    puts "Result: #{result}\n\n"
end