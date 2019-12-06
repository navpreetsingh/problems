=begin
    Result: {
        a: {
                b: [[a],[c],[a,h],[4,-1,19]],
                c: []        
            }
    }
=end
require 'byebug'

class ShortestPath

    def initialize(start, graph)
        @graph = graph
        @distance = {"#{start}": 0}
        @pointer = {}
        @graph_keys_count = graph.keys.count
        @keys_evaluated = []
        @key = start
        @distance_counter
        @distance_points
    end

    def result
        key = [@key]
        loop = true
        while(loop)
            new_keys = []
            # puts "Key: #{key}"
            key.each do |k|
                result = calculate_distance(k)
                @keys_evaluated.push(k) unless @keys_evaluated.include? k
                new_keys.push(result)
            end
            # puts "Graph Count: #{@graph_keys_count}"
            # puts "Keys Evaluated Count: #{@keys_evaluated.count}"
            # puts "Key: #{key}"
            if (@graph_keys_count == @keys_evaluated.count) || key.empty?
                loop = false
            end
            key = new_keys.flatten.uniq
        end    
        puts "Distance: #{@distance}"
        puts "Pointer: #{@pointer}"
        return 1
    end
    
    def calculate_distance(point)
        # puts "Point: #{point}"
        key_hash = @graph[point]
        min_distance = @distance[point]
        keys_to_evaluate = []
        unless key_hash.nil?
            key_hash.each do |key, val|
                val += min_distance
                if @distance[key].nil? || @distance[key] > val
                    # puts "Point: #{point} & Key: #{key}"
                    @distance[key] = val
                    @pointer[key] = point
                    keys_to_evaluate.push(key) unless @keys_evaluated.include? key
                end
            end 
        end
        return keys_to_evaluate
    end

    def find_direction(start, end_point)
        if (start == end_point)
            puts "\nPath: You are standing at same location"
        else
            distance = @distance[end_point.to_sym]
            if distance.nil?
                puts "\nPath: There is no path to this destination from source"
            else
                result = ["You have reached your destination: #{end_point}"]
                current_key = @pointer[end_point.to_sym]
                result.push("From #{current_key} take a path to #{end_point}")
                (1..distance).to_a.each do |d|
                    result.push("Go to Point: #{current_key}") unless current_key.nil? || current_key == start
                    current_key = @pointer[current_key]
                end            
                result.push("Start from point: #{start.to_s}")
                result = result.reverse.join("\n")
                puts "\nPath: \n#{result}"
            end
        end
        return 1
    end

    def points_counter_at_specific_distance
        @distance_counter = Array.new(@distance.values.max+1, 0)
        @distance_points = Array.new(@distance.values.max+1)
        @distance.each do |k,v|
            @distance_counter[v] += 1
            @distance_points[v] = [] if @distance_points[v].nil? 
            @distance_points[v].push(k)
        end
        # distance_counter.shift
        puts "\nCounter for point #{@key}: \n#{@distance_counter}"
        puts "\nDistance Points #{@key}: \n#{@distance_points}"
        return 1
    end

    def total_points_connected(range1=nil, range2=nil)
        @distance_counter.shift
        if (range1.nil? && range2.nil?) || (range1 = 0 && range2 = 0)
            puts "\nYou can reach #{@distance_counter.sum} points from #{@key}"
        else
            points = @distance_counter[range1-1,range2-1].sum
            puts "\nYou can reach #{@points.sum} points from #{@key} in range #{@range1} - #{@range2}"
        end
    end
end

def solution(graph, direction_array = nil, distance_index=nil, range_array=[nil,nil])
    keys = (distance_index.nil? || distance_index.empty?) ? graph.keys : distance_index.map(&:to_sym)
    keys.each do |k|
        puts "Key: #{k} \n"
        target = ShortestPath.new(k, graph)
        target.result
        unless direction_array.nil?
            target.find_direction(direction_array[0].to_sym, direction_array[1].to_sym)
        end
        target.points_counter_at_specific_distance
        target.total_points_connected(range_array[0], range_array[1])
    end
end


# GRAPH 1
graph_1 = {
    a: {b: 4, h: 8},
    b: {a: 4, c: 8, h: 11},
    c: {b: 8, d: 7, f: 4, i: 2},
    d: {c: 7, e: 9, f: 14},
    e: {d: 9, f: 10},
    f: {c: 4, d: 14, e: 10, g: 2},
    g: {f: 2, h: 1, i: 6},
    h: {a: 8, b: 11, g: 1, i: 7},
    i: {c: 2, g: 6, h: 7} 
}
solution(graph_1, nil, nil)
# solution(graph_1,['a','d'],['a'])


# GRAPH 2
graph_2 = {
    "1": [0, 4, 0, 0, 0, 0, 0, 8, 0],
    "2": [4, 0, 8, 0, 0, 0, 0, 11, 0],
    "3": [0, 8, 0, 7, 0, 4, 0, 0, 2],
    "4": [0, 0, 7, 0, 9, 14, 0, 0, 0],
    "5": [0, 0, 0, 9, 0, 10, 0, 0, 0],
    "6": [0, 0, 4, 14, 10, 0, 2, 0, 0],
    "7": [0, 0, 0, 0, 0, 2, 0, 1, 6],
    "8": [8, 11, 0, 0, 0, 0, 1, 0, 7],
    "9": [0, 0, 2, 0, 0, 0, 6, 7, 0]
}

# Cleaning Data
new_graph_2 = {}
graph_keys = graph_2.keys
graph_2.each do |key, val|
    if new_graph_2[key.to_sym].nil?
        new_graph_2[key.to_sym] = {}
    end
    val.each_with_index do |v, index|
        second_axis = (index+1).to_s.to_sym
        new_graph_2[key.to_sym][second_axis] = v if v > 0
    end
end
puts "New Graph_2: #{new_graph_2}"
solution(new_graph_2,nil,nil)

# GRAPH 3
graph_3 = [9,1,4,9,0,4,8,9,0,1]
# Cleaning Data
new_graph_3 = {}
graph_3.each_with_index do |val,index|
    capital = val.to_s.to_sym if val == index
    if new_graph_3[index.to_s.to_sym].nil?
        new_graph_3[index.to_s.to_sym] = {}
    end
    new_graph_3[index.to_s.to_sym][val.to_s.to_sym] = 1
    if new_graph_3[val.to_s.to_sym].nil?
        new_graph_3[val.to_s.to_sym] = {}
    end
    new_graph_3[val.to_s.to_sym][index.to_s.to_sym] = 1
end  
puts "New Graph_3: #{new_graph_3}"
solution(new_graph_3,nil,nil)

# GRAPH 4
graph_4 = [["Anne:Barbara","Barbara:Ivan", "Vinny:Vlad"], ["Anne", "Vinny"]]
new_graph_4 = {}
graph_4[0].each do |str| 
    str = str.split(":")
    if new_graph_4[str[0].to_sym].nil?
        new_graph_4[str[0].to_sym] = {}
    end
    if new_graph_4[str[1].to_sym].nil?
        new_graph_4[str[1].to_sym] = {}
    end
    new_graph_4[str[0].to_sym][str[1].to_sym] = 1
    new_graph_4[str[1].to_sym][str[0].to_sym] = 1
end

puts "\n\nNew Graph 4: #{new_graph_4} \n\n"
solution(new_graph_4,nil,nil)