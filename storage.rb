require 'json'

require './book'
require './student'
require './teacher'
require './person'
require './rental'
require './classroom'

class Storage
  # def stringify_data(person, book, rental)
  #
  #   File.open('persons.json', 'w') { |f| f.write JSON.generate(person) }
  #   File.open('rentals.json', 'w') { |f| f.write JSON.generate(rental) }
  # end

  def parse_books(new_books)
    file_name = 'books.json'
    File.open('books.json', 'w') { |f| f.write JSON.generate([]) } unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |book|
      new_books.books << Book.new(title: book['title'], author: book['author'])
    end
  end

  def save_books(new_books)
    @json_books = []
    new_books.books.each do |book|
      @json_books.push({ 'json_class' => 'Book', 'title' => book.title, 'author' => book.author })
    end
    File.write('books.json', JSON.generate(@json_books))
  end

  def save_people(new_people)
    @json_people = []
    new_people.people.each do |person|
      if person.instance_of?(Teacher)
        @json_people.push({ 'json_class' => 'Teacher', specialization: person.specialization, age: person.age,
                            name: person.name, parent_permission: person.parent_permission })
      else
        @json_people.push({ 'json_class' => 'Student', classroom: person.classroom.label, age: person.age,
                            name: person.name, parent_permission: person.parent_permission })
      end
    end
    File.write('people.json', JSON.generate(@json_people))
  end

  def parse_people(new_people)
    File.open('people.json', 'w') { |f| f.write JSON.generate([]) } unless File.exist? 'people.json'

    JSON.parse(File.read('people.json')).map do |person|
      new_people.people << if person['json_class'].eql?('Teacher')
                             Teacher.new(specialization: person['specialization'], age: person['age'].to_i,
                                         name: person['name'])
                           else
                             classroom = Classroom.new(person['classroom'])
                             Student.new(classroom: classroom, age: person['age'], name: person['name'],
                                         parent_permission: person['parent_permission'])
                           end
    end
  end

  # def parse_teacher(person)
  #   teacher = Teacher.new(specialization: person['specialization'], age: person['age'].to_i, name: person['name'])
  #   teacher.id = person['id']
  #   teacher
  # end

  # def parse_student(person)
  #   student = Student.new(classroom: person['classroom'], age: person['age'].to_i, name: person['name'], parent_permission: person['parent_permission'])
  #   student.id = person['id']
  #   student
  # end

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
