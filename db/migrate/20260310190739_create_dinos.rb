class CreateDinos < ActiveRecord::Migration[8.1]
  def change
    create_table :dinos do |t|
      t.string :name, null: false
      t.integer :category, null: false, default: 0
      t.integer :period, null: false, default: 0
      t.integer :diet, null: false, default: 0
      t.integer :age, null: false, default: 0
      t.integer :health, null: false, default: 100
      t.string :comment, null: false, default: "Alive"
      t.integer :age_metrics, null: false, default: 0

      t.timestamps
    end
  end
end
