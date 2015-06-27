require_relative "character.rb"

class Die
  attr_accessor :num_sides
  def initialize( num_sides )
    @num_sides = num_sides.to_i
  end

  def roll
    rand(1..@num_sides)  # rand(@num_sides) + 1
  end

end


#
 # end
#
# agility = 10
# legolas_agility_die = Die.new( agility )
# puts legolas_agility_die.roll
# gimli_agility_die = Die.new( agility )
# puts gimli_agility_die.roll
#
# 100.times do
#   if legolas_agility_die.roll > gimli_agility_die.roll
#     puts "Legolas goes first"
#   else
#     puts "Gimly goes first"
#   end
# end
#
# 100.times do
#   if legolas_agility_die.roll < 10
#     puts "Hits"
#   else
#     puts "Misses"
#   end
#
# end