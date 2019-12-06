=begin
    require 'byebug'
    def solution(arr)

        return output
    end

    array = [

    ]

    array.each do |arr|
        puts "Array: #{arr}\n"
        result = solution(arr)
        puts "Result: #{result}\n\n"
    end
=end

puts "Good"
class DailySchedule
  attr_accessor :working_hours, :busy_hours
  
  def initialize(working_hours = [], busy_hours = [])
    @working_hours = working_hours - busy_hours
    @busy_hours = busy_hours
  end
  
  # Check if the person is available at a certain time
  # @param hours [Array<Integer>]
  # @return [Boolean]
  def available?(*hours)
    # implementation
    boolean = true
    hours.each do |hr|
      boolean = false unless @working_hours.include?(hr)
    end
    return boolean 
  end
end


ds = DailySchedule.new((9..18).to_a, [12,13])
puts ds.available?(1,2)
puts ds.available?(10,11)
puts ds.available?(12,11)  
puts ds.available?(10,12)