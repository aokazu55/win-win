class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :main_service_id, presence: true
      t.string :service_detail_id, presence: true
      t.string :service_name, presence: true
      t.string :image_id
      t.string :confidence_level_id, presence: true
      t.integer :price, presence: true
      t.string :working_time, presence: true
      t.date :period_start, presence: true
      t.date :period_end, presence: true
      t.text :remark, presence: true
      t.string :transportation_expenses
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
