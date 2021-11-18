require_relative '../classroom'
require_relative '../student'

describe Student do
  before :each do
    @class_room = Classroom.new('Mathematic')
    @student = Student.new(classroom: @class_room, age: 20, name: 'Ahmed')
  end

  describe '#new' do
    it 'has an instance' do
      expect(@student).to be_an_instance_of Student
    end

    it 'has a name' do
      expect(@student.name).to eql('Ahmed')
    end

    it 'has an age' do
      expect(@student.age).to eql(20)
    end

    it 'has a classroom' do
      expect(@student.classroom.label).to eql('Mathematic')
    end
  end

  describe 'has play hokey method' do
    it 'can play hokey' do
      expect(@student.play_hokey).to eql("\(ツ)/¯")
    end
  end
end
