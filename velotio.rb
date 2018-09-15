
require 'byebug'
data = [
  {  'id': 1,
      'name': 'Abhishek',
      'marks': {
        'Maths': 67,
        'Physics': 67,
        'Computer': 67
        }
  },
  {  'id': 2,
      'name': 'Navpreet',
      'marks': {
        'Maths': 67,
        'Physics': 78,
        'Computer': 83
        }
  },
]

output = {}
data.each do |d|
  sum = 0
#   byebug
  sum = d[:marks].values.sum unless d[:marks].nil?
  output[d[:name]] = sum/3.to_f  
end
puts output