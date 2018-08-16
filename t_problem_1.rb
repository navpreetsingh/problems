=begin
There is a popular saying that goes: "The friends of my friends are my friends". 

A friendship is represented in the form "PersonA:PersonB", which means that PersonA and PersonB are friends. Given two such relations, for example, "PersonA:PersonB" and "PersonB:PersonC", and taking the saying into account means that PersonA is friends with PersonB and PersonC, PersonB is friends with PersonA and PersonC and PersonC is friends with PersonA and PersonB.

Now, write a function that, given an array of such relations as the first parameter, calculates the total number of friends for the array of people given as the second parameter.

Examples:
numberOfFriends(["Anne:Barbara","Barbara:Ivan", "Vinny:Vlad"], ["Anne", "Vinny"]) // Anne:2, Vinny: 1
numberOfFriends(["Octavia:Zoltan", "Zoltan:Marko", "Marko:Diego", "Diego:Andres"], ["Octavia", "Diego"]) // Octavia: 4, Diego: 4
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

    def shortest_path_direction(start, end_point)
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
                    result.push("Go to Point: #{current_key}")
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
        puts "\nDistance index from #{@key}: \n#{@distance_points}"
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
        return 1
    end
end

def solution(graph, start=nil, end_point=nil, arr = nil, range_array=[nil,nil])
    keys = arr.map(&:to_sym) || graph.keys
    result = nil
    keys.each do |k|
        puts "Key: #{k} \n"
        target = ShortestPath.new(k, graph)
        target.result
        unless start.nil? && end_point.nil?
            target.shortest_path_direction(start.to_sym, end_point.to_sym)
        end
        target.points_counter_at_specific_distance
        target.total_points_connected(nil, nil)
        puts "\n"
    end  
    return result || 1      
end

arrays = [
    [["Anne:Barbara","Barbara:Ivan", "Vinny:Vlad"], ["Anne", "Vinny"]],
    [["Octavia:Zoltan", "Zoltan:Marko", "Marko:Diego", "Diego:Andres"], ["Octavia", "Diego"]],
    [["Alessandro:Anna", "Anna:Anne", "Anne:Barbara", "Barbara:David", "David:Francis", "Francis:Eduardo", "Eduardo:Anna", "Eduardo:Alessandro", "Luis:Marko", "Joao:Vlad", "Vlad:Luka", "Luka:Nikola", "Nikola:Roman", "Vlad:Roman", "Vlad:Vinny", "Vinny:Roman", "Vlad:Andres", "Vinny:Ivan"], ["Barbara", "Joao"]],
    [["Vanja:Sergio", "Sergio:Pedro", "Pedro:Martin", "Martin:Pablo", "Pablo:Sergio", "Jelena:Ivan", "Jelena:Alan", "Alan:Tomislav"],["Tomislav", "Martin"]],
    [["Alvaro:Alex", "Roman:Nikola", "Octavia:Barbara", "Joao:Marko", "Luis:Vanja", "Gabriel:Gustavo", "Alan:Pablo", "Ivan:Andres", "Artem:Anne", "Martin:Alessandro", "Sebastian:Vinny", "Eduardo:Francis", "Zoltan:Vlad"], ["Zoltan", "Ivan"]]
]

arrays.each do |graph_4|
    puts "Array: #{graph_4}\n"
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
    puts "\nNew Graph: #{new_graph_4}"
    result = solution(new_graph_4,nil,nil, graph_4[1], nil)
    puts "\nResult: #{result}\n\n"
end