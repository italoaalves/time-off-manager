class CreateOffTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :off_times do |t|
      t.belongs_to :vacation, null: false, foreign_key: true
      t.date :starts_at, null: false
      t.date :ends_at, null: false

      t.timestamps
    end
  end
end
