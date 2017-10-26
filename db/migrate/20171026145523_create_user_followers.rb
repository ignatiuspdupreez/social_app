class CreateUserFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_followers do |t|
      t.integer :user_id
      t.integer :follower_id

      t.timestamps
    end
    
    add_foreign_key :user_followers, :users
    add_foreign_key :user_followers, :users, column: :follower_id,
                    primary_key: 'id'
  end
end
