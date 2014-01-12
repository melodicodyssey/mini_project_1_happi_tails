class Client

	attr_accessor :name, :age, :children, :pets

	def initialize(name,age,children,pets)
		@name = name
		@age = age
		@children = children
		@pets = pets
	end

	def has_pets
		!@pets.nil? ? true : false
	end

end