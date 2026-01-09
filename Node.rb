class Node
  include Comparable
  attr_accessor :right, :left, :data 
  
  def initialize(right, left, data)
    @right = right
    @left = left
    @data = data
  end

  def <=>(other)
    return nil unless other.is_a?(Node)
    @data <=> other.data
  end
end