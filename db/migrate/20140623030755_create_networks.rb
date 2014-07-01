class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.references :user, index: true
      t.references :parent, index: true
      t.references :left, index: true
      t.references :right, index: true

      t.timestamps
    end
  end
end
