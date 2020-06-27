class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :service_id

      t.timestamps null: false
    end
    add_index :likes, :user_id
    add_index :likes, :service_id
    add_index :likes, [:user_id, :service_id], unique: true
  end
end
