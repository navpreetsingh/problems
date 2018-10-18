def solution(a, b, c)
    # write your code in Ruby 2.2
    big_result = 1000000000
    n = a.count
    a = a.sort
    b = b.sort
    c = c.sort
    trips = 0
    (0..n-1).each do |index|
        b.each do |bb| 
            arr = [a[index]]
            if bb > a[index]
                arr.push(bb)
                c.each do |cc| 
                    # puts "Array: #{arr} \n"
                    arr.pop if arr.count > 2
                    if cc > b[index]
                        trips+=1 
                        arr.push(cc)
                        puts "Trip: #{arr} \n"
                    end
                end
            end
        end        
    end
    return trips > big_result ? -1 : trips
end

arrays = [
    [
        [29,50],
        [61,37],
        [37,70] 
    ],
    [
        [29,29],
        [61,61],
        [70,70] 
    ],
    [
        [5],
        [5],
        [5] 
    ],
    [
        [1,2,3,4,5],
        [2,3,4,5,6],
        [3,4,5,6,7]
    ]
]   

arrays.each do |arr|
    puts "Array: #{arr}\n"
    result = solution(arr[0],arr[1],arr[2])
    puts "Result: #{result}\n\n"
end

