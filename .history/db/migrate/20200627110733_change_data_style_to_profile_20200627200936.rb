class ChangeDataStyleToProfile < ActiveRecord::Migration[5.2]
  def change
      change_column :gender_id, :integer
      change_column :address_id, :integer
      change_column :personality_id, :integer
      change_column :special_skill_id, :integer
  end
end
