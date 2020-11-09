class Players
  attr_accessor :lives 
  attr_accessor :name 
  attr_accessor :dead
  def initialize(name, lives)
    @name = name
    @lives = lives
    @dead = false
  end
end