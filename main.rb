require './handle_people'
require './handle_books'
require './handle_rentals'
require './storage'

class Main
  attr_accessor :persons, :books

  def initialize
    @storage = Storage.new
    @new_people = HandlePeople.new
    @new_books = HandleBooks.new
    @new_rentals = HandleRentals.new(@new_people, @new_books)
  end

  def app
    puts "Welcome to our App \n\n"
    @storage.parse_books(@new_books)
    @storage.parse_people(@new_people)
    start
    @storage.save_books(@new_books)
    @storage.save_people(@new_people)
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
      @new_books.list_of_books
    when 2
      @new_people.list_all_people
    when 3
      @new_people.create_person
    when 4
      @new_books.create_book
    when 5
      @new_rentals.create_rental
    when 6
      @new_rentals.list_rentals_by_person_id
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
      # @storage.stringify_data(@persons, @books, @rentals)
    end
  end
end

main = Main.new
main.app
