class AddPasswordDigestToUserts < ActiveRecord::Migration
  def change
    add_column :userts, :password_digest, :string
  end
end
