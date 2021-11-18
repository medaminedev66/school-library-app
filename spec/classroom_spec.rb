require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @class_room = Classroom.new('Mathematic')
  end

  describe '#new' do
    it 'has an instance' do
      expect(@class_room).to be_an_instance_of Classroom
    end
  end

  describe 'can have students' do
    it 'It has students' do
      @student = Student.new(classroom: @class_room, age: 20, name: 'Ahmed')
      expect(@class_room.students).to match_array([@student])
    end

    it 'can add students' do
      @class_room2 = Classroom.new('Physics')
      @student2 = Student.new(classroom: @class_room2, age: 24, name: 'Juliana')
      @class_room.add_student(@student2)
      expect(@class_room.students).to match_array([@student2])
    end
  end
end
