class CreateVacations < ActiveRecord::Migration[7.0]
  def change
    create_table :vacations do |t|
      t.string :year
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :balance
      t.date :expires_at

      t.timestamps
    end
  end
end
