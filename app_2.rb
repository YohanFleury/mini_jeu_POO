require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "________________________________________________"
puts "|Bienvenue dans l'octogone !                    |"
puts "|Le but du jeu est d'être le dernier survivant! |"
puts "________________________________________________"

#Initialisation du joueur

puts "Quel est le prénom de ton personnage ?"
print ">"
name = gets.chomp
user = HumanPlayer.new(name)

#Initialisaition des enemis

enemies_array = []
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies_array [0] = player1
enemies_array[1] = player2

#Le combat

while (player1.life_points > 0 || player2.life_points > 0) && user.life_points > 0
    puts user.show_state
    puts "___________________________________"
    puts "Quelle action veux-tu effectuer ?"
    puts " "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts " "
    puts "attaquer un joueur en vue :"
    if player1.life_points >= 0 
        puts "1 - #{player1.show_state}"
    end
    if player2.life_points >= 0 
        puts "2 - #{player2.show_state}"
    end
    puts "___________________________________"
    choice = gets.chomp.to_s
    
    #Action à realiser

    if choice == "a"
        user.search_weapon
    elsif choice == "s"
        user.search_health_pack
    elsif choice == "1"
        user.attacks(player1)
    else choice == "2"
        user.attacks(player2)    
    end

    #Riposte ennemie

    
    enemies_array.each do
        |enemi|
        if enemi.life_points > 0
            puts "Les autres joueurs t'attaquent"
            enemi.attacks(user)
        end
    end
end

puts "La partie est terminée."
if user.life_points > O
    
    puts "BRAVO ! Tu as gagné !"
else        
    puts "Loser ! Tu as perdu !"
end





binding.pry