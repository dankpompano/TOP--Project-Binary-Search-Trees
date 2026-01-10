require_relative './Node'
class Tree

  def initialize(array)
    @array = array
    @root = build_tree(array)
  end

  def build_tree(array)
    if(array.length == 0)
      return nil
    end
    
    array.sort!.uniq!
    midpoint = (array.length - 1) / 2
    root = Node.new(array[midpoint])
    queue = [[0, array.length - 1, root]]    

    while(!queue.empty?)
      st, en, current = queue.shift
      mid = (st + en) / 2
      if(st < mid) 
        mid_left = (st + mid - 1) / 2
        left_node = Node.new(array[mid_left])
        current.left = left_node #link it
        queue.push([left_node, st, mid - 1])
      end

      if(en > mid)
        mid_right = (mid + 1 + en) / 2
        right_node = Node.new(array[mid_right])
        current.right = right_node #link it
        queue.push([right_node, mid + 1, en])      
      end
    end
    return root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(root, val)
    temp = Node.new(val)

    if(root.empty?)
      return nil
    end

    curr = root
    while(curr != nil)
      if(val < curr.data && curr.left != nil)
        curr = curr.left
      elsif(val > curr.data && curr.right != nil)
        curr = curr.right
      else
        break
      end
    end

    if(curr.data < temp)
      curr.left = temp
    elsif(curr.data > temp)
        curr.right = temp
    end
  end

  
  def delete(root, val)
    if(root.empty?)
      return nil
    end

    parent = nil
    curr = root
    
    #find the node
    while(curr != nil && curr.data != val)
      parent = curr
      if(val < curr.data)
        curr = curr.left
      else
        curr = curr.right
      end
      return root if curr.nil?
        
      # STEP 2: Node with 0 or 1 child
    if curr.left.nil? || curr.right.nil?
      child = curr.left.nil? ? curr.right : curr.left

      # deleting root
      if parent.nil?
        return child
      end

      if parent.left == curr
        parent.left = child
      else
        parent.right = child
      end

      return root
    end

    # STEP 3: Node with 2 children
    successor_parent = curr
    successor = curr.right

    while successor.left != nil
      successor_parent = successor
      successor = successor.left
    end

    curr.data = successor.data

    if successor_parent.left == successor
      successor_parent.left = successor.right
    else
      successor_parent.right = successor.right
    end

    root
    end
  end

end