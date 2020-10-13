require 'pry'

class Player
    attr_accessor :name, :life_points
    

    def initialize(name)
        @life_points = 10
        @name = name
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie."
    end

    def gets_damage(damage)
        @damage = damage
        @life_points -= @damage
        if @life_points <= 0
            then puts "Le joueur #{name} a été mis K.O... Il est évacué du ring sur civière, son pronostic vital est engagé."
        end       
    end

    def attacks(player)
        puts "Le joueur #{@name} attaque le joueur #{player.name}"
        compute_damage
        damage= compute_damage
        puts "Il lui inflige #{damage} points de dommages dans la gueule !"
        player.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player
    attr_accessor :weapon_level
    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        @new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{@new_weapon_level}."
        if @new_weapon_level > @weapon_level
            puts "Super ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = @new_weapon_level
        else
            puts "Dommage, elle n'est pas mieux que ton arme actuelle"
        end

    end

    def search_health_pack
        @rand_number = rand(1..6)
        if @rand_number == 1
            puts "Tu n'as rien trouvé..."
        elsif @rand_number > 1 && @rand_number <6
            @life_points += 50
            if @life_points > 100
                @life_points = 100
            end
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else @rand_number == 6
            @life_points += 80
            if @life_points > 100
                @life_points = 100
            end
            puts "Waouuh, tu as trouvé un pack de +80 points de vie !"
        end
    end
    
end


binding.pry
puts "end of file" 