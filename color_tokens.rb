require 'byebug'
class ArrayMethods
    def initialize(arr)
      @array = arr
      @length = @array.length
      @min = 0
      @min_index = [0]
    end

    def push(element)
        @array[@length] = element
        if(@length == 0)
            @min = element
        end
        @length = @length + 1
        
        # byebug
        if @min > element
            @min = element
            @min_index.push(@length)
        end
        puts ("Min Index: #{@min_index}" )
        @array
    end

    def pop
        @length = @length - 1
        @array.delete_at(@length)
        if(@length == @min_index.last)
            @min_index.delete(@min_index.last)
            @min = @array[@min_index.last]
        end
        puts ("Min Index in POP: #{@min_index}" )
        @array
    end

    def top
        @array[@length - 1]
    end

    def getMin
        # min = @array[0]
        # @array[1..@length].each do |a|
        #     if min > a
        #         min = a
        #     end
        # end
        @min
    end
end

array = [
    [[1,4,7,6],[2]],
    [[],[4,7,1,2,8]],
]

array.each do |arrr|
    puts "Input #{arrr}"
    am = ArrayMethods.new(arrr[0])
    puts "Output"
    arrr[1].each do |ele|
        puts "After Push #{ele}: #{am.push(ele)}"
    end
    
    (1..3).to_a.each{|a| puts "After Pop removes last element: #{am.pop}" }
    
    puts "Top: #{am.top}"
    
    puts "getMin: #{am.getMin}\n\n"
end
