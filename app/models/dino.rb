class Dino < ApplicationRecord
    include Summarizable

    before_validation :update_dino_params

    validates :name, :health, :comment, :age_metrics, presence: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}

    enum :category, [:herbivore, :carnivore], validate: true
    enum :period, [:Cretaceous, :Jurassic], validate: true
    enum :diet, [:plants, :meat], validate: true

    # Though only used once, this type of number feels safer as a constant to me. If scaling, easier to update.
    AGE_PARAM = 100

    private

    def update_dino_params
        self.health = set_health(age)
        self.comment = set_comment(health)
        self.age_metrics = set_age_metrics(comment, age)
    end

    def set_health(age)
        age > 0 ? AGE_PARAM - age : 0
    end

    def set_comment(health)
        health > 0 ? 'Alive' : 'Dead'
    end

    def set_age_metrics(comment, age)
        comment == "Alive" && age > 1 ? age / 2 : 0
    end
end
