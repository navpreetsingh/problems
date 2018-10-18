
require 'byebug'
def solution(arr)
    arr = arr.split(",")
    hash = {}
    hash_direct = {}
    arr.each_with_index do |a, index|
        value = a.split("-")
        if index == 0
            hash[value[1]]  = []
            hash_direct[value[1]] = value[1]
            hash[value[1]].push(a)
        else
            if hash_direct.keys.include?(value[0])
                hash[hash_direct[value[0]]].push(a)
                vv = hash_direct[value[0]]
                hash_direct = {}
                hash_direct[value[1]] = vv
                

            else
                hash[value[1]] = []
                hash[value[1]].push(a)
                hash_direct = {}
                hash_direct[value[1]] = value[1]
            end
        end
    end
        count = 0
        output = []
        # byebug
        # puts hash
        hash.keys.each do |key|
            count_1 = hash[key].count
            count = count_1 if count < count_1
            output = [key, count]
        end
        # puts output
        return output[1]
end


arrays = [
    "6-3",
    "4-3,5-1,2-2,1-3,4-4",
    "1-1,3-5,5-2,2-3,2-4",
    "1-1",
    "1-2,1-2",
    "3-2,2-1,1-4,4-4,5-4,4-2,2-1",
    "5-5,5-5,4-4,5-5,5-5,5-5,5-5,5-5,5-5,5-5",
    "1-1,3-5,5-5,5-4,4-2,1-3",
    "1-2,2-2,3-3,3-4,4-5,1-1,1-2"
]



arrays.each do |arr|
    puts "Array: #{arr}\n"
    result = solution(arr)
    puts "Result: #{result}\n\n"
end