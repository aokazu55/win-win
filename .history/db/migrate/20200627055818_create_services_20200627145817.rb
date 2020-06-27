class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :main_service_id
      t.string :service_detail_id
      t.string :service_name
      t.string :image_id
      t.string :confidence_level_id
      t.integer :price
      t.string :working_time
      t.date :period_start
      t.date :period_end
      t.text :remark
      t.string :transportation_expenses
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
