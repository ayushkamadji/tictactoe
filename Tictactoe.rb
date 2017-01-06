require_relative 'Game'

exit_command = false

until exit_command
puts("=========")
puts("TICTACTOE")
puts("=========")
puts("But we are awesome so we will play \"Naugths and Crosses\" instead")
puts("Menu: ")
puts("1. New Game")
puts("2. Exit")
puts("Type the number of your selection and press Enter")
selection = gets.strip.to_i

if selection == 1
  game = Game.new
  game.start
end

if selection == 2
  exit_command = true
end

end


