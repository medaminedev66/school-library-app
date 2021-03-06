require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization:, age:, name: 'unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'specialization' => @specialization,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end
end
