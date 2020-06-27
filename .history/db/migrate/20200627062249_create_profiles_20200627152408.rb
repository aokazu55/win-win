class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.date :date_of_birth
      t.string :gender_id
      t.string :address_id
      t.string :personality_id
      t.string :special_skill_id
      t.text :introduce
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
