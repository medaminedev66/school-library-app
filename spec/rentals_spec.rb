require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  before :each do
    @person1 = Person.new(age: 24, name: 'Juliana')
    @book1 = Book.new(title: 'Alchemist', author: 'Paoulo')
    @rental1 = Rental.new '2020-20-20', @person1, @book1
  end

  describe '#new' do
    it 'has an instance' do
      expect(@rental1).to be_an_instance_of Rental
    end
  end

  describe 'it has person' do
    it 'has 1 person' do
      expect(@rental1.person.name).to eql('Juliana')
    end
  end

  describe 'it has a book' do
    it 'it has a book' do
      expect(@rental1.book.title).to eql('Alchemist')
    end
  end
end
