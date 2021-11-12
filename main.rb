require './person'
require './classroom'
require './student'
require './book'

$people = []
$books = []

def main
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

def cases choose
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
    main
  else
    puts 'The number should be between 1 and 7'
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

def create_book
  puts 'Title: '
  title= gets.chomp
  puts 'Author: '
  author=gets.chomp
  $books << Book.new(title, author)
  puts "Book is created succussfully"
end

def list_all_peaple
  if $people.size.zero?
    puts 'No people exist'
  else
    puts "List of all members"
    $people.each { |person| puts "Name: #{person.name} | Age: #{person.age} \n" }
  end
end

def list_of_books
  if $books.size.zero?
    puts 'No books'
  else
    puts "List of all books \n"
    $books.each {|book| puts "Title: #{book.title}, Author: #{book.author}"}
  end
end

def continue
  puts "\nDo you want to continue:\n
  1: Continue
  0: Exit\n"
  continue = gets.chomp
  if continue == '1'
    main 
  else
    puts "Thank you for using our app"
end

main
