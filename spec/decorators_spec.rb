require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe 'testing decorators' do
  context 'When testing the decorator classes' do
    it 'should return the name of the person = NAME' do
      person = Person.new(19, 12, 'maximilianus')
      expect(person.correct_name).to eq 'maximilianus'
    end

    it "Should be able to return the person's name capitalized" do
      person = Person.new(19, 12, 'maximilianus')
      capitalized_person = CapitalizeDecorator.new(person)
      expect(capitalized_person.correct_name).to eq 'Maximilianus'
    end

    it "Should be able to return the person's name capitalized and trimmed to 10 characters" do
      person = Person.new(19, 12, 'maximilianus')
      capitalized_person = CapitalizeDecorator.new(person)
      trimmed_person = TrimmerDecorator.new(capitalized_person)
      expect(trimmed_person.correct_name).to eq 'Maximilian'
    end
  end
end
