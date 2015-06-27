require_relative "menu.rb"
require_relative "character.rb"
require_relative "item.rb"
require_relative "weapon.rb"
require_relative "armor.rb"
require_relative "dice.rb"
menu = Menu.new(
    "Load Character 1",
    "Load Character 2",
    "Fight",
    "quit"
)

d4 = Die.new(4)
d8 = Die.new(8)
d10 = Die.new(10)
d15 = Die.new(15)



while ((choice = menu.get_menu_choice) != menu.quit)

  case choice
    when 1
      puts "what file would you like to open"
      choice = gets.chomp

      if File.exist?(choice)
        char1_file = File.open(choice)
        character1 = []
        while !char1_file.eof?
          attribute = char1_file.gets.chomp.split(/\,/)
          character1 << attribute
        end
        char1_item1 = Item.new(character1[1][0])
        char1_item2= Item.new(character1[2][0])
        char1_weapon = Weapon.new(char1_item1, character1[1][1])
        char1_armor = Armor.new(char1_item2, character1[2][1])
        char1 = Character.new(character1[0][0], character1[0][1], character1[0][2], character1[0][2], character1[0][3], character1[0][4],Weapon.new(char1_item1, character1[1][1]),Armor.new(char1_item2, character1[2][1]))
        char1_agility_die = Die.new(character1[0][4])
        char1_file.close
        puts
        puts char1
        puts char1_weapon
        puts char1_armor
        @load1 = true
        puts
      else
        puts 'Enter valid file name'
      end

    when 2
      puts "what file would you like to open"
      choice = gets.chomp
      if File.exist?(choice)
      char2_file = File.open(choice)
      character2 = []
      while !char2_file.eof?
        attribute = char2_file.gets.chomp.split(/\,/)
        character2 << attribute
      end
      char2_item1 = Item.new(character2[1][0])
      char2_item2 = Item.new(character2[2][0])
      char2_weapon = Weapon.new(char2_item1, character2[1][1])
      char2_armor = Armor.new(char2_item2, character2[2][1])
      char2_agility_die = Die.new(character2[0][4].to_i)
      char2 = Character.new(character2[0][0], character2[0][1], character2[0][2], character2[0][2], character2[0][3], character2[0][4],Weapon.new(char2_item1, character2[1][1]),Armor.new(char2_item2, character2[2][1]))

      char2_file.close
      puts
      puts char2
      puts char2_weapon
      puts char2_armor
      @load2 = true
      puts
      else
        puts 'Enter valid file name'
      end
    when 3
      if @load1 != true
        puts "You must load Character 1"
      elsif @load2 != true
        puts "You must load Character 2"
      else

#       Who goes first?

        x = char1_agility_die.roll
        y = char2_agility_die.roll

        if x == y
          x = char2_agility_die.roll
          y = char1_agility_die.roll
        end
        if x > y
          fighter1 = char1
          fighter1_weapon_hit = char1_weapon.damage_hits
          fighter2 = char2
          fighter2_armor_save = char2_armor.protection_hits
        end
        if y > x
          fighter1 = char2
          fighter1_weapon_hit = char2_weapon.damage_hits
          fighter2 = char1
          fighter2_armor_save = char1_armor.protection_hits
        end


#




      while fighter1.current_hit_points > 0 && fighter2.current_hit_points > 0
        hit_formula = (fighter1.strength * (1 / d4.roll) + (fighter1_weapon_hit) / d8.roll)
        armor_save_formula = (fighter2_armor_save / d15.roll)
        damage_formula = (hit_formula - armor_save_formula)
        if damage_formula < 0
          damage_formula = 0
        end

        if d10.roll < fighter1.agility

          puts "#{fighter1.name } attacks and hits a #{ hit_formula}"
          puts "#{fighter2.name}'s shield blocks #{armor_save_formula } of damage "
          fighter2.reduce_hits(damage_formula)
          puts "#{fighter2.current_status}"
          puts
        else
          puts "#{fighter1.name } attacks and misses!"
          puts
        end
        if d10.roll < fighter2.agility
          puts "#{fighter2.name } attacks and hits a #{hit_formula}"
          puts "#{fighter1.name}'s shield blocks #{armor_save_formula } of damage "
          fighter1.reduce_hits(damage_formula)
          puts "#{fighter1.current_status}"
          puts

        else
          puts "#{fighter2.name } attacks and misses!"
          puts
        end

gets
      end

      if fighter1.current_hit_points == 0
        puts "#{fighter2.name } WINS!!!!"
        puts
        fighter1.revive_character
        fighter2.revive_character
      end
      if fighter2.current_hit_points == 0
        puts "#{fighter1.name } WINS!!!"
        puts
        fighter1.revive_character
        fighter2.revive_character
      end
  end
  end
end








