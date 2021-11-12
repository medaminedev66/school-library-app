require './person'
require './classroom'
require './student'
require './book'
require './rental'
require './teacher'

@people = []
@books = []
@rentals = []

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
    list_all_people
    continue
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals_by_id
  else
    continue
  end
end

def create_person
  puts 'Do you want to create a student (1) or teacher (2)'
  choice = gets.chomp
  case choice.to_i
  when 1
    info = person_information
    classroom = Classroom.new('Other')
    @people << Student.new(classroom: classroom, age: info[0], name: info[1], parent_permission: info[2])
    puts "Student is created successfully \n"
  when 2
    info = person_information
    puts 'Specialization:'
    specialization = gets.chomp
    @people << Teacher.new(specialization: specialization, age: info[0], name: info[1], parent_permission: info[2])
    puts "Teacher is created successfully \n"
  else
    puts 'please choose between 1 (Student) or 2: (Teacher)'
    choice = gets.chomp
    create_person(choice.to_i)
  end
  continue
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
  @books << Book.new(title, author)
  puts 'Book is created succussfully'
  continue
end

def create_rental
  puts "Select book from this books using the number: \n"
  list_of_books
  book_number = gets.chomp
  @books.each_with_index { |book, index| @selected_book = book if (index + 1) == book_number.to_i }
  puts "Select a person fome the following list of members buy id:\n"
  list_all_people
  person_id = gets.chomp
  @people.each { |person| @selected_person = person if person.id == person_id.to_i }
  puts 'Date:'
  date = gets.chomp
  if @selected_person && @selected_book
    @rentals << Rental.new(date, @selected_person, @selected_book)
    puts 'Rental created seccussfully'
  else
    puts 'Something went wrong. Please try again.'
    create_rental
  end
  continue
end

def list_all_people
  if @people.size.zero?
    puts 'No people exist'
  else
    puts 'List of all members'
    @people.each do |person|
      type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "[#{type}] Name: #{person.name} | Id: #{person.id} | Age: #{person.age} \n"
    end
  end
end

def list_of_books
  if @books.size.zero?
    puts 'No books'
  else
    puts "List of all books: \n"
    @books.each_with_index { |book, index| puts "#{index + 1}- Title: #{book.title}, Author: #{book.author}" }
  end
end

def list_rentals_by_id
  puts 'Id:'
  id = gets.chomp
  @people.each { |person| @selected_person = person if person.id == id }
  if @selected_person
    puts "List of all rentals for #{@selected_person.name}, id: #{@selected_person.id}:"
    @selected_person.rentals.each do |rental|
      puts "- Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}\n"
    end
  else
    puts "The member with id: #{id} doesn't exist"
  end
  continue
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
