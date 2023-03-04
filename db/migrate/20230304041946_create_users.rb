class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :position
      t.integer :role, default:  0
      t.date :starting_date
      t.boolean :is_on_vacation

      t.timestamps
    end
  end
end
