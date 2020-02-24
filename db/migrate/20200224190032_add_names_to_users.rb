class AddNamesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dni, :string
    add_column :users, :location, :string
    add_column :users, :specialization, :string
    add_column :users, :age, :string
    add_column :users, :phone_number, :string
  end
end
