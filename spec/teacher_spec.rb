require './teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    age = '45'
    name = 'Ahmed'
    specialization = 'football'
    teacher = Teacher.new(name, age, specialization)

    it 'should confirm the age of the teacher' do
      expect(teacher.age).to eq age
    end

    it 'should confirm the name of the teacher' do
      expect(teacher.name).to eq name
    end

    it 'should return parent permission for teacher' do
      expect(teacher.specialization).to eq specialization
    end

    it 'should return if a teacher can use services = true' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
