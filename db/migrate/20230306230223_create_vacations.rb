class CreateVacations < ActiveRecord::Migration[7.0]
  def change
    create_table :vacations do |t|
      t.string :year, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :balance, null: false
      t.date :expires_at, null: false

      t.timestamps
    end
  end
end
