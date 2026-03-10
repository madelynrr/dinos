class Dino < ApplicationRecord
    validates :name, :health, :comment, :age_metrics, presence: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}

    enum :category, {herbivore: 0, carnivore: 1}, validate: true
    enum :period, {Cretaceous: 0, Jurassic: 1}, validate: true
    enum :diet, {plants: 0, meat: 1}, validate: true
end
