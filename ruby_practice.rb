require 'byebug'
# Use of . and :: operators
MR_COUNT = 0         # constant defined on main Object class
module Foo
   MR_COUNT = 0
   ::MR_COUNT = 1    # set global count to 1
   MR_COUNT = 2      # set local count to 2
end
puts MR_COUNT        # this is the global constant
puts Foo::MR_COUNT   # this is the local "Foo" constant


CONST = ' out there'
class Inside_one
   CONST = proc {' in there'}
   def where_is_my_CONST
      ::CONST + ' inside one'
   end
end
class Inside_two
   CONST = ' inside two'
   def where_is_my_CONST
      CONST
   end
end
puts Inside_one.new.where_is_my_CONST
puts Inside_two.new.where_is_my_CONST
puts Object::CONST + Inside_two::CONST
puts Inside_two::CONST + CONST
puts Inside_one::CONST
puts Inside_one::CONST.call + Inside_two::CONST


# YIELD Statement
def test
    puts "You are in the method"
    yield 5,10
    puts "you are again back to the method"
    yield 10
end

test {|i,j| puts "You are in the block #{i + (j || 0)}" }

def test(&block)
    if block.call.class == Array
        puts "Hi I am here"
        puts block.call.sum
    else
        block.call
    end
 end
 test { puts "Hello World!"}

 test { [1,2,3,4] }
 

 $LOAD_PATH << '.' 
require 'ruby_modules'
 class Sample
 include A
 include B
    def s1
    end
 end
 
 samp = Sample.new
 A.a1
 A.a2
 samp.a1
 samp.a2
 samp.s1


puts %{Ruby is fun.}  # equivalent to "Ruby is fun."
puts %Q{Ruby is fun. } # equivalent to " Ruby is fun. "
puts %q[Ruby is fun.]   # equivalent to a single-quoted string
puts %x!ls! # equivalent to back tick command output `ls`
puts "Bell or alert \v"



puts "Enter a value :"
val = gets
puts "Entered value is #{val}"


def promptAndGet(prompt)
    puts "I am in prompt and get"
    print prompt
    res = readline.chomp
    puts "Readline chomp: #{res}"
    throw :quitRequested if res == "!"
    return res
 end
 
 catch :quitRequested do
    puts "I am in a catch"
    name = promptAndGet("Name: ")
    age = promptAndGet("Age: ")
    sex = promptAndGet("Sex: ")
    # ..
    # process information
 end
 promptAndGet("Name:")


require 'fiddle'
str = 'water'.freeze
str.frozen? # true
memory_address = str.object_id * 2
Fiddle::Pointer.new(memory_address)[1] &= ~8
str.frozen? # false

def foo
   bar
 end
 def bar
   puts __method__
 end
 foo