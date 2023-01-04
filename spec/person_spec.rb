require_relative '../person'
require_relative '../book'
require_relative '../rental'
describe "testing person" do
  context "When testing the Person class" do
    it "should create a person properly" do
        person = Person.new(12, 45, 'NAME')
        expect(person.class).to eq Person
    end
    it "should return the person's name" do
      person = Person.new(12, 45, 'NAME')
      expect(person.correct_name).to eq "NAME"
    end
    it "should return if the person can use services or not = " do
      person = Person.new(12, 45, 'NAME')
      expect(person.can_use_services?).to eq true
    end
    it "should  successfully add a rental to the rentals list" do
      person = Person.new(12, 45, 'NAME')
      book = Book.new("New Book", "PERSON anonymous")
      rental = Rental.new(person, book, "12-12-2020")
      person.add_rental(rental)
      expect(person.rentals.length).to eq 2
    end
  end
end