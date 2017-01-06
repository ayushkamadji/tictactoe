require_relative 'Node'
require_relative 'KeyMap'

class Board
  include KeyMap

  attr_reader :nodes

  def initialize
    @nodes = {}
    keygen().each {|key| @nodes[key] = Node.new}
  end
  
  def update_board(key, mark)
    @nodes[key].mark = mark
  end

  def get_column(letter)
    keys = @nodes.keys.select { |key| key.any? { |elem| elem == letter } }
    return get_nodes(keys)
  end

  def get_row(number)
    keys = @nodes.keys.select { |key| key.any? { |elem| elem == number } }
    return get_nodes(keys)
  end

  def get_diag(start_key, end_key)
    center = ["B", 2]
    keys = [start_key, center, end_key]
    return get_nodes(keys)
  end

  def display_state 
    print("\tA\tB\tC\n\n")
    print("1\t#{@nodes[['A', 1]].print}\t#{@nodes[['B', 1]].print}\t#{@nodes[['C', 1]].print}\n\n")
    print("2\t#{@nodes[['A', 2]].print}\t#{@nodes[['B', 2]].print}\t#{@nodes[['C', 2]].print}\n\n")
    print("3\t#{@nodes[['A', 3]].print}\t#{@nodes[['B', 3]].print}\t#{@nodes[['C', 3]].print}\n\n")
  end
  
  private
  
  def get_nodes(keys)
    nodes = {}
    keys.each { |key| nodes[key] = @nodes[key] }
    return nodes
  end
end
