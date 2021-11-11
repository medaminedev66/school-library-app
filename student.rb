require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, age:, name: 'unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hokey
    "\(ツ)/¯"
  end
end
