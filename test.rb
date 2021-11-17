require 'json'
require_relative 'person'
# file = File.open("test.json")
# file_data = File.read("test.txt").split(',')

# puts file_data[0]

# arr = [1, 2, 3]
# json = JSON.generate(arr)
#

person = Person.new(age: 10, name: 'amine')
# person = {
#     "name":
#     "age":
#     "permission":
#     "specialization":
#     "rentals":

# }
json0 = JSON.generate(person)
puts json0
obj1 = JSON.parse(json0)
puts obj1

# unless File.zero?("rentals.json")

#   json = File.read("rentals.json")

#   ruby = JSON.parse(json)

#   ruby["people"]<< person.to_json #[1]

#   puts ruby["people"][2].as_json #[1, 2]

# # File.write("rentals.json", JSON.generate(ruby))

# end

# ruby["666"].fetch("rentals")<< obj

# File.write("test.json", JSON.generate(ruby))
# File.open("test.json", "w") { |f| f.write json }
# newruby = {...ruby["666"]}
# puts newruby
