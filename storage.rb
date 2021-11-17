require 'json'

require './book'
require './student'
require './teacher'
require './person'
require './rental'

class Storage
  def stringify_data(person, book, rental)
    File.open('books.json', 'w') { |f| f.write JSON.generate(book) }
    File.open('persons.json', 'w') { |f| f.write JSON.generate(person) }
    File.open('rentals.json', 'w') { |f| f.write JSON.generate(rental) }
  end

  # def parse(new_books)
  #   {
  #     books: parse_books(new_books),
  #     persons: parse_persons,
  #     rentals: parse_rental(parse_persons, parse_persons)
  #   }
  # end

  def parse_books(new_books)
    file_name = 'books.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |book|
      new_books.books << Book.new(title: book['title'], author: book['author'])
    end
  end

  def save_books(new_books)
    # data = File.read("books.json")
    # rubyData = JSON.parse(data)
    @json_array = []
    new_books.books.each do |book|
      @json_array.push({ 'json_class' => 'Book', 'title' => book.title, 'author' => book.author })
    end
    File.write('books.json', JSON.generate(@json_array))
  end

  def parse_persons
    file_name = 'persons.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |person|
      if person['json_class'].eql?('Teacher')
        parse_teacher(person)
      else
        parse_student(person)
      end
    end
  end

  def parse_teacher(person)
    teacher = Teacher.new(specialization: person['specialization'], age: person['age'].to_i, name: person['name'])
    teacher.id = person['id']
    teacher
  end

  def parse_student(person)
    student = Student.new(classroom: person['classroom'], age: person['age'].to_i, name: person['name'],
                          parent_permission: person['parent_permission'])
    student.id = person['id']
    student
  end

  def parse_rental(persons, books)
    file_name = 'rentals.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |rental|
      person = persons.detect { |p| p.id.eql?(rental['person']['id']) }
      book = books.detect { |b| b.title.eql?(rental['book']['title']) }
      Rental.new(rental['date'], person, book)
    end
  end
end
