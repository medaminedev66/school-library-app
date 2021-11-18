require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new specialization: 'Math', age: 19, name: 'Amine'
  end

  describe '#new' do
    it 'has an instance' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'has a specialization' do
      expect(@teacher.specialization).to eql('Math')
    end

    it 'can use services' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
