
require 'byebug'
# def solution(a,k)
#     # write your code in Ruby 2.2
#     # a = a.compact.sort
#     v = a[0]
#     output = []
#     loop_1 = 0
#     loop_2 = 0
#     loop_3 = 0
#     new_array = a[1, a.length-1]
#     # a.each_with_index do |v,i|
#     puts "Old Array: #{a}"
#     puts "New Array: #{new_array}"
#     unless new_array.nil?
#         dummy_output = {}
#         dummy_output[v.to_s] = [[v]]
#         new_array.each_with_index do |na,inn|
#             puts "na: #{na}"
#             loop_1+=1
#             if na <= k
#                 if(dummy_output[na.to_s].nil?)
#                     dummy_output[na.to_s] = [[na]]
#                 else
#                     dummy_output[na.to_s].push([na])
#                 end
#             end
#             summ = v+na
#             puts "Summ: #{summ}"
#             # if summ <= k
#                 if summ == k
#                     output.push([v,na])     
#                 else
#                     dummy_output.keys.each do |kk|
#                         loop_2+=1
#                         new_sum = v+(kk.to_i)
#                         puts "New Sum: #{new_sum}"
#                         if new_sum == k
#                             dummy_output[kk].each do |ar|
#                                 loop_3+=1
#                                 output.push(ar.dup.push(v))  
#                             end
#                         elsif new_sum < k
#                             if(dummy_output[new_sum.to_s].nil?)
#                                 dummy_output[new_sum.to_s] = []
#                             end
#                             dummy_output[kk].each do |ar|
#                                 loop_3+=1
#                                 dummy_output[new_sum.to_s].push(ar.dup.push(v))  
#                             end
#                         end
#                     end
#                     if(dummy_output[summ.to_s].nil?)
#                         dummy_output[summ.to_s] = [[v,na]]
#                         # dummy_output[summ.to_s].push([v,na])
#                     end
#                     puts "Dummy Output: #{dummy_output}"
#                 end
#             # end
#         end
#         puts "Output: #{output}"
#     end
#     puts "Loop1: #{loop_1} \n Loop2: #{loop_2} \n Loop3: #{loop_3}"
#     # end
#     return output
# end

def solution1(a,k)
    total_time = Time.now
    output = {}
    output_keys = []
    loop_1 = 0
    loop_2 = 0
    loop_3 = 0
    # Loop 1
    a.each_with_index do |v,i|
        time_loop_1 = Time.now
        time_loop_2 = Time.now
        time_loop_3 = Time.now
        loop_1+=1
        # puts "\n\n"
        # puts "value: #{v}"
        dummy_output = output_keys.dup
        if (v <= k)
            if(output[v.to_s].nil?)
                output[v.to_s] = []
                output_keys.push(v)
            end
            output[v.to_s].push([v])
            # puts "Dummy Output: #{dummy_output}"
            # Loop 2
            time_loop_2 = Time.now
            dummy_output.each do |ok|
                loop_2 += 1
                summ = v+ok
                # puts "Sum: #{summ}"
                if v!=ok && summ <= k        
                    if(output[(summ).to_s].nil?)
                        output_keys.push(summ) 
                        output[(summ).to_s] = []
                    end
                    # Loop 3
                    time_loop_3 = Time.now
                    output[ok.to_s].each do |val|  
                        loop_3 += 1
                        unless val.include? v
                            new_array = val.dup.push(v).sort
                            # puts "New Array: #{new_array}"
                            # puts "Sum_1: #{summ}"
                            output[summ.to_s].push(new_array)
                        end
                    end
                    
                end
            end
            # puts "Output Keys: #{output_keys}"
            # puts "Output: #{output}"
        end
        # puts ("Time Loop1: #{Time.now - time_loop_1}, Loop2: #{Time.now - time_loop_2}, Loop3: #{Time.now - time_loop_3}")
    end
    puts "Loop1: #{loop_1} \nLoop2: #{loop_2} \nLoop3: #{loop_3}"
    puts "Total_Time: #{Time.now - total_time}"
    return output[k.to_s].nil? ? nil : output[k.to_s].uniq
end


arrays = [
    [[5,2,8,1,7,9],8],
    [[5,2,8,1,7,9],4],
    [[5,2,8,1,7,9],6],
    [[5,2,8,1,7,9],3],
    [[5,2,8,1,7,9],7],
    [[5,2,8,1,7,9],10],
    [[5,2,8,1,7,9],11],
    [[5,2,8,1,7,9],12],
    [[5,2,8,1,7,9],13],
    [[5,2,8,1,7,9],14],
    [[5,2,8,1,7,9],15],
    [[5,2,8,1,7,9],16],
    [[5,2,8,1,7,9],17],
    [[5,2,8,1,7,9],18],
    [[5,2,8,1,7,9],19],
    [[5,2,8,1,7,9],20],
    [[5,2,8,1,7,9],21],
    [[7, 15, 3, 10, 14, 3, 2, 15, 7, 16, 1, 1],17]
]

arrays.each do |arr|
    puts "Array: #{arr}\n"
    # result = solution(arr[0],arr[1])
    # puts "Result: #{result}\n\n"
    result1 = solution1(arr[0],arr[1])
    puts "Result: #{result1}\n\n"
end