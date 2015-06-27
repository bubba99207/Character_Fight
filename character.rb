
class Character
  attr_reader :name, :race, :hit_points, :strength, :agility
attr_accessor :current_hit_points, :weapon, :armor, :load1, :load2

  def initialize(name, race, hit_points, current_hit_points, strength, agility, weapon,armor)
    @weapon = weapon
    @armor = armor
    @@max_hit_points = 100
    @@max_strength = 50
    @@max_agility = 10
    @@max_current_hit_points = 100
    @name = name
    @race = race
    @hit_points = hit_points.to_i
    @current_hit_points = current_hit_points.to_i
    @strength = strength.to_i
    @agility = agility.to_i
    @load1 = false
    @load2 = false
    if @hit_points > @@max_hit_points
      @hit_points = @@max_hit_points
    end
    if @current_hit_points > @@max_current_hit_points
      @current_hit_points = @@max_current_hit_points
    end
    if @strength > @@max_strength
      @strength = @@max_strength
    end
    if @agility > @@max_agility
      @agility = @@max_agility
    end
  end

  def reduce_hits(hits)
    @current_hit_points -= hits
    if @current_hit_points < 0
      @current_hit_points = 0
    end
  end

  def to_s
    return "#{@name}, #{@race}, #{@hit_points}, #{@current_hit_points}, #{@strength}, #{@agility}"
  end

  def current_status
return"#{@name } has #{@current_hit_points } out of #{@hit_points}"
  end

  def revive_character
    @current_hit_points = @hit_points
  end



end
