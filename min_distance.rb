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
        @pointer = {"#{start}": start.to_s}
        @graph_keys_count = graph.keys.count
        @keys_evaluated = []
        @key = start
    end

    def result
        key = [@key]
        loop = true
        while(loop)
            new_keys = []
            # puts "Key: #{key}"
            key.each do |k|
                result = calculate_distance(k)
                # @graph_keys.delete(k)
                @keys_evaluated.push(k) unless @keys_evaluated.include? k
                new_keys.push(result)
            end
            # byebug
            # puts "Keys Evaluated: #{@keys_evaluated}"
            # puts "Keys Evaluated Count: #{@keys_evaluated.count}"
            # puts "Graph Keys Count: #{@graph_keys_count}"
            if @graph_keys_count == @keys_evaluated.count
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
        key_hash.each do |key, val|
            val += min_distance
            if @distance[key].nil? || @distance[key] > val
                # puts "Point: #{point} & Key: #{key}"
                @distance[key] = val
                @pointer[key] = point
                keys_to_evaluate.push(key) unless @keys_evaluated.include? key
            end
        end 
        return keys_to_evaluate
    end
end



graphh = {
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

graphh.keys.each do |k|
    puts "Key: #{k} \n"
    target = ShortestPath.new(k, graphh)
    target.result
    puts "\n\n"
end

grap = {
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
new_graph = {}
grap_keys = grap.keys
grap.each do |key, val|
    new_graph[key] = {}
    val.each_with_index do |v, index|
        new_graph[key][grap_keys[index]] = v if v > 0
    end
end
puts "New Graph: #{new_graph}"

target = ShortestPath.new(:"1", new_graph)
target.result