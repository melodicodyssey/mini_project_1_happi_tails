class Shelter

	attr_accessor :name, :clients, :animals

	def initialize(name,clients=[],animals=[])
		@name = name
		@clients = clients
		@animals = animals
	end

	def display_all_clients
		info = self.clients.map do |client|
			puts client.name
		end
		info
	end

	def display_all_animals
		info = self.animals.map do |animal|
			puts "#{animal.name} - #{animal.gender} #{animal.species}"
		end
		info
	end

	def remove_client(name)
		self.clients.delete_if{|client| client.name == name}
	end

	def remove_animal(name)
		self.animals.delete_if{|animal| animal.name == name}
	end

end