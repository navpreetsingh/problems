# Single Stack Multi Array
=begin
    output = [
        'azzz',
        'xzx',
        nil
    ]
=end

require 'byebug'

def solution(string)
    if string.nil?
        return nil
    else
        string = string.split("")
        boolean = true
        index = 0
        string_length = string.length - 1
        loop_1 = 0
        loop_2 = 0
        loop_3 = 0
        loop_4 = 0
        if_1 = 0
        if_2 = 0
        unless_1 = 0
        unless_2 = 0
        # While Loop 1 
        while(boolean)
            loop_1 += 1
            hash = {}
            # Array Loop 2
            string.each_with_index do |s,i|
                loop_2 += 1
                # If condition 1
                if hash[s].nil?
                    if_1 += 1
                    hash[s] = [[]]
                end
                # Unless Condition 1
                unless hash[s].last.last.nil? 
                    unless_1 += 1
                    # Unless Condition 2
                    unless hash[s].last.last + 1 == i
                        unless_2 += 1
                        len = hash[s].length
                        hash[s][len] = []
                    end
                end
                hash[s].last.push(i)
            end
            # puts "Hash: #{hash}"
            deletion = 0
            # Key Value Loop 3
            hash.each do |k,internal_array|
                loop_3 += 1
                # puts "K: #{k}"
                deletion = 0
                # Internal Array Loop 4
                internal_array.each do |ia|
                    loop_4 += 1
                    # Finding if consecutive characters are in even count then deleting them
                    # If condition 2
                    if(ia.count % 2 == 0)
                        if_2 += 1
                        string[ia.first..ia.last] = Array.new(ia.count, nil)
                        deletion += 1 
                    end
                end
            end
            # Compact Loop 5 
            # Loop count can be reduced by storing the elements index which are converted to null
            loop_4 = loop_4 + string.count # O(n) complexity
            string = string.compact
            # puts "Compact String: #{string}"
            break if deletion == 0
        end
    end
    # To Know the Time Complexity of the Program
    # puts "Loop1: #{loop_1} \nLoop2: #{loop_2} \nLoop3: #{loop_3} \nLoop4: #{loop_4} \nIf1: #{if_1} \nIf2: #{if_2} \nUnless1: #{unless_1} \nUnless2: #{unless_2}"
    return string.join() || nil
end

array = [
    'azxxzyyyddddyzzz',
    'xyzzyyyzx',
    'cbbbaaaabbbccc'
]

array.each do |arr|
    puts "Input: #{arr}\n\n"
    result = solution(arr)
    puts "\nResult: #{result}\n\n"
end