require_relative 'Board'
require_relative 'Player'
require_relative 'GameHelper'

class Game
  include GameHelper

  def initialize
    @board = Board.new
    @player_1 = Player.new("P1", :cross)
    @player_2 = Player.new("P2", :naught)
    @active_player = @player_1
    @standby_player = @player_2
    @game_over = false
  end

  def start
    win_mark = nil

    until @game_over
      @board.display_state
      move = @active_player.prompt

      @board.update_board(parse(move), @active_player.mark)

      if has_winner? || is_stalemate?
        win_mark = get_win_mark
        @game_over = true
      end

      @active_player, @standby_player = @standby_player, @active_player
    end

    show_result(get_player_by_mark(win_mark))

  end

  def show_result(player)
    if player == nil
      print "\nIt is a stalemate.. :(\n\n"
    else
      print "\n#{player.name} wins. Congratulations!\n\n"
    end
  end

  def get_player_by_mark(mark)
    return nil if mark == nil
    return @player_1 if @player_1.mark == mark
    return @player_2 if @player_2.mark == mark
  end

  def is_stalemate?
    return @board.nodes.values.all? { |node| node.mark != :unmarked }
  end

  def has_winner?
    return get_win_mark
  end

  def get_win_mark
    win_in_cols = ("A".."C").reduce(false) do |result, letter| 
      result = result || check_for_winner(@board.get_column(letter))
    end

    win_in_rows = (1..3).reduce(false) do |result, number|
      result = result || check_for_winner(@board.get_row(number))
    end

    win_in_diag = check_for_winner(@board.get_diag(parse("A1"), parse("C3")))

    win_in_rev_diag = check_for_winner(@board.get_diag(parse("A3"),parse("C1")))

    return win_in_cols || win_in_rows || win_in_diag || win_in_rev_diag
  end

  def check_for_winner(nodes)
    return :naught if nodes.values.all? {|node| node.mark == :naught}
    return :cross if nodes.values.all? {|node| node.mark == :cross}
    return nil
  end

end


