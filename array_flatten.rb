/#
    How to Run the Program
    1. Add list of arrays in the list below to test code
    2. Execute the file from it's location
        $ ruby array_flatten.rb

    You will get your results as below
        array: [1, 2, 3, [4, 5, 6, 7, [8, 9]]] 
        flatten_array: [1, 2, 3, 4, 5, 6, 7, 8, 9] 
        
        array: [9, 0, [1, 2, [3, 4], [5, 6], [7, [8]]]] 
        flatten_array: [9, 0, 1, 2, 3, 4, 5, 6, 7, 8] 
        
        array: [1, [2, [3, [4, [5, [6, [7, [8, [9, [0, [1, [2, [3, [4, [5, [6]]]]]]]]]]]]]]]] 
        flatten_array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6] 
#/

list = [
    [1,2,3,[4,5,6,7,[8,9]]],
    [9,0,[1,2,[3,4],[5,6],[7,[8]]]],
    [1,[2,[3,[4,[5,[6,[7,[8,[9,[0,[1,[2,[3,[4,[5,[6]]]]]]]]]]]]]]]]
]

def method_array_flatten (arr)
    # puts "arr: #{arr} \n"
    arr_flatten = []
    arr.each do |a|
        if a.is_a?(Array)
            arr_flatten += method_array_flatten(a)
        else
            arr_flatten.push(a)
        end
    end
    # puts "arr_flatten: #{arr_flatten} \n"
    return arr_flatten
end



list.each do |l|
    puts "array: #{l} \n"
    puts "flatten_array: #{method_array_flatten(l)} \n \n"
end