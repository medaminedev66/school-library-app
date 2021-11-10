require './person'

class Student < Person
  attr_reader :classroom

  def initialize(_classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hokey
    "\(ツ)/¯"
  end
end
