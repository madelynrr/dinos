class RemoveCalculatedDefaultsFromDinoTableColumns < ActiveRecord::Migration[8.1]
  def change
    change_column_default :dinos, :health, from: 0, to: nil
    change_column_default :dinos, :comment, from: "Dead", to: nil
    change_column_default :dinos, :age_metrics, from: 0, to: nil
  end
end
