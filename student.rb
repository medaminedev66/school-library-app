require './person'

class Student < Person
  def initialize(classroom, name = 'unknown', parent_permission: true)
    super(name, parent_permission)
    @classroom = classroom
  end

  def play_hokey
    "\(ツ)/¯"
  end
end
