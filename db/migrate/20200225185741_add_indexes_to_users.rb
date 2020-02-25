class AddIndexesToUsers < ActiveRecord::Migration[5.2]
add_index :users, [:uid, :provider], unique: true

end
