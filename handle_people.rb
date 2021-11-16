require './classroom'
require './student'
require './teacher'

class HandlePeople
  attr_accessor :people

  def initialize
    @people = []
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
end
