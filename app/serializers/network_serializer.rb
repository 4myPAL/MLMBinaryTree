class NetworkSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_id, :left_id, :right_id, :added_by_id
  
  def name
    object.user.username
  end
end
