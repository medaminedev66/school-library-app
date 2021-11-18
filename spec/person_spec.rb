require_relative '../person.rb'
require_relative '../corrector.rb'

describe "Create a person" do
  before :each do
    @person = Person.new(age: 20, name: 'juliana Ifionu', parent_permission: true)
    @person_2 = Person.new(age: 12, name: 'Amine', parent_permission: false)
  end

  describe "person is an instance of Person" do
    it "is an instance of Person" do
      expect(@person).to be_instance_of(Person)
    end
  end
  
  describe "Person has rental" do
    it "Checks author of a book" do
      book = Book.new(title: "GOT", author: "George Martin")
      rental = Rental.new("2020-10-20", @person, book)
      rental_2 = @person.add_rentals(book, "2020-10-10")
      expect(rental_2.book.author).to eq('George Martin')
    end

    it "rental is an empty array" do
      @person.rentals.should eql []
  end

    it "Can use service" do
      expect(@person.can_use_services?).to be_truthy
    end

    it "Can use service" do
      expect(@person_2.can_use_services?).to be_falsey
    end

    it "Validate name" do
      expect(@person.validate_name).to eq('Juliana ifi')
    end
  end
  
end
