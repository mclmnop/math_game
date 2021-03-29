class Player
  attr_accessor :name, :score

  def initialize(id, name)
    @id = id
    @name = name
    @score = 3
  end
end
