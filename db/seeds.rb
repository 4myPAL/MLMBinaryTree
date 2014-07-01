max_users = 4094

User.create(username: "User1")
(max_users).times { |x|
  # Get random User ID that already exists
  id = rand(1..x+1)
  random_user = User.find(id)
  # Create new User with referral by the Random User
  User.create(username: "User#{x+2}", referral: random_user)
}

# Insert first User as the root of tree
user = User.find(1)
Network.insert_node(user)

(max_users / 2).times { |x|
  index1 = x + 1
  index2 = index1 * 2
  index3 = index2 + 1
  
  user  = User.find(index1)
  user1 = User.find(index2)
  user2 = User.find(index3)
  
  Network.insert_node(user1, user)
  Network.insert_node(user2, user)
}
