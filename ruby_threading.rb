def function_1
    (1..100).each do |number|
        puts "Function 1 #{number}"
    end
end

def function_2
    puts "I am here"
    (101..200).each do |number|
        puts "Function 2 #{number}"
    end
end

puts "Threading starts"
thread_1 = Thread.new {
    function_1()
}
thread_2 = Thread.new {
    function_2()
}
thread_1.priority = 4
thread_1.join
thread_1.priority = 0
thread_2.join