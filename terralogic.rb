require 'byebug'

def solution(arr)
    arr = arr.split("")
    # puts "Array: #{arr}" 
    arr.each_with_index do |a,index|
        element = Integer(a) rescue nil
        unless element
            # byebug
            new_arr = arr.slice(index, 3)
            # puts "Before New Array: #{new_arr}" 
            if new_arr == new_arr.reverse
                # puts "New Array: #{new_arr}"    
                check_arr = new_arr.each{|na| Integer(na) rescue nil}
                # puts "Check Array: #{check_arr}"    
                if check_arr.compact.count == 3
                    # byebug
                    return new_arr
                    break
                end
            end
        end
    end
end


arrays = [
    '12aba34', 'qrfr32', '34ede5', 'ded32', '23aba32'
]

arrays.each do |arr|
    puts "Array: #{arr}\n"
    result = solution(arr)
    puts "Result: #{result}\n\n"
end