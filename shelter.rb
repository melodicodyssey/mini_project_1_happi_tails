class Shelter

	attr_accessor :name, :clients, :animals

	def initialize(name,clients=[],animals=[])
		@name = name
		@clients = clients
		@animals = animals
	end

	def list_clients
		client_list = self.clients.map do |client|
			client.name
		end
		client_list
	end

	def list_animals
		animal_list = self.animals.map do |animal|
			animal.name
		end
	end

	def display_all_clients
		info = self.clients.map do |client|
			puts "#{client.name}"
			if client.has_pets
				puts "pets:"
				for pet in client.pets do
					puts "#{pet.name} - #{pet.age} y/o #{pet.gender} #{pet.species}"
				end
			end
		end
		puts info
	end

	def display_all_animals
		info = self.animals.map do |animal|
			puts "#{animal.name} - #{animal.gender} #{animal.species}"
		end
		info
	end

	def display_homeless_animals
		info = self.animals.map do |animal|
			if !animal.has_owner?
				puts "#{animal.name} - #{animal.gender} #{animal.species}"
			end
		end
	end

	def display_owners
		info = self.clients.map do |client|
			if client.has_pets
				puts "#{client.name}"
				puts "\tpets:"
				for pet in client.pets
					puts "\t  #{pet.name}"
				end
			end
		end
		puts info
	end

	def list_owners
		info = self.clients.map do |client|
			if client.has_pets
				client.name
			end
		end
		puts info
	end

	def remove_client(name)
		self.clients.delete_if{|client| client.name == name}
	end

	def remove_animal(name)
		self.animals.delete_if{|animal| animal.name == name}
	end

end