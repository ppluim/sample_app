class AddIndexToUsertsEmail < ActiveRecord::Migration
  def change
    add_index :userts, :email, unique: true
  end
end
