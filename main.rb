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
	puts "8. Put client's pet up for adoption"
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
		puts "Please enter client name" ; c_name = gets.chomp
		puts "Please enter client age" ; c_age = gets.chomp
		puts "Please enter number of children" ; c_children = gets.chomp
		shelter.clients << Client.new(c_name,c_age,c_children)
	
	when "2"
		removed = false
		until removed == true
			shelter.display_all_clients
			puts "Please type name of client to remove, or type cancel to abort process"
			name = gets.chomp
			if shelter.list_clients.include?(name)
				shelter.remove_client(name)
				puts "#{name} removed from client list"
				removed = true
			elsif name == "cancel"
				removed = true
			end
		end

	when "3"
		puts "Enter species of animal" ; a_species = gets.chomp.downcase
		puts "Enter gender of animal: male/female" ; a_gender = gets.chomp.downcase
		puts "Enter name of animal" ; a_name = gets.chomp
		puts "Enter age (human years) of animal" ; a_age = gets.chomp
		puts "List any toys associated with this animal.  Type 'done' when finished"
		done = false ; a_toys =[]
		until done == true
			toy = gets.chomp
			if toy != "done"
				a_toys << toy
			elsif toy.downcase == "done"
				done = true
			end
		end
		owner_complete = false
		until owner_complete == true
			puts "Does #{a_name} currently have an owner? Y/N"
			owner = gets.chomp.downcase
			if owner == "y"
				to_owner = false
				until to_owner == true
					puts shelter.display_all_clients
					puts "Which client owns #{a_name}?  Or type 'cancel' to abort"
					owner = gets.chomp
					if shelter.list_clients.include?(owner)
						a_owner = owner
						to_owner = true
					elsif owner.downcase == "cancel"
						to_owner = true
					end
				end
				owner_complete = true
			elsif owner == "n"
				a_owner = nil
				owner_complete = true
			end
			
		end
		new_animal = Animal.new(a_name,a_age,a_gender,a_species,a_owner,a_toys)
		shelter.animals << new_animal
		if !a_owner.nil?
			shelter.clients.select{|client| client.name == a_owner}[0].pets << new_animal
			shelter.animals.select{|animal| animal.name == a_name}[0].owner = shelter.clients.select{|client| client.name == a_owner}[0]
		end

	when "4"
		removed = false
		until removed == true
			puts shelter.display_all_animals
			puts "Please type name of animal to remove, or type cancel to abort process"
			name = gets.chomp
			if shelter.list_animals.include?(name)
				shelter.remove_animal(name)
				puts "#{name} was removed from the animal list"
				removed = true
			elsif name == "cancel"
				removed = true
			end
		end

	when "5"
		puts shelter.display_all_clients
		puts "\n(press any key to continue"
		gets.chomp

	when "6"
		puts shelter.display_homeless_animals
		puts "\n(press any key to continue"
		gets.chomp

	when "7"
		puts "Who is doing the adopting?"
		puts shelter.display_all_clients
		adopter = gets.chomp		
		adopted = false
		until adopted == true
			puts "Which animal is being adopted?  Or type 'cancel' to abort"
			puts shelter.display_homeless_animals
			adoptee = gets.chomp
			if shelter.list_animals.include?(adoptee)
				shelter.clients.select{|client| client.name == adopter}[0].pets << shelter.animals.select{|animal| animal.name == adoptee}[0]
				shelter.animals.select{|animal| animal.name == adoptee}[0].owner = shelter.clients.select{|client| client.name == adopter}[0]
				adopted = true
			elsif adoptee.downcase == "cancel"
				adopted = true
			end
		end

	when "8"
		given = false
		until given == true
			puts "Which client would like to put their pet up for adoption?"
			puts shelter.display_owners
			giver = gets.chomp
			# if client name is valid
			if shelter.list_clients.include?(giver)
				puts "Which pet would #{giver} like to put up for adoption?"
				# list client's pets
				shelter.clients.select {|client| client.name == giver}[0].pets.each do |pet|
					puts "#{pet.name} - #{pet.age} y/o #{pet.gender} #{pet.species}"
				end
				pet = gets.chomp
				shelter.clients.select{|client| client.name == giver}[0].pets = []
				shelter.animals.select{|animal| animal.name == pet}[0].owner = nil
				given = true
			end
		end
	end
end