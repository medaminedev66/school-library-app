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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'classroom' => @classroom,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end
end
