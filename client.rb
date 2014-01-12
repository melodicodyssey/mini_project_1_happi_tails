class Client

	attr_accessor :name, :age, :children, :pets

	def initialize(name,age,children)
		@name = name
		@age = age
		@children = children
		@pets = []
	end

	def has_pets
		@pets.length < 1 ? false : true
	end

end