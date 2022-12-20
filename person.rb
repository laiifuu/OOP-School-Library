class Person
  @obj_count = 0

  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @obj_count += 1
    @id = @obj_count
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age > 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end
end
