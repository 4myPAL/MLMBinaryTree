class AddColumnsToNetworks < ActiveRecord::Migration
  def change
    add_reference :networks, :added_by, index: true
  end
end
