require_relative '../corrector'
require_relative '../person'

describe 'Create a corrector class' do
  before :each do
    @corrector = Corrector.new
  end

  describe 'Correct any given name' do
    it 'Capitalize a given name and return 10 characters' do
      @second_person = Person.new(age: 12, name: 'amine Mohamed', parent_permission: false)
      expect(@corrector.correct_name(@second_person.name)).to eq('Amine moham')
    end
  end
end
