class Player
  attr_accessor :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def prompt
    puts "Your turn #{@name}, make a move:"
    return gets.strip
  end
end
