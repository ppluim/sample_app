class AddRememberTokenToUserts < ActiveRecord::Migration
  def change
    add_column :userts, :remember_token, :string
    add_index  :userts, :remember_token
  end
end
