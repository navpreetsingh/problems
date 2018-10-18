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
        # puts "Distance: #{@distance}"
        # puts "Pointer: #{@pointer}"
        # distance_array = []
        distance_city_array = Array.new(@graph_keys_count-1, 0)
        # puts distance_city_array
        # puts @distance.values
        @distance.values.each do |val|
            # byebug if val == 9
            distance_city_array[val-1] += 1 if val > 0
            # distance_array.push(@distance[c.to_s.to_sym])
        end        
        # puts "Distance Array: #{distance_array}"
        return distance_city_array
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

def solution(t)
  # write your code in Ruby 2.2
  new_graph = {}
  capital = nil
  t.each_with_index do |val,index|
    capital = val.to_s.to_sym if val == index
    if new_graph[index.to_s.to_sym].nil?
        new_graph[index.to_s.to_sym] = {}
    end
    new_graph[index.to_s.to_sym][val.to_s.to_sym] = 1
    if new_graph[val.to_s.to_sym].nil?
        new_graph[val.to_s.to_sym] = {}
    end
    new_graph[val.to_s.to_sym][index.to_s.to_sym] = 1
  end  
#   puts "New Graph: #{new_graph}"
  
  target = ShortestPath.new(capital, new_graph)
  target.result
end


arrays = [
    [9,1,4,9,0,4,8,9,0,1],
    [9,1,4,9,0,4,8,9,0,1,1],
    Array.new(1000, 10)
]

arrays.each do |arr|
    puts "Array: #{arr}\n"
    result = solution(arr)
    puts "Result: #{result}\n\n"
end