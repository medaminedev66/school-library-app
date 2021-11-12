require './person'
require './classroom'
require './student'
require './book'
require './rental'

$people = []
$books = []
$rentals = []

def main
  puts "Welcome to our App \n\n"
  start
end

def start
  puts "Please choose an option by enterin a number:
      1- List all books.
      2- List all people.
      3- Create a person (teacher or student, not a plain Person).
      4- Create a book.
      5- Create a rental.
      6- List all rentals for a given person id.
      7- Exit"
  choose = gets.chomp
  cases choose
end

def cases(choose)
  case choose.to_i
  when 1
    list_of_books
    continue
  when 2
    list_all_peaple
    continue
  when 3
    puts 'Do you want to create a student (1) or teacher (2)'
    choice = gets.chomp
    create_person(choice.to_i)
    continue
  when 4
    create_book
    continue
  when 5
    create_rental
    continue
  when 6
    list_rentals_by_id
    continue
  else
    puts 'The number should be between 1 and 7'
    start
  end
end

def create_person(choice)
  case choice
  when 1
    info = person_information
    puts 'Classrrom'
    get_classroom = gets.chomp
    classroom = Classroom.new(get_classroom)
    $people << Student.new(classroom: classroom, age: info[0], name: info[1], parent_permission: info[2])
    puts "Student created successfully \n"
  when 2
    puts 'Working on teacher'
  else
    puts 'please choose between 1 or 2'
    choice = gets.chomp
    create_person(choice.to_i)
  end
end

def person_information
  puts 'Your name'
  name = gets.chomp
  puts 'Your age'
  age = gets.chomp
  puts 'permissin Y/N'
  permission = gets.chomp
  permission = permission == 'y'
  [age, name, permission]
end

def create_book
  puts 'Title: '
  title = gets.chomp
  puts 'Author: '
  author = gets.chomp
  $books << Book.new(title, author)
  puts 'Book is created succussfully'
end

def create_rental
  puts "Select book from this books using the number: \n"
  list_of_books
  book_number = gets.chomp
  $books.each_with_index do |book, index|
    @selected_book = book if (index + 1) == book_number.to_i
  end
  # puts "title: #{@selected_book.title}, Author: #{@selected_book.author}"
  puts "Select a person fome the following list of members buy id:\n"
  list_all_peaple
  person_id = gets.chomp
  $people.each do |person|
    @selected_person = person if person.id == person_id.to_i
  end
  puts 'Date:'
  date = gets.chomp
  if @selected_person && @selected_book
    $rentals << Rental.new(date, @selected_person, @selected_book)
    puts 'Rental created seccussfully'
  else
    puts 'something null'
  end
end

def list_all_peaple
  if $people.size.zero?
    puts 'No people exist'
  else
    puts 'List of all members'
    $people.each { |person| puts "Name: #{person.name} | Id: #{person.id} | Age: #{person.age} \n" }
  end
end

def list_of_books
  if $books.size.zero?
    puts 'No books'
  else
    puts "List of all books: \n"
    $books.each_with_index { |book, index| puts "#{index + 1}- Title: #{book.title}, Author: #{book.author}" }
  end
end

def list_rentals_by_id
  puts 'Give us an id'
  id = gets.chomp
  puts 'List of all rentals for the member '
  $people.each { |person| @selected_person = person if person.id == id }
  if @selected_person
    puts "List of all rentals for #{@selected_person}, id: #{@selected_person.id}"
    @selected_person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}\n"
    end
  else
    puts "The member with id: #{id} doesn't exist"
  end
end

def continue
  puts "\nDo you want to continue:\n
  1: Continue
  0: Exit\n"
  continue = gets.chomp
  if continue == '1'
    start
  else
    puts 'Thank you for using our app'
  end
end

main
