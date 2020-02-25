class AddFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :city, :string
    add_column :users, :bio, :string
  end
end
