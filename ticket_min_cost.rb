
def matrix(travel_days_array)
    days = (1..30).to_a
    travel_days_boolean = []
    travel_days_modified_array = []
    groups = [[]]
    predecessor_count = 0
    group_index = 0
    days.each do |day|
        if travel_days_array.include?(day) 
            travel_days_boolean.push(1)
            travel_days_modified_array.push([day, predecessor_count])
            if predecessor_count > 3 && groups[group_index].count > 0
                group_index += 1
                groups[group_index] = []                
            end
            groups[group_index].push(day)
            predecessor_count = 0
        else
            predecessor_count += 1
            travel_days_boolean.push(0)
            # travel_days_modified_array.push([0,0])
        end
    end
    return travel_days_boolean, travel_days_modified_array, groups
end

def min_cost(travel_days_boolean, travel_days_array)
    max_cost = 25
    duplicate_array = travel_days_array
    cost = 0
    arr_index = 0
    arr_length = travel_days_array.count
    loop = true
    while(loop)
        day = travel_days_array[arr_index] - 1
        week_sum = travel_days_boolean[day..day+6].sum
        if(week_sum > 3)
            cost += 7
            arr_index += week_sum
        else
            arr_index += 1
            cost += 2
        end
        break if arr_index+1 > arr_length
    end   
    if cost > max_cost
        return max_cost
    else
        cost
    end 
end



arrays = [
    # WEEK (4 -> 7)
    "WEEK",
    [1,2,3],
    [1,2,6,7],
    # FORTNIGHT(8 -> 17)
    "FORTNIGHT",
    [1,2,6,10,13,14],
    [1,2,6,7,11,13,14],
    [1,2,6,7,10,11,12],
    [1,2,3,8,9,10],
    # 21 DAYS (12 -> 21)
    "21 DAYS",
    [1,2,3,11,12,13,14,18,19,20,21],
    [1,6,7,8,9,12,14,16,18,20,21],
    # > 21 DAYS & COUNT < 23 ()
    "Greater than 21 days & travel days less than 23",
    [1,2,7,8,9,10,11,12,13,14,15,28,29],
    [1,2,5,6,7,11,12,13,14,15,25,28,29,30],
    [1,2,7,8,9,10,13,14,15,16,19,28,29],
    [1,2,7,8,9,10,13,14,15,16,19,24,25,28,29,30],
    [1,2,7,8,9,13,16,17,20,24,25,28,29,30],
    [7,8,9,13,16,17,20,24,25,28,29,30],
    [7,8,9,13,16,17,20,21,24,25,28,29,30]
]

arrays.each do |arr|
    if arr.is_a?(Array)
        arr = arr.sort
        puts "travel_days_array: #{arr}\nArray Count: #{arr.count}\n"
        result = matrix(arr)
        puts "travel days boolean: #{result[0]}\ntravel_days_modified_array: #{result[1]}\nGroups: #{result[2]}\n"
        puts "COST: #{min_cost(result[0], arr)}\n\n"
    else
        puts "\n\n#{arr}:\n"
    end
end