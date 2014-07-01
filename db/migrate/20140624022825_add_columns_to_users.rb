class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :referral_by, index: true
  end
end
