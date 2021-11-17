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
                            name: person.name, parent_permission: person.parent_permission, id: person.id })
      else
        @json_people.push({ 'json_class' => 'Student', classroom: person.classroom.label, age: person.age,
                            name: person.name, parent_permission: person.parent_permission, id: person.id})
      end
    end
    File.write('people.json', JSON.generate(@json_people))
  end

  def parse_people(new_people)
    File.open('people.json', 'w') { |f| f.write JSON.generate([]) } unless File.exist? 'people.json'

    JSON.parse(File.read('people.json')).map do |person|
      if person['json_class'].eql?('Teacher')
                             teacher = Teacher.new(specialization: person['specialization'], age: person['age'].to_i,
                                         name: person['name'])
                                         teacher.id = person['id']
                                         new_people.people << teacher
      else
          classroom = Classroom.new(person['classroom'])
                             student = Student.new(classroom: classroom, age: person['age'], name: person['name'],
                                         parent_permission: person['parent_permission'])
                                         student.id = person['id']
                                         new_people.people << student
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

  def parse_rentals(new_rentals)
    file_name = 'rentals.json'
    File.open('rentals.json', 'w') { |f| f.write JSON.generate([]) } unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |rental|
     new_rentals.handle_people.people.each { |p| @person=p if p.id.eql?(rental["person"])}
    new_rentals.handle_books.books.each { |b| @book=b if b.title.eql?(rental['book']) }
    # puts  new_rentals.rentals 
    
    #<< Rental.new(rental['date'], @person, @book)
    # puts rental["person"]
    # puts rental['book']
    # puts rental['date']
    end
    puts @person.id
    puts @book.title
  end

  def save_rentals(new_rentals)
    @json_rentals = []
    new_rentals.rentals.each do |rental|
      @json_rentals.push({ 'json_class' => 'Rental', 'date' => rental.date, 'person' => rental.person.id, 'book' => rental.book.title})
    end
    File.write('rentals.json', JSON.generate(@json_rentals))
  end

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

end
