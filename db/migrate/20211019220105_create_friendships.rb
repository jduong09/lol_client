class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :from_user
      t.integer :to_user
      t.boolean :status

      t.timestamps
    end
  end
end
