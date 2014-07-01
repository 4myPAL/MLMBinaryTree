class BinaryNode
  @id = null
  @name = null
  @parent_node = null
  @left_node = null
  @right_node = null
  @parent_id = null
  @left_id = null
  @right_id = null
  @personal = null
  @added_by_id = null
  
  constructor: (node) ->
    {@id, @name, @parent_id, @left_id, @right_id, @added_by_id} = node
    @parent_node = null
    @left_node = null
    @right_node = null

root = exports ? window
root.BinaryNode = BinaryNode
