class Node
  attr_accessor :mark

  def initialize
    @mark = :unmarked
  end

  def is_marked?
    return @mark != :unmarked
  end

  def print
    case @mark
    when :naught then return "O"
    when :cross then return "X"
    when :unmarked then return " "
    end
  end
end

