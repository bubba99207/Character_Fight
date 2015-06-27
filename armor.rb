require_relative "item.rb"
class Armor < Item
  attr_accessor :protection_hits
  def initialize(name, protection_hits)
    @protection_hits = protection_hits.to_i
    super(name)
  end

  def to_s
  return "#{@name}, #{@protection_hits}"
  end
end