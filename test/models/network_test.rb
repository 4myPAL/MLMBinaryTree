require 'test_helper'

class NetworkTest < ActiveSupport::TestCase
  setup do
    User.destroy_all
    Network.destroy_all
    
    @u1 = User.create(username: "User1")
    @u2 = User.create(username: "User2")
    @u3 = User.create(username: "User3")
    @u4 = User.create(username: "User4")
    @u5 = User.create(username: "User5")
    @u6 = User.create(username: "User6")
    @u7 = User.create(username: "User7")
    @u8 = User.create(username: "User8")
    @u9 = User.create(username: "User9")
    
    Network.insert_node(@u1)
    Network.insert_node(@u2, @u1)
    Network.insert_node(@u3, @u1) 
    Network.insert_node(@u4, @u2)
    Network.insert_node(@u5, @u2)
    Network.insert_node(@u6, @u3)
    Network.insert_node(@u7, @u3)
    Network.insert_node(@u8, @u4)
    Network.insert_node(@u9, @u4)
  end
  
  test "should insert node" do
    assert_equal Network.count, 9
  end
  
  test "should delete leaf node" do
    @network = Network.find_by(user: @u5)
    assert_equal @network.leaf?, true
    
    Network.delete_node(@u5)
    assert_equal Network.count, 8
  end
  
  test "should delete node that has children" do
    # Check the last leaf is a leaf
    @the_most_left_leaf = Network.get_last_leaf_node(Network.find_by(user: @u2))
    assert_equal @the_most_left_leaf.leaf?, true
    
    # Check the target node is has children
    @network = Network.find_by(user: @u2)
    @parent_id = @network.parent_id
    @left_id = @network.left_id
    assert_equal @network.leaf?, false
    
    # Delete the target node
    Network.delete_node(@u2)
    assert_equal Network.count, 8
    
    # Connect parent to left of the target node
    # So we don't lose the tree information
    @parent = Network.find(@parent_id)
    @left = Network.find(@left_id)
    assert_equal @parent.left, @left
    
    @the_most_left_leaf = Network.find(@the_most_left_leaf.id)
    assert_equal @the_most_left_leaf.leaf?, false
  end
end
