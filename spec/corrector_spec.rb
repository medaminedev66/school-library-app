require_relative '../corrector.rb'
require_relative '../person.rb'

describe "Create a corrector class" do
  before :each do
    @corrector = Corrector.new
  end

  describe "Correct any given name" do
    it "Capitalize a given name and return 10 characters" do
      @person_2 = Person.new(age: 12, name: 'amine Mohamed', parent_permission: false)
      expect(@corrector.correct_name(@person_2.name)).to eq('Amine moham')
    end
  end
end