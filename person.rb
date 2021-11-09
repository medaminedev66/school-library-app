require './corrector'

class Person
  attr_accessor :name, :age

  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def validate_name
    @corrector.correct_name @name
  end

  private

  def of_age?
    @age >= 18
  end
end
