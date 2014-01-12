class Client

	attr_accessor :name, :age, :children, :pets

	def initialize(name,age,children,pets)
		@name = name
		@age = age
		@children = children
		@pets = pets
	end

end