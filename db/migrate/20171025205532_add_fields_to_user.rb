class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :display_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :place_of_birth, :string
    add_column :users, :nationality, :string
    add_column :users, :profile_picture, :string
  end
  
  def down
    remove_column :users, :display_name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :middle_name, :string
    remove_column :users, :date_of_birth, :date
    remove_column :users, :place_of_birth, :string
    remove_column :users, :nationality, :string
    remove_column :users, :profile_picture, :string
  end
end
