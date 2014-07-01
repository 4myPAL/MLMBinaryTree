class Network < ActiveRecord::Base
  
  ADDED_BY_COLUMN = 'added_by_id'
  
  belongs_to :user
  belongs_to :parent, class: Network
  belongs_to :left, class: Network
  belongs_to :right, class: Network
  belongs_to :added, class: Network, foreign_key: ADDED_BY_COLUMN
  
  def leaf?
    left.nil? && right.nil?
  end
  
  def full?
    not(left.nil? || right.nil?)
  end
  
  def has_sibling?
    not(parent.left.nil? || parent.right.nil?)
  end
  
  protected
  def self.pairs_count(node)
    return 0 if node.nil?
    return (node.full? ? 1 : 0) + pairs_count(node.left) + pairs_count(node.right)
  end
  
  def self.get_tree(containers, node, first = false)
    containers.push(node)
    get_tree(containers, node.left) unless node.left.nil?
    get_tree(containers, node.right) unless node.right.nil?
    return containers
  end
  
  def self.get_last_leaf_node(node)
    # Return node if left child node is nil
    return node if node.left.nil?
    
    # Loop to the last of the left node and return it
    the_node = node
    begin
      the_node = the_node.left
    end until the_node.left.nil?
    return the_node
  end
  
  def self.insert_node(new_user, parent_user = nil)
    transaction do
      node = new(user: new_user)
      
      unless parent_user.nil?
        # Set the parent leaf node
        the_parent = find_by(user: parent_user)
        (the_parent.left.nil?) ? the_parent.update!(left: node) : the_parent.update!(right: node)
        
        # Set the parent of new node
        node.parent = the_parent
        
        # Set the referral of new node
        the_added = find_by(user: new_user.referral)
        node.added = the_added
      end
      
      node.save!
      return true
    end
    false
  end
  
  def self.delete_node(the_user)
    transaction do
      the_node = find_by(user: the_user)
      if the_node
        the_parent = the_node.parent
        
        if the_node.leaf? # Remove the node
          # Set the parent leaf to nil
          (the_parent.left == the_node) ? the_parent.update!(left: nil) : the_parent.update!(right: nil)
        else
          # Get the last node on the left
          the_left_most = get_last_leaf_node(the_node)
          
          # Loop Move the parent right leaf
          # to the left most leaf
          begin
            the_left_most.update!(right: the_left_most.parent.right)
            the_left_most = the_left_most.parent
          end until the_left_most == the_node
          
          # Set pointer of the node before deleted
          the_left = the_node.left
          the_parent = the_node.parent
          
          # Connect the each other
          the_left.update!(parent: the_parent)
          (the_parent.left == the_node) ? the_parent.update!(left: the_left) : the_parent.update!(right: the_left)
        end
        
        the_node.destroy!
      end
      
      return true
    end
    false
  end
  
end
