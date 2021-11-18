require_relative '../book.rb'
require_relative '../person.rb'
require_relative '../rental.rb'

describe "Create a book" do
  before :each do
    @book = Book.new(title: "GOT", author: "George Martin")
  end

  describe "book is an instance of Book" do
    it "is an instance of Book" do
      expect(@book).to be_instance_of(Book)
    end
  end
  
  describe "book should have an empty rental" do
    it "rental is an empty array" do
      person = Person.new(age: 20, name: 'Juliana', parent_permission: true)
      rental = Rental.new("2020-10-20", person, @book)
      rental_1 = @book.add_rentals(person, "2020-10-10")
      expect(rental_1.person.name).to eq('Juliana')
    end
    it "rental is an empty array" do
      @book.rentals.should eql []
  end
  end
  
end
