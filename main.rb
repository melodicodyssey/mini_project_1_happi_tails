require './shelter'
require './animal'
require './client'
require 'pry'

shelter = Shelter.new("Happi Tails Animal Shelter",[],[])



def menu()
	puts `clear`
	puts "\n\n~~ Welcome to Happi Tails Animal Shelter! ~~\n\n"
	puts "Please enter your desired action:\n\n"
	puts "1. Process new client"
	puts "2. Remove client"
	puts "3. Process new animal"
	puts "4. Remove animal"
	puts "5. List all active clients"
	puts "6. List all active animals"
	puts "7. Process new adoption"
	puts "q. Quit"
	puts "\n\n"
	print "--->  "
end

message = ""
until message == "q"
	menu()
	message = gets.chomp
	case message
	when "1"
		puts "Please enter client name"
		c_name = gets.chomp
		puts "Please enter client age"
		c_age = gets.chomp
		puts "Please enter number of children"
		c_children = gets.chomp
		puts "Please enter number of pets (if any)"
		c_pets = gets.chomp
		shelter.clients << Client.new(c_name,c_age,c_children,c_pets)
		# binding.pry
	when "2"
		removed = false
		until removed == true
			shelter.display_all_clients
			puts "Please type name of client to remove, or type cancel to abort process"
			name = gets.chomp
			if shelter.display_all_clients.include?(name)
				shelter.remove_client(name)
				puts "#{name} removed from client list"
				removed = true
			elsif name == "cancel"
				removed = true
			end
		end
	when "3"
		puts "Enter species of animal"
		a_species = gets.chomp
		puts "Enter gender of animal"
		a_gender = gets.chomp
		puts "Enter name of animal"
		a_name = gets.chomp
		puts "Enter age of animal"
		a_age = gets.chomp
		puts "List any toys associated with this animal.  Type 'done' when finished"
		done = false
		a_toys =[]
		until done == true
			toy = gets.chomp
			if toy != "done"
				a_toys << toy
			elsif toy.downcase == "done"
				done = true
			end
		end
		shelter.animals << Animal.new(a_name,a_age,a_gender,a_species,a_toys)
		# binding.pry
	when "4"
		removed = false
		until removed == true
			puts shelter.display_all_animals
			puts "Please type name of animal to remove, or type cancel to abort process"
			name = gets.chomp
			if shelter.display_all_animals.include?(name)
				shelter.remove_animal(name)
				puts "#{name} was removed from the animal list"
				removed = true
			elsif name == "cancel"
				removed = true
			end
		end
		binding.pry
	when "5"
		puts shelter.display_all_clients
	when "6"
		puts shelter.display_all_animals
	when "7"
		
	end
end