class Animal

	attr_accessor :name, :age, :gender, :species, :owner, :toys

	def initialize(name,age,gender,species,*toys)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@owner = nil
		@toys = toys
	end

end