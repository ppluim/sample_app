class CreateUserts < ActiveRecord::Migration
  def change
    create_table :userts do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
