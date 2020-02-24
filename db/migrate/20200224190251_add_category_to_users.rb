class AddCategoryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :category, :boolean
  end
end
