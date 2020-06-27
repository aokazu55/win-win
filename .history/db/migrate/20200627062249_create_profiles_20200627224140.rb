class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.date :date_of_birth
      t.integer :gender_id
      t.integer :address_id
      t.integer :personality_id
      t.integer :special_skill_id
      t.text :introduce
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
