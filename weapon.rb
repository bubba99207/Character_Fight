require_relative "item.rb"
class Weapon < Item
  attr_accessor  :damage_hits
  def initialize(name, damage_hits)
    @damage_hits = damage_hits.to_i
    super(name)
  end

  def to_s
      return "#{@name}, #{@damage_hits}"
  end
end