require './handle_people'
require './handle_books'
require './handle_rentals'
require './storage'
require './book'
require './student'
require './teacher'
require './person'
require './rental'
require './classroom'
require './corrector'

book = Book.new(title: "Got", author: "Amine")
person = Person.new(age: 20, name: 'Amine Mohamed', parent_permission: true)
rental = Rental.new("2020-10-20", person, book)
rental1 = book.add_rentals(person, "2020-10-10")
# puts rental1.person.name
# p person
# puts book.add_rentals(person, "2020-10-20")
# puts rental

a = person.validate_name
puts a