class Stats

	attr_accessor :health, :take_damage, :potion

	def initialize(health)
		@health = health
	end

	def take_damage
		damage = rand(10).to_i
		@health = @health - damage
	end


end

class Zombie < Stats

end

class Person < Stats

	def potion
		@health = @health + 5
	end

end

class Start
	hero = Person.new(50)
	zombie = Zombie.new(25)
	puts "You are fighting a zombie!"

	while true
		if hero.health <= 0 || zombie.health <= 0
			puts "The fight is over"
			exit(0)
		end

		puts "What action do you take? Attack, Potion"
		action = $stdin.gets.chomp.downcase #downcase user input

		if action == "attack"
			zombie.take_damage
			puts "You hit the zombie, its health is now #{zombie.health}"

			puts "The zombie hits back"
			hero.take_damage
			puts "Your health is #{hero.health}"
		elsif action == "potion"
			hero.potion
			puts "You drink a potion, Your health is now #{hero.health}"

			puts "The zombie hits You"
			hero.take_damage
			puts "Your health is #{hero.health}"
		end
	end

end

game = Start.new()