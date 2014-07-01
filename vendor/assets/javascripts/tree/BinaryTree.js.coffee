class BinaryTree
  @root = null
  @nodes = null
  
  constructor: (nodes) ->
    @nodes = nodes
    for data in nodes
      node = new BinaryNode(data)
      @.add(node)
      
  add: (the_node) ->
    unless @root?
      @root = the_node
    else
      current = @root
      while(true)
        if !current.left_node? and current.left_id == the_node.id
          console.log("LEFT")
          current.left_node = the_node
          the_node.parent_node = current
          break
        if !current.right_node? and current.right_id == the_node.id
          console.log("RIGHT")
          current.right_node = the_node
          the_node.parent_node = current
          break
        if current.left_node?
          current = current.left_node
        else if current.right_node?
          current = current.right_node
        else
          current = current.parent_node
      return
    
root = exports ? window
root.BinaryTree = BinaryTree
