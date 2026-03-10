class ChangeDefaultValuesofColumns < ActiveRecord::Migration[8.1]
  def change
    change_column_default :dinos, :health, from: 100, to: 0
    change_column_default :dinos, :comment, from: "Alive", to: "Dead"
  end
end
