require './rental'

class HandleRentals
  def initialize(people, books)
    @rentals = []
    @handle_people = people
    @handle_books = books
  end

  def create_rental
    puts "Select book from this books using the number: \n"
    @handle_books.list_of_books
    book_number = gets.chomp
    @handle_books.books.each_with_index { |book, index| @selected_book = book if (index + 1) == book_number.to_i }
    puts "Select a person fome the following list of members buy id:\n"
    @handle_people.list_all_people
    person_id = gets.chomp
    @handle_people.people.each { |person| @selected_person = person if person.id == person_id.to_i }
    puts 'Date:'
    date = gets.chomp
    if @selected_person && @selected_book
      @rentals << Rental.new(date, @selected_person, @selected_book)
      puts 'Rental created seccussfully'
    else
      puts 'Something went wrong. Please try again.'
      create_rental
    end
  end

  def list_rentals_by_id
    puts 'Id:'
    id = gets.chomp
    @handle_people.people.each { |person| @selected_person = person if person.id == id }
    if @selected_person
      puts "List of all rentals for #{@selected_person.name}, id: #{@selected_person.id}:"
      @selected_person.rentals.each do |rental|
        puts "- Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}\n"
      end
    else
      puts "The member with id: #{id} doesn't exist"
    end
  end
end
