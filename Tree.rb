require_relative './Node'
class Tree

  def initialize(array)
    @array = array
    @node = Node.new
    @root = build_tree(array)
  end

  def build_tree(array)
    midpoint = array.length / 2
    array.sort!.uniq!
    root = @node.data(array[midpoint])

    
    while(queue != nil)
      if(start < midpoint)
        
      left_mid = 
      @node.left = 
      end

      if(array.length > midpoint)
        @node.right = 
      end
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end