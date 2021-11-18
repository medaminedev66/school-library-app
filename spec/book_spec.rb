require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe 'Create a book' do
  before :each do
    @book = Book.new(title: 'GOT', author: 'George Martin')
  end

  describe 'book is an instance of Book' do
    it 'is an instance of Book' do
      expect(@book).to be_instance_of(Book)
    end
  end

  describe 'book has rentals' do
    it 'Name of person that rents a book' do
      person = Person.new(age: 20, name: 'Juliana', parent_permission: true)
      first_rental = @book.add_rentals(person, '2020-10-10')
      expect(first_rental.person.name).to eq('Juliana')
    end
    it 'rental is an empty array' do
      @book.rentals.should eql []
    end
  end
end
