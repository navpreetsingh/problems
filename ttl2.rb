
require 'byebug'
def solution(arr)
    # arr = arr.split(",")
    hash = {}
    hash_direct = {}
    # puts "Arr: #{arr}"
    arr.each_with_index do |a,i|
        a = a.split(">")
        hash[a[0]] = a[1]
    end
    # puts "Hash #{hash}"
    words = {}
    hash.keys.each do |key|
        words[key] = []
        boolean = true
        while_key = key
        while(boolean)
            words[key].push(while_key)
            while_key = hash[while_key]
            # puts "Key: #{key}, while_key: #{while_key}"
            unless hash[while_key]
                words[key].push(while_key)
                boolean = false
            end
        end
    end
    # puts "Words: #{words}"
    count = 0
    output = []
    words.keys.each do |key|
        count_1 = words[key].count
        if count < count_1
            count = count_1 
            output = [key, words[key].join(), count]
        end
    end
    # puts "Output #{output}"
    return output[1]
end
arrays = [
    ["P>E","E>R","R>U"],
    ["I>N","A>I","P>A","S>P"],
    ["U>N", "G>A", "R>Y", "H>U", "N>G", "A>R"],
    ["I>F", "W>I", "S>W", "F>T"],
    ["R>T", "A>L", "P>O", "O>R", "G>A", "T>U", "U>G"],
    ["W>I", "R>L", "T>Z", "Z>E", "S>W", "E>R", "L>A", "A>N", "N>D", "I>T"]
]



arrays.each do |arr|
    puts "Array: #{arr}\n"
    result = solution(arr)
    puts "Result: #{result}\n\n"
end